"""Build tests of the EAM migration products (classic ECC views, mapping files, one system per bundle)."""
import argparse
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

    def test_ecc_build_rewrites_sql_view_names_and_ships_mapping(self):
        out, manifest = bp.build(["equipment"], prefix="ZACME_", package="ZACME_MIG", out=self.tmp / "e.zip", root=ECC)
        with zipfile.ZipFile(out) as zf:
            names = zf.namelist()
            ddl = zf.read("src/zacme_i_equipment.ddls.asddls").decode()
            mapping = zf.read("mapping/equipment/mapping.json").decode()
        self.assertIn("@AbapCatalog.sqlViewName: 'ZACME_EQ'", ddl)
        self.assertIn("define view ZACME_I_Equipment", ddl)
        self.assertNotIn("ZEMX_", ddl)
        self.assertIn("ZACME_I_Equipment", mapping)
        self.assertIn("mapping/docs/equipment.md", names)
        self.assertIn("mapping/MIGRATION_SEQUENCE.md", names)
        self.assertNotIn("mapping/work_center/mapping.json", names)
        self.assertEqual(manifest["resolved_modules"], ["equipment"])

    def test_sql_view_name_too_long_for_prefix(self):
        with self.assertRaises(bp.BuildError) as ctx:
            bp.check_lengths([("DDLS", "ZEMX_I_Equipment", "equipment")], "ZEMX_", "ZABCDEFGHIJKLM_",
                             {"DDLS": 30, "SQLVIEW": 16}, ECC)
        self.assertIn("SQL view name", str(ctx.exception))

    def test_no_reference_from_sql_view_name(self):
        self.assertEqual(bp.references("DDLS", "ZEMX_I_Equipment", "ZEMX_", ECC), set())
        self.assertEqual(bp.references("DDLS", "ZEMX_R_EquipmentCount", "ZEMX_", ECC), {"ZEMX_I_EQUIPMENT"})

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
