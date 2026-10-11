"""Unit tests for build_package.py against the EAM product (run: python3 -m unittest discover -s tools/tests)."""
import json
import os
import shutil
import sys
import tempfile
import unittest
import zipfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT))
os.environ["VDM_PRODUCT"] = "eam"
import build_package as bp  # noqa: E402


class BuildPackageTest(unittest.TestCase):
    def setUp(self):
        self.tmp = Path(tempfile.mkdtemp())

    def tearDown(self):
        shutil.rmtree(self.tmp)

    def names(self, manifest):
        return {o["name"] for o in manifest["objects"]}

    def test_single_module_excludes_link_views(self):
        _, manifest = bp.build(["equipment"], out=self.tmp / "a.zip")
        self.assertEqual(manifest["resolved_modules"], ["equipment"])
        self.assertEqual(manifest["link_views_included"], [])
        self.assertIn("ZEAM_B_Equipment", self.names(manifest))
        self.assertNotIn("ZEAM_B_EquipmentWithFuncLoc", self.names(manifest))

    def test_both_modules_include_link_views_and_their_dcl(self):
        _, manifest = bp.build(["equipment", "functional_location"], out=self.tmp / "b.zip")
        self.assertEqual(manifest["link_views_included"],
                         ["ZEAM_B_EquipmentWithFuncLoc", "ZEAM_B_FuncLocWithEquipment"])
        types = {(o["type"], o["name"]) for o in manifest["objects"]}
        self.assertIn(("DCLS", "ZEAM_B_EquipmentWithFuncLoc"), types)

    def test_prefix_and_package_rewrite(self):
        out, manifest = bp.build(["equipment"], prefix="ZACME_", package="ZACME_EAM",
                                 out=self.tmp / "c.zip", with_tests=True)
        with zipfile.ZipFile(out) as zf:
            files = zf.namelist()
            self.assertIn("src/zacme_i_equipment.ddls.asddls", files)
            self.assertFalse([f for f in files if "zeam_" in f.lower()])
            body = zf.read("src/zacme_i_equipment.ddls.asddls").decode()
            self.assertIn("define view entity ZACME_I_Equipment", body)
            self.assertIn("as select from ZACME_B_Equipment", body)
            self.assertNotRegex(body, r"(?i)(?<![A-Za-z0-9_])zeam_")
            test = zf.read("src/zacme_cl_equipment_test.clas.abap").decode()
            self.assertIn("'ZACME_B_EQUIPMENT'", test)
            self.assertIn("FROM zacme_b_equipment", test)
            self.assertEqual(json.loads(zf.read("BUILD_MANIFEST.json"))["target_package"], "ZACME_EAM")

    def test_namespace_prefix_file_names(self):
        out, _ = bp.build(["functional_location"], prefix="/ACME/", package="/ACME/EAM", out=self.tmp / "d.zip")
        with zipfile.ZipFile(out) as zf:
            self.assertIn("src/#acme#i_funcloc.ddls.asddls", zf.namelist())
            self.assertIn("<DDLNAME>/ACME/I_FUNCLOC</DDLNAME>", zf.read("src/#acme#i_funcloc.ddls.xml").decode())

    def test_name_length_limit(self):
        with self.assertRaises(bp.BuildError):
            bp.build(["equipment", "functional_location"], prefix="ZVERYLONGPREFIX_", out=self.tmp / "e.zip")

    def test_invalid_prefix(self):
        for bad in ("ACME_", "ZACME", "/A/", "Z-ACME_"):
            with self.assertRaises(bp.BuildError, msg=bad):
                bp.build(["equipment"], prefix=bad, out=self.tmp / "f.zip")

    def test_lowercase_prefix_is_normalized(self):
        _, manifest = bp.build(["equipment"], prefix="zacme_", out=self.tmp / "f2.zip")
        self.assertEqual(manifest["target_prefix"], "ZACME_")

    def test_unknown_module(self):
        with self.assertRaises(bp.BuildError):
            bp.build(["does_not_exist"], out=self.tmp / "g.zip")

    def test_hard_dependency_resolution_and_cycle(self):
        modules = {
            "a": {"name": "a", "hard_dependencies": ["b"]},
            "b": {"name": "b", "hard_dependencies": ["c"]},
            "c": {"name": "c", "hard_dependencies": []},
        }
        self.assertEqual(bp.resolve_modules(["a"], modules), ["c", "b", "a"])
        modules["c"]["hard_dependencies"] = ["a"]
        with self.assertRaises(bp.BuildError):
            bp.resolve_modules(["a"], modules)

    def test_activation_order_respects_references(self):
        _, manifest = bp.build(["equipment", "functional_location"], out=self.tmp / "h.zip")
        order = [(o["type"], o["name"]) for o in manifest["objects"]]
        pos = {k: i for i, k in enumerate(order)}
        self.assertLess(pos[("DDLS", "ZEAM_B_EquipmentText")], pos[("DDLS", "ZEAM_B_Equipment")])
        self.assertLess(pos[("DDLS", "ZEAM_B_Equipment")], pos[("DDLS", "ZEAM_I_Equipment")])
        self.assertLess(pos[("DDLS", "ZEAM_I_Equipment")], pos[("DDLS", "ZEAM_C_EquipmentQ")])
        self.assertLess(pos[("DDLS", "ZEAM_B_FuncLoc")], pos[("DDLS", "ZEAM_B_EquipmentWithFuncLoc")])
        self.assertLess(pos[("DCLS", "ZEAM_B_Equipment")], pos[("DCLS", "ZEAM_I_Equipment")])
        self.assertLess(pos[("DDLS", "ZEAM_I_Equipment")], pos[("DDLX", "ZEAM_I_Equipment")])

    def test_three_module_link_needs_all_three(self):
        _, two = bp.build(["maintenance_order", "equipment"], out=self.tmp / "i.zip")
        self.assertNotIn("ZEAM_I_MaintOrderWithTechObj", self.names(two))
        self.assertIn("ZEAM_B_EquipmentWithOrder", self.names(two))
        _, three = bp.build(["maintenance_order", "equipment", "functional_location"], out=self.tmp / "j.zip")
        self.assertIn("ZEAM_I_MaintOrderWithTechObj", self.names(three))
        self.assertIn("ZEAM_C_MaintOrderTechObjQ", self.names(three))
        types = {(o["type"], o["name"]) for o in three["objects"]}
        self.assertNotIn(("DCLS", "ZEAM_C_MaintOrderTechObjQ"), types)

    def test_transitive_hard_dependency_enables_link(self):
        _, manifest = bp.build(["rpt_reliability", "equipment"], out=self.tmp / "k.zip")
        self.assertEqual(sorted(manifest["auto_included_dependencies"]), ["maintenance_notification", "rpt_downtime"])
        self.assertIn("ZEAM_I_EquipmentReliability", self.names(manifest))
        self.assertIn("ZEAM_B_EquipmentWithNotif", self.names(manifest))

    def test_full_library_fits_six_character_prefix(self):
        _, manifest = bp.build(sorted(bp.load_modules()), prefix="ZACME_", out=self.tmp / "l.zip", with_tests=True)
        self.assertTrue(all(len(o["name"]) <= 30 for o in manifest["objects"]))


if __name__ == "__main__":
    unittest.main()
