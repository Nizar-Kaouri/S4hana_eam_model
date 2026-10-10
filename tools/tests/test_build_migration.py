"""Build tests of the EAM migration products (3-layer ECC views, mapping table, mapping files, one system per bundle)."""
import argparse
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
os.environ.setdefault("VDM_PRODUCT", "eam")
import build_package as bp  # noqa: E402
import build_bundle as bb  # noqa: E402

ECC = ROOT / "packages" / "eam_mig_ecc"


class BuildMigrationTest(unittest.TestCase):
    def setUp(self):
        self.tmp = Path(tempfile.mkdtemp())

    def tearDown(self):
        shutil.rmtree(self.tmp)

    def test_ecc_build_pulls_core_and_work_center_and_rewrites_everything(self):
        out, manifest = bp.build(["equipment"], prefix="ZACME_", package="ZACME_MIG", out=self.tmp / "e.zip", root=ECC)
        self.assertEqual(sorted(manifest["resolved_modules"]), ["core", "equipment", "work_center"])
        with zipfile.ZipFile(out) as zf:
            names = zf.namelist()
            comp = zf.read("src/zacme_i_equipment.ddls.asddls").decode()
            cons = zf.read("src/zacme_c_equipmentmig.ddls.asddls").decode()
            mapping = zf.read("mapping/equipment/mapping.json").decode()
        self.assertIn("@AbapCatalog.sqlViewName: 'ZACME_EQ'", comp)
        self.assertIn("define view ZACME_I_Equipment", comp)
        self.assertIn("as select from ZACME_I_Equipment as src", cons)
        self.assertIn("key src.Equipment", cons)
        self.assertNotIn("coalesce", cons)
        for text in (comp, cons, mapping):
            self.assertNotIn("ZEMX_", text.upper())
        self.assertIn("mapping/docs/equipment.md", names)
        self.assertIn("mapping/MIGRATION_SEQUENCE.md", names)
        self.assertNotIn("mapping/task_list/mapping.json", names)
        self.assertFalse(any(n.endswith(".tabl.xml") for n in names))

    def test_layers_reference_only_lower_layers(self):
        modules = {m["name"]: m for m in (json.loads(p.read_text()) for p in ECC.glob("modules/*/module.json"))}
        layer = {n: lay for m in modules.values() for lay in ("basic", "composite", "consumption") for n in m["objects"][lay]}
        rank = {"basic": 0, "composite": 1, "consumption": 2}
        for name, lay in layer.items():
            refs = bp.references("DDLS", name, "ZEMX_", ECC)
            for ref in refs:
                ref_name = next(n for n in layer if n.upper() == ref)
                self.assertLessEqual(rank[layer[ref_name]], rank[lay], f"{name} ({lay}) reads {ref_name}")
            if lay == "basic":
                text = bp.strip_comments((ECC / "src" / f"{name.lower()}.ddls.asddls").read_text(), "DDLS")
                self.assertRegex(text, r"as select from [a-z0-9_]+\s", f"basic view {name} must select from one table")
                self.assertNotRegex(text, r"\bjoin\b", f"basic view {name} must not join")
                for ref in refs:  # only associations to other basic views
                    ref_name = next(n for n in layer if n.upper() == ref)
                    self.assertEqual(layer[ref_name], "basic", f"{name} associates {ref_name}")
            if lay == "composite":
                text = (ECC / "src" / f"{name.lower()}.ddls.asddls").read_text()
                self.assertNotIn("left outer join", text, f"{name}: use an association instead of a left outer join")

    def test_sql_view_name_too_long_for_prefix(self):
        with self.assertRaises(bp.BuildError) as ctx:
            bp.check_lengths([("DDLS", "ZEMX_I_Equipment", "equipment")], "ZEMX_", "ZABCDEFGHIJKLM_",
                             {"DDLS": 30, "SQLVIEW": 16}, ECC)
        self.assertIn("SQL view name", str(ctx.exception))

    def test_sql_view_name_is_not_a_reference(self):
        self.assertEqual(bp.references("DDLS", "ZEMX_I_EquipmentDesc", "ZEMX_", ECC), set())

    def test_bundle_refuses_mixed_systems(self):
        args = argparse.Namespace(all=False, product_all=None, modules=["eam:equipment", "eam_mig_ecc:equipment"])
        with self.assertRaises(bb.BundleError) as ctx:
            bb.build(args, "ZACME_", "ZACME_VDM", out=self.tmp / "b.zip")
        self.assertIn("one system", str(ctx.exception))

    def test_bundle_all_excludes_ecc_products(self):
        args = argparse.Namespace(all=True, product_all=None, modules=[])
        _, manifest = bb.build(args, "ZACME_", "ZACME_VDM", out=self.tmp / "c.zip")
        self.assertNotIn("eam_mig_ecc", manifest["products"])
        self.assertIn("eam_mig_s4", manifest["products"])


if __name__ == "__main__":
    unittest.main()
