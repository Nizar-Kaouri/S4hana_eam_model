"""Source preparation remains executable without any target product or tool."""
import json,os,sys,tempfile,unittest,zipfile
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2]
sys.path[:0]=[str(ROOT),str(ROOT/'tools')]
os.environ.setdefault('VDM_PRODUCT','eam')
import build_package as bp

class SourceOnlyDeliveryTest(unittest.TestCase):
    def test_source_archive_has_no_target_comparison_dependencies(self):
        for pack in (ROOT/'packages').iterdir():
            if (pack/'library.json').exists():
                library=json.loads((pack/'library.json').read_text())
                self.assertNotEqual(library.get('kind'),'migration-target')
                self.assertNotIn('migration_pair',library)
        with tempfile.TemporaryDirectory() as tmp:
            archive,_=bp.build(['equipment'],root=ROOT/'packages/eam_mig_ecc',out=Path(tmp)/'equipment.zip')
            with zipfile.ZipFile(archive) as z:
                self.assertIn('tools/migration_csv.py',z.namelist())
                self.assertNotIn('tools/mig_reconcile.py',z.namelist())
                self.assertNotIn('customer/target-adapters.json',z.namelist())
                self.assertFalse(any('_mig_s4' in n or 'Compare' in n for n in z.namelist()))
                mappings=[json.loads(z.read(n)) for n in z.namelist() if n.startswith('mapping/') and n.endswith('mapping.json')]
                self.assertTrue(mappings)
                self.assertTrue(all('reconciliation' not in m for m in mappings))
                prepare=z.read('tools/eam_prepare.py').decode()
                self.assertNotIn('compare_structure',prepare)
                self.assertNotIn('"compare-raw"',prepare)

if __name__=='__main__':unittest.main()
