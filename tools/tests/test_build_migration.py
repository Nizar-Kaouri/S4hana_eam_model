"""Build tests of the EAM migration products (3-layer ECC views, mapping table, mapping files, one system per bundle)."""
import argparse
import json
import os
import shutil
import sys
import tempfile
import unittest
import zipfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT))
os.environ.setdefault("VDM_PRODUCT", "eam")
import build_package as bp  # noqa: E402
import build_bundle as bb  # noqa: E402

ECC = ROOT / "packages" / "eam_mig_ecc"


class BuildMigrationTest(unittest.TestCase):
    def setUp(self):
        self.tmp = Path(tempfile.mkdtemp())

    def tearDown(self):
        shutil.rmtree(self.tmp)

    def test_ecc_build_pulls_core_and_work_center_and_rewrites_everything(self):
        out, manifest = bp.build(["equipment"], prefix="ZACME_", package="ZACME_MIG", out=self.tmp / "e.zip", root=ECC)
        self.assertEqual(sorted(manifest["resolved_modules"]), ["core", "equipment", "long_text", "object_partner", "object_status", "work_center"])
        with zipfile.ZipFile(out) as zf:
            names = zf.namelist()
            comp = zf.read("src/zacme_i_equipment.ddls.asddls").decode()
            cons = zf.read("src/zacme_c_equipmentmig.ddls.asddls").decode()
            mapping = zf.read("mapping/equipment/mapping.json").decode()
        self.assertIn("@AbapCatalog.sqlViewName: 'ZACME_EQ'", comp)
        self.assertIn("define view ZACME_I_Equipment", comp)
        self.assertIn("as select from ZACME_I_Equipment as src", cons)
        self.assertIn("key src.Equipment", cons)
        self.assertNotIn("coalesce", cons)
        for text in (comp, cons, mapping):
            self.assertNotIn("ZEMX_", text.upper())
        self.assertIn("mapping/docs/equipment.md", names)
        self.assertIn("docs/EQUIPMENT_ARCHITECTURE.md", names)
        self.assertIn("src/zacme_b_address.ddls.asddls", names)
        self.assertIn("src/zacme_c_equippartnermig.ddls.asddls", names)
        self.assertIn("mapping/MIGRATION_SEQUENCE.md", names)
        self.assertNotIn("mapping/task_list/mapping.json", names)
        self.assertFalse(any(n.endswith(".tabl.xml") for n in names))

    def test_layers_reference_only_lower_layers(self):
        modules = {m["name"]: m for m in (json.loads(p.read_text()) for p in ECC.glob("modules/*/module.json"))}
        layer = {n: lay for m in modules.values() for lay in ("basic", "composite", "consumption") for n in m["objects"][lay]}
        rank = {"basic": 0, "composite": 1, "consumption": 2}
        for name, lay in layer.items():
            refs = bp.references("DDLS", name, "ZEMX_", ECC)
            for ref in refs:
                ref_name = next(n for n in layer if n.upper() == ref)
                self.assertLessEqual(rank[layer[ref_name]], rank[lay], f"{name} ({lay}) reads {ref_name}")
            if lay == "basic":
                text = bp.strip_comments((ECC / "src" / f"{name.lower()}.ddls.asddls").read_text(), "DDLS")
                self.assertRegex(text, r"as select from [a-z0-9_]+\s", f"basic view {name} must select from one table")
                self.assertNotRegex(text, r"\bjoin\b", f"basic view {name} must not join")
                for ref in refs:  # only associations to other basic views
                    ref_name = next(n for n in layer if n.upper() == ref)
                    self.assertEqual(layer[ref_name], "basic", f"{name} associates {ref_name}")
            if lay == "composite":
                text = (ECC / "src" / f"{name.lower()}.ddls.asddls").read_text()
                self.assertNotIn("left outer join", text, f"{name}: use an association instead of a left outer join")

    def test_bom_build_is_dependency_complete_and_ships_selected_catalogue(self):
        import csv
        import io
        out, manifest = bp.build(["equipment_bom"], prefix="/ACME/", package="/ACME/MIG",
                                 out=self.tmp / "bom.zip", root=ECC)
        self.assertEqual(set(manifest["resolved_modules"]), {"equipment_bom", "equipment", "core", "work_center", "long_text", "object_partner", "object_status"})
        with zipfile.ZipFile(out) as zf:
            self.assertIn("docs/INSTALLATION.md", zf.namelist())
            rows = list(csv.DictReader(io.StringIO(zf.read("FIELD_CATALOG.csv").decode())))
            self.assertEqual({r["module"] for r in rows}, {"equipment_bom", "equipment", "work_center", "long_text", "object_partner", "object_status"})
            self.assertTrue(all(r["view"].startswith("/ACME/") for r in rows))
            self.assertNotIn("mapping/task_list/mapping.json", zf.namelist())

    def test_latest_operation_counters_do_not_resurrect_deleted_states(self):
        # Execute the current counter-selection joins from the production CDS on a small relational fixture.
        import sqlite3
        import re
        text = (ECC / "src/zemx_i_tasklistoperation.ddls.asddls").read_text()
        from_clause = text[text.index("as select from") + len("as select from"):text.index("{")].strip()
        db = sqlite3.connect(":memory:")
        db.executescript("""
            create table ZEMX_B_TaskListOpAssignment(TaskListType,TaskListGroup,TaskListGroupCounter,TaskListSequence,TaskListOperationInternalId,TaskListOpAssgmtVersion,IsMarkedForDeletion);
            create table ZEMX_B_TaskListOpDetail(TaskListType,TaskListGroup,TaskListOperationInternalId,TaskListOpVersionCounter,IsMarkedForDeletion);
            insert into ZEMX_B_TaskListOpAssignment values ('A','G','1','0','N',1,''),('A','G','1','0','N',2,'');
            insert into ZEMX_B_TaskListOpDetail values ('A','G','N',1,''),('A','G','N',2,'');
        """)
        for name in ["ZEMX_I_TaskListAsgLatest", "ZEMX_I_TaskListOpLatest"]:
            ddl = (ECC / "src" / (name.lower() + ".ddls.asddls")).read_text()
            body = ddl[ddl.index("{") + 1:ddl.index("}")]
            body = re.sub(r"^\s*@[^\n]+\n", "", body, flags=re.M)
            body = re.sub(r"\bkey\s+", "", body)
            table = re.search(r"as select from (\w+) as src", ddl).group(1)
            group = ddl[ddl.index("group by"):]
            db.execute("create view " + name + " as select " + body + " from " + table + " as src " + group)
        query = "select asg.TaskListOpAssgmtVersion,op.TaskListOpVersionCounter from " + from_clause
        self.assertEqual(db.execute(query).fetchall(), [(2, 2)])
        db.execute("update ZEMX_B_TaskListOpDetail set IsMarkedForDeletion='X' where TaskListOpVersionCounter=2")
        self.assertEqual(db.execute(query + " where op.IsMarkedForDeletion=''").fetchall(), [])
        db.close()

    def test_selected_sequence_has_only_shipped_modules_and_working_links(self):
        import re
        out, _ = bp.build(['equipment'], out=self.tmp / 'selected.zip', root=ECC)
        with zipfile.ZipFile(out) as zf:
            seq = zf.read('mapping/MIGRATION_SEQUENCE.md').decode()
            self.assertNotIn('task_list', seq)
            for target in re.findall(r'\]\(([^)]+)\)', seq):
                self.assertIn('mapping/' + target, zf.namelist())

    def test_customer_delivery_is_self_contained_and_scopes_its_project(self):
        import subprocess
        out, manifest = bp.build(['equipment'], prefix='ZACME_', package='ZACME_MIG', out=self.tmp / 'customer.zip', root=ECC)
        delivery = self.tmp / 'delivery'
        with zipfile.ZipFile(out) as zf:
            zf.extractall(delivery)
            self.assertIn('helpers/zacme_eam_text_export.prog.abap', zf.namelist())
            self.assertIn('docs/LICENSE.md', zf.namelist())
            scopes = json.loads(zf.read('customer/contracts/structure-cohorts.json'))
            shipped = {o['name'] for o in manifest['objects']}
            self.assertTrue(set(scopes) <= shipped)
            project = json.loads(zf.read('customer/contracts/customer-cohort-project.json'))
            self.assertTrue(all(s['input'] in shipped for s in project['steps']))
        result = subprocess.run([sys.executable, 'tools/eam_run.py', '--project', 'customer/examples/workflow.json', '--out', 'example-results'], cwd=delivery, capture_output=True, text=True)
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
        self.assertTrue((delivery / 'example-results/PREPARATION_AUDIT.json').exists())

    def test_reading_selection_uses_date_time_then_document_id(self):
        import sqlite3
        import re
        db = sqlite3.connect(':memory:')
        db.executescript("""
          create table ZEMX_B_MeasurementDocument(MeasuringPoint,MeasurementDocument,MsmtRdngDate,MsmtRdngTime,MsmtDocumentIsCancelled);
          insert into ZEMX_B_MeasurementDocument values
            ('P',999,'20251001','120000',''), ('P',10,'20251002','080000',''),
            ('P',11,'20251002','090000',''), ('P',12,'20251002','090000',''),
            ('P',1000,'20251003','100000','X');
        """)
        for name in ('ZEMX_I_MeasPointLastDate','ZEMX_I_MeasPointLastTime','ZEMX_I_MeasPointLastDoc'):
            ddl = (ECC / 'src' / (name.lower()+'.ddls.asddls')).read_text()
            body = re.sub(r'^\s*@[^\n]+\n', '', ddl[ddl.index('{')+1:ddl.index('}')], flags=re.M)
            body = re.sub(r'\bkey\s+', '', body)
            source = ddl[ddl.index('as select from')+len('as select from'):ddl.index('{')]
            tail = ddl[ddl.index('}')+1:]
            db.execute('create view '+name+' as select '+body+' from '+source+' '+tail)
        self.assertEqual(db.execute('select * from ZEMX_I_MeasPointLastDoc').fetchall(), [('P',12)])
        db.close()

    def test_task_list_allocations_preserve_both_object_types_and_history(self):
        import sqlite3
        import re
        db = sqlite3.connect(':memory:')
        db.executescript("""
          create table eapl(plnty,plnnr,plnal,equnr,zkriz,zaehl,loekz);
          create table tapl(plnty,plnnr,plnal,tplnr,zkriz,zaehl,loekz);
          insert into eapl values ('E','G','1','EQ1',0,1,''),('E','G','1','EQ1',0,2,'X');
          insert into tapl values ('T','G','1','FL1',0,1,'');
        """)
        for name in ('ZEMX_B_EquipTaskListAsgmt','ZEMX_B_FuncTaskListAsgmt','ZEMX_I_TaskListObjectAssgmt'):
            ddl = bp.strip_comments((ECC / 'src' / (name.lower()+'.ddls.asddls')).read_text(), 'DDLS')
            sql = ddl[ddl.index('as select from')+3:]
            sql = re.sub(r'^\s*@[^\n]+\n', '', sql, flags=re.M)
            sql = re.sub(r'\bkey\s+', '', sql)
            sql = re.sub(r"cast\( '' as abap.char\(\d+\) \)", "''", sql)
            parts = re.split(r'\bunion all\b', sql)
            selects = []
            for part in parts:
                source = part[part.index('select from')+len('select from'):part.index('{')]
                body = part[part.index('{')+1:part.index('}')]
                selects.append('select '+body+' from '+source)
            db.execute('create view '+name+' as '+' union all '.join(selects))
        rows = db.execute('select Equipment,FunctionalLocation,AssignmentCounter,IsMarkedForDeletion from ZEMX_I_TaskListObjectAssgmt order by TaskListType,AssignmentCounter').fetchall()
        self.assertEqual(rows, [('EQ1','',1,''),('EQ1','',2,'X'),('','FL1',1,'')])
        db.close()

    def test_sql_view_name_too_long_for_prefix(self):
        with self.assertRaises(bp.BuildError) as ctx:
            bp.check_lengths([("DDLS", "ZEMX_I_Equipment", "equipment")], "ZEMX_", "ZABCDEFGHIJKLM_",
                             {"DDLS": 30, "SQLVIEW": 16}, ECC)
        self.assertIn("SQL view name", str(ctx.exception))

    def test_sql_view_name_is_not_a_reference(self):
        self.assertEqual(bp.references("DDLS", "ZEMX_B_EquipmentDesc", "ZEMX_", ECC), set())

    def test_bundle_refuses_mixed_systems(self):
        args = argparse.Namespace(all=False, product_all=None, modules=["eam:equipment", "eam_mig_ecc:equipment"])
        with self.assertRaises(bb.BundleError) as ctx:
            bb.build(args, "ZACME_", "ZACME_VDM", out=self.tmp / "b.zip")
        self.assertIn("one system", str(ctx.exception))

    def test_bundle_all_excludes_ecc_products(self):
        args = argparse.Namespace(all=True, product_all=None, modules=[])
        _, manifest = bb.build(args, "ZACME_", "ZACME_VDM", out=self.tmp / "c.zip")
        self.assertNotIn("eam_mig_ecc", manifest["products"])
        self.assertIn("eam_mig_s4", manifest["products"])


if __name__ == "__main__":
    unittest.main()
