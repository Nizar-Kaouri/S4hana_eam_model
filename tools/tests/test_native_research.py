"""Offline delivery regressions for native child scope and financial evidence.

These exercise ZIP rewriting and customer comparison; they do not execute SAP CDS.
"""
import json,os,sys,tempfile,unittest,zipfile
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2]
sys.path[:0]=[str(ROOT),str(ROOT/'tools')]
os.environ.setdefault('VDM_PRODUCT','eam')
import build_package as bp
from eam_prepare import compare_structure
from mig_reconcile import CsvRows

class NativeResearchTest(unittest.TestCase):
    def test_rewritten_freight_child_delivery_keeps_parent_filter_and_order(self):
        with tempfile.TemporaryDirectory() as tmp:
            archive,manifest=bp.build(['freight_unit'],root=ROOT/'packages/tm_mig_src',
                out=Path(tmp)/'fu.zip',prefix='ZTEST_')
            with zipfile.ZipFile(archive) as z:
                mapping=json.loads(z.read('mapping/freight_unit/mapping.json'))
                positions={o['name']:i for i,o in enumerate(manifest['objects'])}
                for st in mapping['structures']:
                    if 'parent_scope' not in st:continue
                    rn=st['source_view'];parent=st['parent_scope']['source_parent_view']
                    text=z.read('src/'+rn.lower()+'.ddls.asddls').decode()
                    self.assertIn('inner join '+parent+' as parent',text)
                    self.assertIn("where parent.DocumentCategory = 'FU'",text)
                    self.assertIn('src.DocumentUUID = parent.DocumentUUID',text)
                    self.assertLess(positions[parent],positions[rn])
                    self.assertNotIn('ZTMX_',text)
                self.assertNotIn('tools/migration_stage.py',z.namelist())

    def test_customer_compare_detects_changed_exposure_amount_and_currency(self):
        p=ROOT/'packages/fscm_mig_src/modules/credit_exposure/mapping.json'
        mapping=json.loads(p.read_text());view=mapping['main_structure'];st=mapping['structures'][0]
        cols=[f['element'] for f in st['fields']]
        row=dict(zip(cols,['0000123','0001','100','EUR','100.00','20.00']))
        source=CsvRows([row],cols)
        same=compare_structure(mapping,view,source,CsvRows([row],cols))
        self.assertTrue(same[1])
        changed=compare_structure(mapping,view,source,CsvRows([{**row,'ExposureAmount':'120.00'}],cols))
        self.assertFalse(changed[1])
        # Currency participates in the declared native grain, so a different currency
        # must be an unmatched record rather than silently compared/consolidated.
        other=compare_structure(mapping,view,source,CsvRows([{**row,'Currency':'USD'}],cols))
        self.assertFalse(other[1])

if __name__=='__main__':unittest.main()
