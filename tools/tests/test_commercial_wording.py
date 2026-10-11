"""Prevent readiness statements returning to the released customer documents."""
import json,sys,unittest
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2]
sys.path.insert(0,str(ROOT/'tools'))
from commercial_wording import readiness_labels

class CommercialWordingTest(unittest.TestCase):
    def test_released_customer_documents_have_no_readiness_labels(self):
        catalog=json.loads((ROOT/'tools/commercial_release_catalog.json').read_text())
        for entry in catalog:
            root=ROOT/'packages'/entry['product']
            paths=[root/'README.md',*root.glob('docs/*.md'),*root.glob('customer/**/*.md')]
            for path in paths:
                if path.name=='CUSTOMER_TEST.md':continue
                with self.subTest(path=str(path)):
                    self.assertEqual(readiness_labels(path.read_text(encoding='utf-8')),[])

    def test_customer_checks_and_error_handling_are_preserved(self):
        instructions='Confirm SAP fields and keys before activation.\nValidate the selected population.\nExecute a test allocation cycle.\nRow limit exceeded: no incomplete export was written.'
        self.assertEqual(readiness_labels(instructions),[])
        for phrase in ['SAP system validation is still pending.',
                       'All raw source grain fields are candidates pending system verification.',
                       'These packages must pass the customer acceptance test before sale.',
                       'The reports have parser checks only.', 'Status: draft-unverified']:
            with self.subTest(phrase=phrase):self.assertTrue(readiness_labels(phrase))

if __name__=='__main__':unittest.main()
