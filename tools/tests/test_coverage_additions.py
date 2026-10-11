"""Customer preflight regressions for candidate field and native key grain."""
import json
import sys
import os
import tempfile
import unittest
import zipfile
from pathlib import Path
ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT/'tools'))
from migration_csv import CsvRows, InputError
from migration_ddic import check


class DDICPreflightTest(unittest.TestCase):
    def setUp(self):
        self.mapping = {'structures': [{'consumption_view': 'Balance', 'keys': ['Account'], 'fields': [
            {'element': 'Account', 'source': 'TOTAL-RACCT'}, {'element': 'Sign', 'source': 'TOTAL-DRCRK'}]}]}
        self.schema = CsvRows([
            {'FIELDNAME': 'MANDT', 'KEYFLAG': 'X', 'DATATYPE': 'CLNT'},
            {'FIELDNAME': 'RACCT', 'KEYFLAG': 'X', 'DATATYPE': 'CHAR'},
            {'FIELDNAME': 'DRCRK', 'KEYFLAG': 'X', 'DATATYPE': 'CHAR'}], ['FIELDNAME', 'KEYFLAG', 'DATATYPE'])

    def test_projected_but_undeclared_key_fails(self):
        result = check(self.mapping, 'Balance', self.schema)
        self.assertFalse(result['passed']);self.assertEqual(result['omitted_native_keys'], ['DRCRK'])

    def test_complete_key_allows_only_typed_implicit_client(self):
        self.mapping['structures'][0]['keys'].append('Sign')
        self.assertTrue(check(self.mapping, 'Balance', self.schema)['passed'])
        self.schema[0]['DATATYPE'] = 'CHAR'
        self.assertEqual(check(self.mapping, 'Balance', self.schema)['omitted_native_keys'], ['MANDT'])

    def test_missing_field_and_non_native_key_are_reported(self):
        self.mapping['structures'][0]['keys'].append('Sign');self.schema[2]['FIELDNAME'] = 'OTHER'
        result = check(self.mapping, 'Balance', self.schema)
        self.assertEqual(result['missing_fields'], ['DRCRK']);self.assertEqual(result['non_native_declared_keys'], ['DRCRK'])

    def test_client_named_client_is_implicit_only_with_clnt_type(self):
        self.mapping['structures'][0]['keys'].append('Sign')
        self.schema[0]['FIELDNAME'] = 'CLIENT'
        self.assertTrue(check(self.mapping, 'Balance', self.schema)['passed'])
        self.schema[0]['DATATYPE'] = 'CHAR'
        self.assertEqual(check(self.mapping, 'Balance', self.schema)['omitted_native_keys'], ['CLIENT'])

    def test_multiple_client_typed_keys_are_not_hidden(self):
        self.mapping['structures'][0]['keys'].append('Sign')
        self.schema.append({'FIELDNAME':'CLIENT','KEYFLAG':'X','DATATYPE':'CLNT'})
        self.assertEqual(check(self.mapping, 'Balance', self.schema)['omitted_native_keys'], ['CLIENT', 'MANDT'])

    def test_duplicate_or_keyless_schema_is_rejected(self):
        self.schema.append(dict(self.schema[1]))
        with self.assertRaises(InputError): check(self.mapping, 'Balance', self.schema)
        self.schema.pop()
        for row in self.schema: row['KEYFLAG'] = ''
        with self.assertRaises(InputError): check(self.mapping, 'Balance', self.schema)


class CoverageDeliveryTest(unittest.TestCase):
    def test_network_subset_ships_dependencies_and_only_its_extension_contract(self):
        sys.path.insert(0, str(ROOT))
        os.environ.setdefault('VDM_PRODUCT', 'eam')
        import build_package as bp
        with tempfile.TemporaryDirectory() as tmp:
            archive, manifest = bp.build(['network'], root=ROOT/'packages/ps_mig_ecc', out=Path(tmp)/'network.zip')
            self.assertEqual(set(manifest['resolved_modules']), {'project', 'wbs_element', 'network'})
            with zipfile.ZipFile(archive) as z:
                requirements = json.loads(z.read('customer/coverage-requirements.json'))
                self.assertEqual(set(requirements), {'network'})
                self.assertIn('tools/migration_ddic.py', z.namelist())
                project = json.loads(z.read('customer/customer-cohort-project.json'))
                available = set(project['inputs'])
                for step in project['steps']:
                    self.assertIn(step['input'], available)
                    self.assertIn(step['parent'], available)
                    available.add(step['name'])
                self.assertTrue(set(project['outputs']) <= available)
                self.assertTrue(any(s['operation'] == 'parent_scope' for s in project['steps']))

    def test_additions_have_empty_scope(self):
        additions = json.loads((ROOT/'tools/coverage_additions.json').read_text(encoding='utf-8'))
        self.assertEqual(sum(len(d['modules']) for d in additions.values()), 15)
        for code, domain in additions.items():
            base = ROOT/'packages'/f'{code}_mig_ecc'
            for module in domain['modules']:
                mapping = json.loads((base/'modules'/module['name']/'mapping.json').read_text(encoding='utf-8'))
                for structure in mapping['structures']:
                    name = structure['consumption_view']
                    self.assertEqual(len((base/'customer/selection'/f'{name}.csv').read_text(encoding='utf-8-sig').splitlines()), 1)
                    self.assertIn(module['boundary'], structure['preprocessing'])


if __name__ == '__main__': unittest.main()
