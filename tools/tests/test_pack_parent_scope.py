"""Regressions for selected populations, interval keys and delivered recipes."""
import json, re, sqlite3, sys, tempfile, unittest, zipfile, os
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2]
sys.path.insert(0,str(ROOT/'tools'))
from eam_prepare import parent_scope, document_item_scope
from eam_run import run
from mig_reconcile import CsvRows, InputError
CODES=['eam','fi_aa','mm','qm','ps','pp','co','fi','sd']

class ParentScopeTests(unittest.TestCase):
    def test_repeating_parent_reference_preserves_children_without_multiplication(self):
        parents=[{'Asset':'A','End':'20201231'},{'Asset':'A','End':'99991231'}]
        rows=[{'Asset':'A','Area':'01'},{'Asset':'A','Area':'02'},{'Asset':'B','Area':'01'}]
        self.assertEqual(parent_scope(rows,parents,['Asset'],['Asset'],['Asset','End']),rows[:2])

    def test_duplicate_full_parent_identity_stops_preparation(self):
        with self.assertRaisesRegex(InputError,'duplicate key'):
            parent_scope([{'Asset':'A'}],[{'Asset':'A'},{'Asset':'A'}],['Asset'],['Asset'],['Asset'])

    def test_empty_selected_parent_excludes_every_child(self):
        self.assertEqual(parent_scope(CsvRows([{'Asset':'A'}],['Asset']),CsvRows([],['Asset']),['Asset'],['Asset'],['Asset']),[])

    def test_sd_header_sentinel_is_preserved_but_unselected_items_are_excluded(self):
        rows=[{'Doc':'A','Item':i,'Partner':'P'} for i in ['000000','000010','000020']]
        items=[{'Doc':'A','Item':'000010'}]
        self.assertEqual(document_item_scope(rows,items,['Doc','Item'],['Doc','Item'],['Doc','Item']),rows[:2])

    def test_all_nine_contracts_filter_unselected_objects_and_preserve_full_children(self):
        for code in CODES:
            p=ROOT/'packages'/f'{code}_mig_ecc'
            relations=json.loads((p/'customer/parent-relationships.json').read_text())
            for name,c in relations.items():
                with self.subTest(code=code,child=name):
                    parent={k:'SELECTED' for k in set(c['parent_identity']+c['parent_keys'])}
                    wanted={k:'SELECTED' for k in c['child_keys']};other={k:'OUTSIDE' for k in c['child_keys']}
                    wanted['Payload']='Keep exactly';other['Payload']='Exclude'
                    self.assertEqual(parent_scope([wanted,other],[parent],c['child_keys'],c['parent_keys'],c['parent_identity']),[wanted])

    def test_nonempty_customer_examples_keep_two_children_of_one_selected_parent(self):
        for code in CODES:
            example=ROOT/'packages'/f'{code}_mig_ecc'/'customer/examples/parent-scope/project.json'
            with self.subTest(pack=code),tempfile.TemporaryDirectory() as tmp:
                run(example,Path(tmp)/'prepared')
                from mig_reconcile import read_csv
                self.assertEqual(len(read_csv(Path(tmp)/'prepared/SelectedParents.csv')),1)
                children=read_csv(Path(tmp)/'prepared/ScopedChildren.csv')
                self.assertEqual(len(children),2)
                self.assertEqual([r['Payload'] for r in children],['keep 1','keep 2'])

    def test_subset_delivery_has_executable_parent_scope_chain(self):
        sys.path.insert(0,str(ROOT));os.environ.setdefault('VDM_PRODUCT','eam')
        import build_package as bp
        for code,module in [('fi_aa','fixed_asset'),('mm','purchase_order'),('qm','quality_notification'),('ps','network'),('pp','production_order_operation'),('co','internal_order'),('fi','customer'),('sd','sales_order'),('eam','functional_location')]:
            with self.subTest(pack=code), tempfile.TemporaryDirectory() as tmp:
                archive,_=bp.build([module],root=ROOT/'packages'/f'{code}_mig_ecc',out=Path(tmp)/'pack.zip')
                with zipfile.ZipFile(archive) as z:
                    name='customer/contracts/customer-cohort-project.json' if code=='eam' else 'customer/customer-cohort-project.json'
                    project=json.loads(z.read(name));available=set(project['inputs'])
                    self.assertIn('docs/MASTER_CHILD_ARCHITECTURE.md',z.namelist())
                    for step in project['steps']:
                        self.assertIn(step['input'],available)
                        if step.get('parent'):self.assertIn(step['parent'],available)
                        available.add(step['name'])
                    self.assertTrue(set(project['outputs'])<=available)
                    # Empty real extract/selection files exercise the delivered recipe end to end.
                    folder=Path(tmp)/'extracted';z.extractall(folder)
                    project_file=folder/name
                    for dataset,relative in project['inputs'].items():
                        path=project_file.parent/relative;path.parent.mkdir(parents=True,exist_ok=True)
                        columns=set()
                        for step in project['steps']:
                            if step['input']==dataset:columns.update(step.get('child_keys',[]));columns.update(step.get('keys',[]))
                            if step.get('parent')==dataset:columns.update(step.get('parent_keys',[]));columns.update(step.get('parent_identity',[]))
                        if path.exists() and path.suffix=='.csv':
                            columns.update(path.read_text(encoding='utf-8-sig').splitlines()[0].split(','))
                        header=folder/'customer/headers'/(dataset+'.csv')
                        if header.exists():columns.update(header.read_text(encoding='utf-8-sig').strip().split(','))
                        if not columns:columns.add('Unused')
                        path.write_text(','.join(sorted(columns))+'\n',encoding='utf-8')
                    run(project_file,folder/'prepared')
                    self.assertTrue((folder/'prepared/PREPARATION_AUDIT.json').exists())

    def test_native_status_sql_excludes_inactive_and_orphan_statuses(self):
        for code,stem,root in [('qm','Lot','ZQMX_I_InspectionLot'),('ps','Project','ZPSX_I_Project'),('pp','Order','ZPPX_I_ProductionOrde'),('co','Order','ZCOX_I_InternalOrder')]:
            p=ROOT/'packages'/f'{code}_mig_ecc';prefix=json.loads((p/'library.json').read_text())['prefix'];name=prefix+'I_'+stem+'Status'
            text=(p/'src'/(name.lower()+'.ddls.asddls')).read_text();text=re.sub(r'//[^\n]*','',text)
            before,after=text.split('as select from ',1)[1].split('{',1);projection,where=after.split('}',1)
            fields=re.findall(r'obj\.(\w+)',projection)+['ObjectNumber']
            with self.subTest(code=code),sqlite3.connect(':memory:') as db:
                db.execute('create table '+root+' ('+','.join(k+' text' for k in dict.fromkeys(fields))+')')
                db.execute('insert into '+root+' values ('+','.join('?' for _ in dict.fromkeys(fields))+')',['KEEP' for _ in dict.fromkeys(fields)])
                db.execute('create table '+prefix+'B_'+stem+'StatusData (ObjectNumber text,StatusCode text,StatusIsInactive text,StatusChangeNumber text)')
                db.executemany('insert into '+prefix+'B_'+stem+'StatusData values (?,?,?,?)',[('KEEP','I1','','1'),('KEEP','E1','','2'),('KEEP','I2','X','3'),('ORPHAN','I1','','1')])
                sql='select '+re.sub(r'\bkey\s+','',projection)+' from '+before+' '+where
                self.assertEqual(len(db.execute(sql).fetchall()),2)

    def test_standard_address_associations_preserve_masters_and_do_not_multiply_versions(self):
        p=ROOT/'packages/fi_mig_ecc'
        for stem,key in [('Customer','Customer'),('Supplier','Supplier'),('Bank','BankKey')]:
            text=(p/'src'/('zfix_i_'+stem.lower()+'.ddls.asddls')).read_text()
            body=text.split('as select from ',1)[1]
            before,after=body.split('{',1);projection,tail=after.split('}',1)
            source=re.search(r'^(\w+) as src',before.strip()).group(1)
            predicate=before.split(' on ',1)[-1] if ' on ' in before else before.split('on ',1)[1]
            predicate=predicate.replace('$projection.AddressNumber','src.AddressNumber')
            before=before.split('association',1)[0]+' left join ZFIX_B_Address as _Address on '+predicate
            columns=sorted(set(re.findall(r'src\.(\w+)',projection))|{'AddressNumber'})
            addresscols=sorted(set(re.findall(r'_Address\.(\w+)',projection+predicate)))
            with self.subTest(stem=stem),sqlite3.connect(':memory:') as db:
                db.row_factory=sqlite3.Row
                db.execute('create table '+source+' ('+','.join(c+' text' for c in columns)+')')
                db.execute('create table ZFIX_B_Address ('+','.join(c+' text' for c in addresscols)+')')
                for identifier,address in [('A','ADDR'),('B',''),('C','NONSTANDARD')]:
                    row={c:'' for c in columns};row[key]=identifier;row['AddressNumber']=address
                    db.execute('insert into '+source+' values ('+','.join('?' for _ in columns)+')',[row[c] for c in columns])
                for address,start,version,city in [('ADDR','00010101','','Berlin'),('ADDR','00010101','I','International'),('ADDR','20200101','','Other date'),('NONSTANDARD','00010101','I','Only variant')]:
                    row={c:'' for c in addresscols};row.update(AddressNumber=address,AddressValidFrom=start,AddressVersion=version,AddressCity=city)
                    db.execute('insert into ZFIX_B_Address values ('+','.join('?' for _ in addresscols)+')',[row[c] for c in addresscols])
                rows=db.execute('select '+re.sub(r'\bkey\s+','',projection)+' from '+before).fetchall()
                self.assertEqual(len(rows),3)
                bykey={r[key]:r for r in rows}
                self.assertEqual(bykey['A']['AddressCity'],'Berlin')
                self.assertEqual(bykey['A']['HasStandardAddress'],'X')
                self.assertEqual(bykey['B']['HasStandardAddress'],'')
                self.assertEqual(bykey['C']['HasStandardAddress'],'')

if __name__=='__main__':unittest.main()
