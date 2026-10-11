"""Unit tests for build_bundle.py (run: python3 -m unittest discover -s tools/tests)."""
import argparse
import re
import shutil
import sys
import tempfile
import unittest
import zipfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT))
import build_bundle as bb  # noqa: E402


def sel(*modules, product_all=None, all_=False):
    return argparse.Namespace(modules=list(modules), product_all=product_all, all=all_)


class BuildBundleTest(unittest.TestCase):
    def setUp(self):
        self.tmp = Path(tempfile.mkdtemp())

    def tearDown(self):
        shutil.rmtree(self.tmp)

    def names(self, m):
        return {o["name"] for o in m["objects"]}

    def test_bridge_needs_both_products(self):
        _, one = bb.build(sel("eam:equipment"), "ZACME_", "ZACME_VDM", self.tmp / "a.zip")
        self.assertEqual(one["bridge_links_included"], [])
        _, two = bb.build(sel("eam:equipment", "fi_aa:fixed_asset"), "ZACME_", "ZACME_VDM", self.tmp / "b.zip")
        self.assertEqual(two["bridge_links_included"], ["ZBRG_B_EquipmentWithAsset"])
        self.assertIn("ZACME_B_EquipmentWithAsset", self.names(two))

    def test_hard_dependency_enables_bridge(self):
        _, m = bb.build(sel("eam:equipment", "fi_aa:rpt_asset_balance"), "ZACME_", "ZACME_VDM", self.tmp / "c.zip")
        self.assertEqual(m["products"]["fi_aa"]["auto_included_dependencies"], ["asset_transaction"])
        self.assertIn("ZBRG_I_EquipmentAssetValue", m["bridge_links_included"])

    def test_all_products_one_prefix_no_leftovers(self):
        out, m = bb.build(sel(all_=True), "ZACME_", "ZACME_VDM", self.tmp / "d.zip", with_tests=True)
        self.assertGreater(len(m["objects"]), 400)
        leftover = re.compile(r"(?<![A-Za-z0-9_/#])(ZEAM|ZFAA|ZMMV|ZQMV|ZPSV|ZPPV|ZCOV|ZFIV|ZSDV|ZBRG)_", re.I)
        with zipfile.ZipFile(out) as zf:
            for f in zf.namelist():
                if f.startswith("src/"):
                    self.assertFalse(leftover.search(zf.read(f).decode()), f)
            self.assertTrue(all(f.startswith(("src/zacme_", "src/package.devc.xml")) for f in zf.namelist() if f.startswith("src/")))

    def test_order_puts_bridge_after_its_sources(self):
        _, m = bb.build(sel("eam:equipment", "fi_aa:fixed_asset"), "ZACME_", "ZACME_VDM", self.tmp / "e.zip")
        pos = {(o["type"], o["name"]): i for i, o in enumerate(m["objects"])}
        self.assertLess(pos[("DDLS", "ZACME_B_FixedAsset")], pos[("DDLS", "ZACME_B_EquipmentWithAsset")])
        self.assertLess(pos[("DCLS", "ZACME_B_Equipment")], pos[("DCLS", "ZACME_B_EquipmentWithAsset")])

    def test_selection_errors(self):
        for bad in (sel("equipment"), sel("eam:nope"), sel("bridge:x"), sel()):
            with self.assertRaises(bb.BundleError):
                bb.build(bad, "ZACME_", "ZACME_VDM", self.tmp / "f.zip")

    def test_namespace_prefix(self):
        out, m = bb.build(sel("eam:equipment", "fi_aa:fixed_asset"), "/ACME/", "/ACME/VDM", self.tmp / "g.zip")
        with zipfile.ZipFile(out) as zf:
            self.assertIn("src/#acme#b_equipmentwithasset.ddls.asddls", zf.namelist())


if __name__ == "__main__":
    unittest.main()
