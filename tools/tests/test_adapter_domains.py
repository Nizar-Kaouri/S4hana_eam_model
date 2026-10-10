"""Customer staging loss prevention and adapter-backed delivery scenarios."""
import csv,json,os,sys,tempfile,unittest,zipfile
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2]
sys.path.insert(0,str(ROOT/'tools'));sys.path.insert(0,str(ROOT));os.environ.setdefault('VDM_PRODUCT','eam')
import migration_stage as ms
import build_package as bp
from mig_reconcile import CsvRows,InputError,read_csv


class StageTest(unittest.TestCase):
    def setUp(self):
        self.aliases=['SourceSystem','SourceClient','ExportBatch','ID','Description']
        self.contract={'table':'ZWMX_T001','keys':self.aliases[:4],
                       'fields':[{'native':f'F{i:03}','element':a,'length':32} for i,a in enumerate(self.aliases,1)]}
        self.row=dict(zip(self.aliases,['ERP','001','batch1','0000123','Äpfel, "fresh"']))
        self.rows=CsvRows([self.row],self.aliases)

    def test_unicode_quotes_and_leading_zeros_round_trip_with_hash_audit(self):
        with tempfile.TemporaryDirectory() as tmp:
            source=Path(tmp)/'source.csv';out=Path(tmp)/'prepared'
            with source.open('w',encoding='utf-8-sig',newline='') as f:
                w=csv.DictWriter(f,fieldnames=self.aliases);w.writeheader();w.writerows(self.rows)
            audit=ms.prepare(source,self.contract,out)
            self.assertEqual(read_csv(out/'canonical.csv')[0],self.row)
            with (out/'stage.tsv').open(encoding='utf-8-sig',newline='') as f:
                self.assertEqual(next(csv.reader(f,delimiter='\t',quoting=csv.QUOTE_NONE)),list(self.row.values())+['#MODUPORTER_END#'])
            self.assertFalse(audit['business_posting']);self.assertEqual(len(audit['contract_sha256']),64)

    def test_mixed_origins_and_duplicate_keys_are_rejected(self):
        with self.assertRaises(InputError):ms.validate(CsvRows([self.row,self.row],self.aliases),self.contract)
        with self.assertRaises(InputError):ms.validate(CsvRows([self.row,{**self.row,'ID':'2','ExportBatch':'other'}],self.aliases),self.contract)

    def test_delimiter_overlength_and_surrogate_units_are_not_truncated(self):
        for value in ['bad\ttext','bad\ntext','bad\0text','trailing ','x'*33,'😀'*17]:
            with self.subTest(value=value):
                with self.assertRaises(InputError):ms.validate(CsvRows([{**self.row,'Description':value}],self.aliases),self.contract)

    def test_physical_export_preserves_origin_and_rejects_mixed_staging_clients(self):
        row={'MANDT':'900',**{f['native']:self.row[f['element']] for f in self.contract['fields']}}
        data=CsvRows([row],list(row))
        self.assertEqual(ms.normalize(data,self.contract)[0]['SourceClient'],'001')
        with self.assertRaises(InputError):ms.normalize(CsvRows([row,{**row,'MANDT':'901','F004':'2'}],list(row)),self.contract)

    def test_bad_input_leaves_no_output_and_existing_output_is_preserved(self):
        with tempfile.TemporaryDirectory() as tmp:
            source=Path(tmp)/'source.csv';out=Path(tmp)/'out'
            with source.open('w',encoding='utf-8-sig',newline='') as f:
                w=csv.DictWriter(f,fieldnames=self.aliases);w.writeheader();w.writerow({**self.row,'SourceClient':'xx'})
            with self.assertRaises(InputError):ms.prepare(source,self.contract,out)
            self.assertFalse(out.exists())
            out.mkdir();(out/'keep').write_text('preserved')
            with self.assertRaises(InputError):ms.prepare(source,self.contract,out)
            self.assertEqual((out/'keep').read_text(),'preserved')


class AdapterDeliveryTest(unittest.TestCase):
    def test_source_subset_closes_modules_and_filters_native_stage_contracts(self):
        with tempfile.TemporaryDirectory() as tmp:
            archive,manifest=bp.build(['warehouse_stock'],root=ROOT/'packages/ewm_mig_src',out=Path(tmp)/'stock.zip')
            self.assertEqual(set(manifest['resolved_modules']),{'storage_bin','warehouse_product','warehouse_stock'})
            with zipfile.ZipFile(archive) as z:
                stage=json.loads(z.read('customer/staging-contracts.json'));native=json.loads(z.read('customer/source-adapters.json'))
                self.assertEqual(set(stage),set(native));self.assertEqual(len(stage),6)
                self.assertIn('tools/migration_stage.py',z.namelist())
                self.assertIn('helpers/zwmx_ewm_src_stage_load.prog.abap',z.namelist())
                self.assertEqual(sum(n.endswith('.tabl.xml') for n in z.namelist()),6)

    def test_target_subset_contains_its_stage_tools_and_only_selected_contract(self):
        with tempfile.TemporaryDirectory() as tmp:
            archive,_=bp.build(['credit_segment'],root=ROOT/'packages/fscm_mig_s4',out=Path(tmp)/'credit.zip')
            with zipfile.ZipFile(archive) as z:
                stage=json.loads(z.read('customer/staging-contracts.json'))
                self.assertEqual(len(stage),1)
                self.assertIn('tools/migration_stage.py',z.namelist());self.assertIn('helpers/zfct_fscm_s4_stage_load.prog.abap',z.namelist())


if __name__=='__main__':unittest.main()
