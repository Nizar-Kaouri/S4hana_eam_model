"""Unit tests of tools/mig_reconcile.py on small CSV exports (no SAP system needed)."""
import sys
import tempfile
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent.parent))
import mig_reconcile as mr  # noqa: E402


def write(folder, name, text):
    p = Path(folder) / name
    p.write_text(text, encoding="utf-8")
    return str(p)


class CountsTest(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        self.dir = self.tmp.name
        self.mapping = mr.load_mapping("eam_mig_ecc", "equipment")

    def tearDown(self):
        self.tmp.cleanup()

    def run_counts(self, src, tgt, maps=None):
        return mr.counts(self.mapping, mr.read_csv(write(self.dir, "s.csv", src)),
                         mr.read_csv(write(self.dir, "t.csv", tgt)), mr.Maps(maps))

    def test_equal_counts(self):
        csv_ = "MaintenancePlanningPlant,EquipmentCategory,RecordCount\n1000,M,5\n1000,P,2\n"
        res = self.run_counts(csv_, csv_)
        self.assertEqual(res["differences"], [])
        self.assertEqual((res["source_total"], res["target_total"]), (7, 7))

    def test_values_are_compared_unchanged_by_default(self):
        self.assertEqual(self.mapping["reconciliation"]["source_values"], "source")
        maps = Path(self.dir) / "maps"
        maps.mkdir()
        write(maps, "value_map_maintenanceplanningplant.csv", "source,target\nP100,WRONG\n")
        csv_ = "MaintenancePlanningPlant,EquipmentCategory,RecordCount\nP100,M,8\n"
        self.assertEqual(self.run_counts(csv_, csv_, maps)["differences"], [])

    def test_load_program_value_changes_with_translate(self):
        self.mapping["reconciliation"]["source_values"] = "needs_maps"
        maps = Path(self.dir) / "maps"
        maps.mkdir()
        write(maps, "value_map_maintenanceplanningplant.csv", "source,target,comment\n1000,P100,\n1100,P100,merged\n")
        src = "MaintenancePlanningPlant,EquipmentCategory,RecordCount\n1000,M,5\n1100,M,3\n"
        tgt = "MaintenancePlanningPlant;EquipmentCategory;RecordCount\nP100;M;8\n"
        self.assertEqual(self.run_counts(src, tgt, maps)["differences"], [])

    def test_difference_reported(self):
        src = "MaintenancePlanningPlant,EquipmentCategory,RecordCount\n1000,M,5\n"
        tgt = "MaintenancePlanningPlant,EquipmentCategory,RecordCount\n1000,M,4\n2000,M,1\n"
        res = self.run_counts(src, tgt)
        self.assertEqual(res["differences"], [(("1000", "M"), 5, 4), (("2000", "M"), 0, 1)])
        self.assertIn("2 difference(s)", mr.counts_report("equipment", res))

    def test_missing_column(self):
        with self.assertRaises(mr.InputError):
            self.run_counts("Plant,RecordCount\n1000,1\n", "Plant,RecordCount\n1000,1\n")


class RecordsTest(unittest.TestCase):
    HEAD = ("Equipment,EquipmentCategory,TechnicalObjectType,MaintenancePlanningPlant,FunctionalLocation,"
            "SuperordinateEquipment,MaintenancePlant,CompanyCode,CostCenter,Material,SerialNumber,"
            "ManufacturerSerialNumber,ConstructionYear,InventoryNumber")

    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        self.dir = Path(self.tmp.name)
        self.mapping = mr.load_mapping("eam_mig_ecc", "equipment")

    def tearDown(self):
        self.tmp.cleanup()

    def row(self, equi, plant="1000", cat="M", extra=""):
        return f"{equi},{cat},PUMP,{plant},FL-1,,{plant},1000,4711,,,,2019,{extra}\n"

    def run_records(self, src, tgt, maps=None, **kw):
        s = self.HEAD + ",IsMarkedForDeletion\n" + src
        return mr.records(self.mapping, mr.read_csv(write(self.dir, "s.csv", s)),
                          mr.read_csv(write(self.dir, "t.csv", self.HEAD + "\n" + tgt)), mr.Maps(maps), **kw)

    def test_complete_and_equal(self):
        res = self.run_records(self.row("10000001", extra="INV1,"), self.row("10000001", extra="INV1"))
        self.assertEqual((res["missing"], res["extra"], res["mismatches"]), ([], [], {}))
        self.assertTrue(mr.records_report("equipment", res)[1])

    def test_key_map_and_value_map(self):
        maps = self.dir / "maps"
        maps.mkdir()
        write(maps, "key_map_equipment.csv", "source,target\n10000001,EQ-NEW-1\n")
        write(maps, "value_map_maintenanceplanningplant.csv", "source,target\n1000,P100\n")
        write(maps, "value_map_maintenanceplant.csv", "source,target\n1000,P100\n")
        res = self.run_records(self.row("10000001", extra="INV1,"), self.row("EQ-NEW-1", plant="P100", extra="INV1"), maps,
                               translate=True)
        self.assertEqual((res["missing"], res["extra"], res["mismatches"]), ([], [], {}))

    def test_missing_extra_and_field_difference(self):
        src = self.row("1", extra="A,") + self.row("2", extra="B,")
        tgt = self.row("2", cat="P", extra="B") + self.row("3", extra="C")
        res = self.run_records(src, tgt)
        self.assertEqual(res["missing"], [("1",)])
        self.assertEqual(res["extra"], [("3",)])
        self.assertEqual(list(res["mismatches"]), ["EquipmentCategory"])
        self.assertFalse(mr.records_report("equipment", res)[1])

    def test_scope_filter_and_leading_zeros(self):
        self.mapping["scope"] = {"filter": "IsMarkedForDeletion = ''"}
        src = self.row("000000000010000001", extra="A,") + self.row("000000000010000002", extra="B,X")
        res = self.run_records(src, self.row("10000001", extra="A"), apply_scope=True, strip_zeros=True)
        self.assertEqual((res["missing"], res["extra"]), ([], []))
        self.assertTrue(any("kept 1 of 2" in n for n in res["notes"]))

    def test_duplicate_source_and_target_keys_are_rejected(self):
        row = {e: "A" for e in self.mapping["reconciliation"]["compare"]["key"] + self.mapping["reconciliation"]["compare"]["fields"]}
        conflicting = dict(row, EquipmentCategory="DIFFERENT")
        for source, target in [([conflicting, row], [row]), ([row], [conflicting, row])]:
            with self.assertRaisesRegex(mr.InputError, "duplicate business key"):
                mr.records(self.mapping, source, target, mr.Maps(None))

    def test_normalization_collision_is_rejected(self):
        row = {e: "A" for e in self.mapping["reconciliation"]["compare"]["key"] + self.mapping["reconciliation"]["compare"]["fields"]}
        a, b = dict(row, Equipment="0001"), dict(row, Equipment="1")
        with self.assertRaisesRegex(mr.InputError, "duplicate business key"):
            mr.records(self.mapping, [a, b], [b], mr.Maps(None), strip_zeros=True)

    def test_translation_collision_is_rejected(self):
        write(self.dir, "key_map_equipment.csv", "source,target\nOLD1,NEW\nOLD2,NEW\n")
        row = {e: "A" for e in self.mapping["reconciliation"]["compare"]["key"] + self.mapping["reconciliation"]["compare"]["fields"]}
        with self.assertRaisesRegex(mr.InputError, "duplicate business key"):
            mr.records(self.mapping, [dict(row, Equipment="OLD1"), dict(row, Equipment="OLD2")],
                       [dict(row, Equipment="NEW")], mr.Maps(self.dir), translate=True)

    def test_scope_parser(self):
        pred = mr.scope_filter("IsCompleted = '' and IsMarkedForDeletion = ''")
        self.assertTrue(pred({"IsCompleted": "", "IsMarkedForDeletion": ""}))
        self.assertFalse(pred({"IsCompleted": "X", "IsMarkedForDeletion": ""}))
        self.assertIsNone(mr.scope_filter("extract ZEMX_R_TaskListCurrent"))

    def test_cli_exit_codes(self):
        s = write(self.dir, "c.csv", "MaintenancePlanningPlant,EquipmentCategory,RecordCount\n1000,M,1\n")
        t = write(self.dir, "d.csv", "MaintenancePlanningPlant,EquipmentCategory,RecordCount\n1000,M,2\n")
        out = str(self.dir / "r.md")
        self.assertEqual(mr.main(["counts", "--module", "equipment", "--source", s, "--target", s, "--out", out]), 0)
        self.assertEqual(mr.main(["counts", "--module", "equipment", "--source", s, "--target", t, "--out", out]), 1)
        self.assertEqual(mr.main(["counts", "--module", "nope", "--source", s, "--target", t, "--out", out]), 2)


if __name__ == "__main__":
    unittest.main()


class CsvIntegrityTest(unittest.TestCase):
    def test_multiline_fields_are_preserved(self):
        with tempfile.TemporaryDirectory() as folder:
            rows = mr.read_csv(write(folder, 'x.csv', 'Key,Text\n1,"first\nsecond"\n'))
            self.assertEqual(rows[0]['Text'], 'first\nsecond')

    def test_invalid_csv_is_rejected(self):
        with tempfile.TemporaryDirectory() as folder:
            for text in ('', 'A,A\n1,2\n', 'A,B\n1\n', 'A,B\n1,2,3\n'):
                with self.subTest(text=text), self.assertRaises(mr.InputError):
                    mr.read_csv(write(folder, 'x.csv', text))

    def test_empty_exports_still_require_the_correct_header(self):
        with tempfile.TemporaryDirectory() as folder:
            rows = mr.read_csv(write(folder, 'x.csv', 'Wrong,Header\n'))
            with self.assertRaises(mr.InputError):
                mr.require(rows, ['Equipment'], 'source')

    def test_counts_are_exact_and_reject_invalid_values(self):
        mapping = {'reconciliation': {'dimensions': [], 'measure': 'RecordCount'}}
        value = '9007199254740993'
        result = mr.counts(mapping, [{'RecordCount':value}], [{'RecordCount':value}], mr.Maps(None))
        self.assertEqual(result['source_total'], int(value))
        for value in ('', '1.5', '-1', 'NaN', 'Infinity'):
            with self.subTest(value=value), self.assertRaises(mr.InputError):
                mr.counts(mapping, [{'RecordCount':value}], [], mr.Maps(None))
