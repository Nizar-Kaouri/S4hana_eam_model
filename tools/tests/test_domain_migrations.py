"""Domain customer scenarios: cutover, financial signs and selected ZIP usability."""
import json
import os
import sys
import tempfile
import unittest
import zipfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / 'tools'))
sys.path.insert(0, str(ROOT))
os.environ.setdefault('VDM_PRODUCT', 'eam')
import build_package as bp
import eam_run
import migration_business as mb
import gen_docs
from mig_reconcile import CsvRows, InputError


class BusinessTest(unittest.TestCase):
    def test_historic_open_population_includes_items_cleared_after_cutover(self):
        rows = CsvRows([
            {'ID': '001', 'Posting': '20261001', 'Clearing': '00000000'},
            {'ID': '002', 'Posting': '20261001', 'Clearing': '20261011'},
            {'ID': '003', 'Posting': '20261001', 'Clearing': '20261010'},
            {'ID': '004', 'Posting': '20261011', 'Clearing': ''}], ['ID', 'Posting', 'Clearing'])
        contract = {'key': ['ID'], 'posting_date': 'Posting', 'clearing_date': 'Clearing'}
        self.assertEqual([r['ID'] for r in mb.open_items([rows], contract, '20261010')], ['001', '002'])
        with self.assertRaises(InputError):
            mb.open_items([rows, rows], contract, '20261010')

    def test_credit_signs_and_currency_groups_use_decimal(self):
        columns = ['ID', 'Currency', 'Amount', 'Sign']
        source = CsvRows([dict(zip(columns, r)) for r in [('001', 'EUR', '0.30', 'S'), ('002', 'EUR', '0.20', 'H'), ('003', 'USD', '0.10', 'S')]], columns)
        contract = {'key': ['ID'], 'group_by': ['Currency'], 'metrics': [{'field': 'Amount', 'dimension': 'Currency', 'basis': 'unsigned', 'sign_field': 'Sign', 'signs': {'S': '1', 'H': '-1'}}]}
        self.assertEqual(str(mb.totals(source, contract)[('EUR', 'Amount')]), '0.10')
        self.assertEqual(mb.compare_totals(source, source, contract), [])
        changed = CsvRows([{**r, 'Amount': '0.31'} if r['ID'] == '001' else r for r in source], columns)
        self.assertEqual(len(mb.compare_totals(source, changed, contract)), 1)
        with self.assertRaises(InputError):
            mb.totals(CsvRows([{**source[0], 'Sign': '?'}], columns), contract)
        with self.assertRaises(InputError):
            mb.totals(CsvRows([{**source[0], 'Amount': 'NaN'}], columns), contract)
        # The global Decimal default has only 28 digits; large sums must not round.
        large = CsvRows([{**source[0], 'Amount': '123456789012345678901234567890.01'},
                         {**source[1], 'Amount': '123456789012345678901234567890.00'}], columns)
        self.assertEqual(str(mb.totals(large, contract)[('EUR', 'Amount')]), '0.01')

    def test_zero_missing_currency_group_is_still_a_difference(self):
        contract = {'key': ['ID'], 'group_by': ['Currency'], 'metrics': [{'field': 'Amount', 'dimension': 'Currency', 'basis': 'signed'}]}
        source = CsvRows([{'ID': '01', 'Currency': 'EUR', 'Amount': '0'}], ['ID', 'Currency', 'Amount'])
        self.assertEqual(len(mb.compare_totals(source, CsvRows([], source.columns), contract)), 1)


class DomainBuildTest(unittest.TestCase):
    def test_documentation_reports_projected_business_keys(self):
        view = 'define view ZTEST_I_Asset as select from anla {\n key anla.bukrs as CompanyCode,\n key anla.anln1 as MasterFixedAsset,\n key FixedAsset\n}'
        self.assertEqual(gen_docs.parse_view(view)['keys'], ['CompanyCode', 'MasterFixedAsset', 'FixedAsset'])

    def test_missing_approved_key_never_publishes_a_project(self):
        with tempfile.TemporaryDirectory() as folder:
            root = Path(folder)
            (root / 'export.csv').write_text('ID,Name\n001,One\n', encoding='utf-8')
            (root / 'scope.csv').write_text('ID\n002\n', encoding='utf-8')
            project = {'cutover': '20261010', 'inputs': {'Raw': 'export.csv', 'Scope': 'scope.csv'}, 'steps': [{'name': 'Prepared', 'operation': 'selection', 'input': 'Raw', 'parent': 'Scope', 'child_keys': ['ID'], 'parent_keys': ['ID']}]}
            (root / 'p.json').write_text(json.dumps(project), encoding='utf-8')
            with self.assertRaises(InputError):
                eam_run.run(root / 'p.json', root / 'result')
            self.assertFalse((root / 'result').exists())

    def test_subset_zip_is_self_contained_and_rewrites_selection_filenames(self):
        with tempfile.TemporaryDirectory() as folder:
            archive, manifest = bp.build(['purchase_order'], prefix='ZTEST_', package='ZTEST_MM', out=Path(folder) / 'pack.zip', root=ROOT / 'packages/mm_mig_ecc')
            self.assertEqual(set(manifest['resolved_modules']), {'product', 'purchase_order'})
            with zipfile.ZipFile(archive) as z:
                project = json.loads(z.read('customer/customer-cohort-project.json'))
                adapters = json.loads(z.read('customer/target-adapters.json'))
                self.assertTrue(all(c['module'] in manifest['resolved_modules'] for c in adapters.values()))
                self.assertNotIn('ZMMX_', json.dumps(project))
                for name in project['inputs'].values():
                    if name.startswith('selection/'):
                        self.assertIn('customer/' + name, z.namelist())
                self.assertIn('tools/migration_run.py', z.namelist())

    def test_namespace_prefix_paths_stay_extractable(self):
        with tempfile.TemporaryDirectory() as folder:
            archive, _ = bp.build(['product'], prefix='/ACME/', package='/ACME/MM', out=Path(folder) / 'pack.zip', root=ROOT / 'packages/mm_mig_ecc')
            with zipfile.ZipFile(archive) as z:
                project = json.loads(z.read('customer/examples/project.json'))
                self.assertTrue(all(n.startswith('/ACME/') for n in project['inputs']))
                for relative in project['inputs'].values():
                    self.assertIn('customer/examples/' + relative, z.namelist())


if __name__ == '__main__':
    unittest.main()
