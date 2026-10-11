"""Business-owner isolation and native child cardinality regressions."""
import json,re,sqlite3,sys,tempfile,unittest
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2]
sys.path.insert(0,str(ROOT/'tools'))
from eam_prepare import linked_scope, text_scope
from eam_run import run
from mig_reconcile import CsvRows,InputError
from check_pack_coverage import check

class ObjectCompletionTests(unittest.TestCase):
    def test_classification_owner_preserves_value_positions_for_selected_batch(self):
        keys=['ClassifiedObject','ClassType','Characteristic','Position','Counter']
        rows=[dict(ClassifiedObject='000000000000123456',ClassType='023',Characteristic='COLOR',Position=str(i),Counter='0',Value=v) for i,v in [(1,'RED'),(2,'BLUE')]]
        outside=dict(rows[0],ClassifiedObject='000000000000999999')
        links=[dict(r,Product='P1',Batch='B1') for r in rows]+[dict(outside,Product='P2',Batch='B1')]
        self.assertEqual(linked_scope(rows+[outside],[{'Product':'P1','Batch':'B1'}],links,keys,['Product','Batch']),rows)

    def test_declared_scope_and_actual_dependent_fields_are_complete(self):
        self.assertEqual(check(),[])

    def test_text_owner_link_filters_outside_master_and_preserves_languages(self):
        rows=[dict(TextObject='IFLOT',TextName=name,TextID='LTXT',Language=lang) for name,lang in [('INTERNAL_A','E'),('INTERNAL_A','D'),('INTERNAL_B','E'),('CUSTOM_FORMAT','E')]]
        links=[dict(r,FunctionalLocation=('A' if r['TextName']=='INTERNAL_A' else 'B')) for r in rows[:3]]
        self.assertEqual(text_scope(rows,[{'FunctionalLocation':'A'}],links,['FunctionalLocation']),rows[:2])

    def test_text_mapping_ambiguity_missing_index_and_duplicate_parent_fail(self):
        row=dict(TextObject='AUFK',TextName='100000000123456',TextID='KOPF',Language='E')
        link=dict(row,Order='123456')
        for parents,links,index in [([{'Order':'123456'}],[link,dict(link,Order='OTHER')],[row]),([{'Order':'123456'}],[dict(link,TextName='MISSING')],[row]),([{'Order':'123456'},{'Order':'123456'}],[link],[row])]:
            with self.assertRaises(InputError):text_scope(index,parents,links,['Order'])

    def test_empty_text_owner_population_emits_no_rows(self):
        cols=['TextObject','TextName','TextID','Language']
        self.assertEqual(text_scope(CsvRows([],cols),CsvRows([],['Object']),CsvRows([],cols+['Object']),['Object']),[])

    def test_actual_functional_location_partner_sql_preserves_counters_and_excludes_deleted_orphans(self):
        p=ROOT/'packages/eam_mig_ecc/src/zemx_i_funclocpartner.ddls.asddls'
        text=p.read_text();before,after=text.split('as select from ',1)[1].split('{',1);body,tail=after.split('}',1)
        sql='select '+re.sub(r'\bkey\s+','',body)+' from '+before+' '+tail
        with sqlite3.connect(':memory:') as db:
            db.executescript("""
            create table ZEMX_I_FuncLoc(FunctionalLocation text,ObjectNumber text,IsMarkedForDeletion text);
            insert into ZEMX_I_FuncLoc values('FL1','REAL_OBJNR_1',''),('FL2','REAL_OBJNR_2','X');
            create table ZEMX_B_ObjectPartner(ObjectNumber text,PartnerFunction text,PartnerCounter text,Partner text,IsMarkedForDeletion text);
            insert into ZEMX_B_ObjectPartner values('REAL_OBJNR_1','VU','1','P1',''),('REAL_OBJNR_1','VU','2','P2',''),('REAL_OBJNR_1','VU','3','P3','X'),('REAL_OBJNR_2','VU','1','P4',''),('ORPHAN','VU','1','P5','');
            """)
            self.assertEqual(db.execute(sql).fetchall(),[('FL1','VU','1','P1'),('FL1','VU','2','P2')])

    def test_each_pack_ships_a_nonempty_text_owner_example(self):
        for code in ['eam','fi_aa','mm','qm','ps','pp','co','fi','sd']:
            example=ROOT/'packages'/f'{code}_mig_ecc/customer/examples/text-scope/project.json'
            with self.subTest(pack=code),tempfile.TemporaryDirectory() as tmp:
                run(example,Path(tmp)/'prepared')
                from mig_reconcile import read_csv
                rows=read_csv(Path(tmp)/'prepared/ScopedTexts.csv')
                self.assertEqual(len(rows),2)
                self.assertEqual({r['Language'] for r in rows},{'E','D'})

if __name__=='__main__':unittest.main()
