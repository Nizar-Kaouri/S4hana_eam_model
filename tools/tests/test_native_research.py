"""Offline delivery regressions for native child scope and financial evidence.

These exercise ZIP rewriting and customer comparison; they do not execute SAP CDS.
"""
import json,os,sys,tempfile,unittest,zipfile
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2]
sys.path[:0]=[str(ROOT),str(ROOT/'tools')]
os.environ.setdefault('VDM_PRODUCT','eam')
import build_package as bp
from migration_csv import CsvRows

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


if __name__=='__main__':unittest.main()
