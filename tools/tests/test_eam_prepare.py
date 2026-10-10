"""Customer workflow tests: backdated/future/deleted states, scope and child comparisons."""
import json
import sys
import tempfile
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent.parent))
import eam_prepare as ep
import mig_reconcile as mr


class SnapshotTest(unittest.TestCase):
    contract = {"identity": ["Object"], "valid_from": "Start", "counter": "Counter", "deletion": "Deleted"}

    def test_future_changes_are_excluded_and_deletion_does_not_resurrect_history(self):
        rows = [{"Object": "A", "Start": "20240101", "Counter": "1", "Deleted": ""},
                {"Object": "A", "Start": "20250101", "Counter": "2", "Deleted": "X"},
                {"Object": "A", "Start": "20270101", "Counter": "3", "Deleted": ""}]
        self.assertEqual(ep.snapshot(rows, self.contract, "20261010"), [])
        self.assertEqual(ep.snapshot(rows, self.contract, "20241010"), [rows[0]])

    def test_numeric_counters_and_date_precedence(self):
        rows = [{"Object": "A", "Start": "20240101", "Counter": "10", "Deleted": ""},
                {"Object": "A", "Start": "20240101", "Counter": "9", "Deleted": ""},
                {"Object": "A", "Start": "20250101", "Counter": "1", "Deleted": ""}]
        self.assertEqual(ep.snapshot(rows, self.contract, "20241010"), [rows[0]])
        self.assertEqual(ep.snapshot(rows, self.contract, "20261010"), [rows[2]])

    def test_cancelled_measurements_are_excluded_before_latest_selection(self):
        contract = {"identity": ["POINT"], "valid_from": "IDATE", "order_fields": ["ITIME"],
                    "counter": "MDOCM", "exclude": {"CANCL": ["X"]}}
        rows = [{"POINT": "P", "IDATE": "20261001", "ITIME": "080000", "MDOCM": "99", "CANCL": ""},
                {"POINT": "P", "IDATE": "20261001", "ITIME": "090000", "MDOCM": "1", "CANCL": ""},
                {"POINT": "P", "IDATE": "20261002", "ITIME": "090000", "MDOCM": "100", "CANCL": "X"}]
        self.assertEqual(ep.snapshot(rows, contract, "20261010"), [rows[1]])

    def test_overlapping_equipment_segments_fail(self):
        contract = {"identity": ["Equipment"], "valid_from": "Start", "valid_to": "End", "mode": "interval"}
        rows = [{"Equipment": "E", "Start": "20240101", "End": "20271231"},
                {"Equipment": "E", "Start": "20250101", "End": "99991231"}]
        with self.assertRaises(mr.InputError):
            ep.snapshot(rows, contract, "20261010")

    def test_ecm_is_not_silently_treated_as_date_only(self):
        rows = [{"Object": "A", "Start": "20240101", "Counter": "1", "Deleted": "", "Change": "CN1"}]
        contract = {**self.contract, "change_number": "Change"}
        with self.assertRaises(mr.InputError):
            ep.snapshot(rows, contract, "20261010")
        contract["eligibility"] = "Eligible"
        self.assertEqual(ep.snapshot([{**rows[0], "Eligible": "N"}], contract, "20261010"), [])
        self.assertEqual(ep.snapshot([{**rows[0], "Eligible": "Y"}], contract, "20261010"), [{**rows[0], "Eligible": "Y"}])

    def test_ambiguous_and_invalid_states_fail(self):
        row = {"Object": "A", "Start": "20240101", "Counter": "1", "Deleted": ""}
        with self.assertRaises(mr.InputError):
            ep.snapshot([row, row], self.contract, "20261010")
        with self.assertRaises(mr.InputError):
            ep.snapshot([{**row, "Start": "20240230"}], self.contract, "20261010")


class CohortTest(unittest.TestCase):
    def test_nested_service_packages_and_cycles(self):
        rows = [{"PACKNO": "1", "SUB_PACKNO": "2"}, {"PACKNO": "2", "SUB_PACKNO": "0000"},
                {"PACKNO": "9", "SUB_PACKNO": ""}]
        self.assertEqual(ep.closure(rows, [{"Root": "1"}], "PACKNO", "SUB_PACKNO", "Root"), rows[:2])
        with self.assertRaises(mr.InputError):
            ep.closure([rows[0]], [{"Root": "1"}], "PACKNO", "SUB_PACKNO", "Root")
        with self.assertRaises(mr.InputError):
            ep.closure([rows[0], {"PACKNO": "2", "SUB_PACKNO": "1"}], [{"Root": "1"}], "PACKNO", "SUB_PACKNO", "Root")

    def test_children_are_restricted_to_the_same_composite_object_identity(self):
        rows = [{"Type": "IE", "Object": "1"}, {"Type": "OR", "Object": "1"}, {"Type": "IE", "Object": "2"}]
        parent = [{"Type": "IE", "Object": "1"}]
        self.assertEqual(ep.cohort(rows, parent, ["Type", "Object"], ["Type", "Object"]), rows[:1])

    def test_duplicate_parent_and_missing_columns_fail(self):
        with self.assertRaises(mr.InputError):
            ep.cohort([{"ID": "A"}], [{"ID": "A"}, {"ID": "A"}], ["ID"], ["ID"])
        with self.assertRaises(mr.InputError):
            ep.cohort([{"Wrong": "A"}], [{"ID": "A"}], ["ID"], ["ID"])

    def test_join_keeps_many_children_and_rejects_orphans(self):
        children = [{"Parent": "P", "Line": "1"}, {"Parent": "P", "Line": "2"}]
        result = ep.join(children, [{"ID": "P", "Business": "B"}], ["Parent"], ["ID"], {"BusinessKey": "Business"})
        self.assertEqual([r["BusinessKey"] for r in result], ["B", "B"])
        with self.assertRaises(mr.InputError):
            ep.join(children, [], ["Parent"], ["ID"], {"BusinessKey": "Business"})


class CustomerFlowTest(unittest.TestCase):
    def test_project_publishes_expected_outputs_and_leaves_no_partial_directory(self):
        import eam_run
        examples = Path(__file__).resolve().parents[2] / "packages/eam_mig_ecc/customer/examples"
        with tempfile.TemporaryDirectory() as folder:
            output = Path(folder) / "success"
            eam_run.run(examples / "workflow.json", output)
            rows = mr.read_csv(output / "selected_equipment_segments.csv")
            self.assertEqual(len(rows), 1)
            self.assertEqual(rows[0]["IWERK"], "2000")
            self.assertEqual(len(mr.read_csv(output / "selected_service_lines.csv")), 2)
            self.assertEqual(len(mr.read_csv(output / "task_headers_at_cutover.csv")), 1)
            project = json.loads((examples / "workflow.json").read_text())
            project["inputs"] = {n: str(examples / p) for n, p in project["inputs"].items()}
            project["steps"].append({"name": "bad", "operation": "cohort", "input": "segments",
                                    "parent": "selected_equipment", "child_keys": ["MISSING"], "parent_keys": ["EQUNR"]})
            path = Path(folder) / "bad.json"
            path.write_text(json.dumps(project))
            failed = Path(folder) / "failed"
            with self.assertRaises(mr.InputError):
                eam_run.run(path, failed)
            self.assertFalse(failed.exists())

    def test_every_documented_structure_has_an_executable_comparison_contract(self):
        root = Path(__file__).resolve().parents[2] / "packages/eam_mig_ecc"
        count = 0
        for path in root.glob("modules/*/mapping.json"):
            mapping = json.loads(path.read_text())
            for structure in mapping["structures"]:
                row = {f["element"]: f["element"] for f in structure["fields"]}
                report, ok = ep.compare_structure(mapping, structure["consumption_view"], [row], [row])
                self.assertTrue(ok)
                fields = [e for e in row if e not in structure["keys"]]
                if fields:
                    self.assertFalse(ep.compare_structure(mapping, structure["consumption_view"], [row], [{**row, fields[0]: "DIFFERENT"}])[1])
                count += 1
        self.assertGreaterEqual(count, 41)

    def test_actual_ddic_keys_drive_raw_comparison_and_exclude_client(self):
        mapping = ep.raw_contract([{"FIELDNAME": "MANDT", "KEYFLAG": "X"},
                                  {"FIELDNAME": "ID", "KEYFLAG": "X"}, {"FIELDNAME": "VALUE", "KEYFLAG": ""}])
        self.assertEqual(mapping["reconciliation"]["compare"], {"key": ["ID"], "fields": ["VALUE"]})

    def test_text_whitespace_is_significant_when_requested(self):
        mapping = {"module": "text", "reconciliation": {"compare": {"key": ["ID"], "fields": ["Text"]}}}
        result = mr.records(mapping, [{"ID": "1", "Text": " leading"}], [{"ID": "1", "Text": "leading"}], mr.Maps(None), exact_fields=["Text"])
        self.assertIn("Text", result["mismatches"])

    def test_customer_cli_preserves_payload_and_protects_inputs(self):
        with tempfile.TemporaryDirectory() as folder:
            base = Path(folder)
            source = base / "source.csv"
            contract = base / "alias.json"
            source.write_text('ID,TEXT\n1," leading "\n', encoding="utf-8")
            contract.write_text(json.dumps({"fields": {"Key": "ID", "Text": "TEXT"}}))
            output = base / "output.csv"
            self.assertEqual(ep.main(["aliases", "--input", str(source), "--contract", str(contract), "--out", str(output)]), 0)
            self.assertEqual(mr.read_csv(output, preserve_values=True)[0]["Text"], " leading ")
            self.assertTrue(Path(str(output) + ".audit.json").exists())
            self.assertEqual(ep.main(["aliases", "--input", str(source), "--contract", str(contract), "--out", str(source)]), 2)


if __name__ == "__main__":
    unittest.main()
