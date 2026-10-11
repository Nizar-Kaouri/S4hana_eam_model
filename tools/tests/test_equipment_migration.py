"""Execute the changed CDS relational selections on fixtures (not an SAP activation test)."""
import json
import re
import sqlite3
import sys
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
PRODUCT = ROOT / 'packages/eam_mig_ecc'
sys.path.insert(0, str(ROOT / 'tools'))
import eam_prepare as ep


def cds_sql(name):
    text = (PRODUCT / 'src' / (name.lower() + '.ddls.asddls')).read_text(encoding='utf-8')
    text = re.sub(r'//[^\n]*', '', text)
    text = re.sub(r'^\s*@[^\n]*', '', text, flags=re.M)
    tail = re.split(r'\bas select from\b', text, flags=re.I)[1]
    before, rest = tail.split('{', 1)
    projection, after = rest.split('}', 1)
    projection = re.sub(r'\bkey\s+', '', projection)
    return 'select ' + projection.strip() + ' from ' + before.strip() + ' ' + after.strip()


class EquipmentMigrationTests(unittest.TestCase):
    def setUp(self):
        self.db = sqlite3.connect(':memory:')
        self.db.row_factory = sqlite3.Row
        # The master has existing CDS path associations. Expand their to-one
        # targets for this relational fixture, using the actual address association predicates.
        master = cds_sql('ZEMX_I_Equipment')
        association = re.search(r'association \[0\.\.1\] to ZEMX_B_Address as _Address on (.*?) where', master, re.S)
        self.assertIsNotNone(association)
        address_on = association.group(1).strip().replace('$projection.AddressNumber', 'loc.AddressNumber').replace('_Address.', 'adr.')
        master = master[:association.start()] + master[association.end()-5:]
        master = master.replace('_Address.', 'adr.')
        master = master.replace('seg._LocAcctAssignment.', 'loc.').replace('seg._MainWorkCenter.', 'wc.').replace('eq._DeletionFlag.', 'df.')
        for alias, table in [('eq', 'ZEMX_B_EquipmentHeader'), ('seg', 'ZEMX_B_EquipmentTimeSegment'), ('loc', 'ZEMX_B_LocAcctAssignment'), ('wc', 'workcenters'), ('df', 'deletions')]:
            cols = set(re.findall(r'\b' + alias + r'\.(\w+)', master))
            if alias == 'seg': cols |= {'LocAcctAssignment', 'MainWorkCenterInternalID'}
            if alias == 'loc': cols.add('LocAcctAssignment')
            if alias == 'wc': cols.add('WorkCenterInternalID')
            if alias == 'df': cols.add('ObjectNumber')
            self.table(table, cols)
        adrc = cds_sql('ZEMX_B_Address')
        self.table('adrc', set(re.findall(r'\ba\.(\w+)', adrc)))
        self.db.execute('create view ZEMX_B_Address as ' + adrc)
        master = master.replace("where seg.ValidityEndDate", "left join ZEMX_B_LocAcctAssignment as loc on loc.LocAcctAssignment = seg.LocAcctAssignment left join ZEMX_B_Address as adr on " + address_on + " left join workcenters as wc on wc.WorkCenterInternalID = seg.MainWorkCenterInternalID left join deletions as df on df.ObjectNumber = eq.ObjectNumber where seg.ValidityEndDate")
        self.db.execute('create view ZEMX_I_Equipment as ' + master)
        self.db.execute('create view ZEMX_C_EquipmentMig as ' + cds_sql('ZEMX_C_EquipmentMig'))
        for eq, obj, address, deleted in [('E1', 'IE1', 'A1', False), ('E2', 'IE2', '', False), ('E3', 'IE3', 'A3', True), ('E4', 'IE4', 'A4', False)]:
            self.insert('ZEMX_B_EquipmentHeader', Equipment=eq, ObjectNumber=obj)
            self.insert('ZEMX_B_EquipmentTimeSegment', Equipment=eq, ValidityEndDate='99991231', LocAcctAssignment=eq)
            self.insert('ZEMX_B_LocAcctAssignment', LocAcctAssignment=eq, AddressNumber=address)
            if deleted: self.insert('deletions', ObjectNumber=obj, StatusCode='I0076')
        for number, date, version, city in [('A1', '00010101', '', 'Berlin'), ('A1', '00010101', 'I', 'International'), ('A1', '20200101', '', 'Other date'), ('A3', '00010101', '', 'Deleted'), ('A4', '00010101', 'I', 'Only international')]:
            self.insert('adrc', addrnumber=number, date_from=date, nation=version, city1=city)
        self.table('ZEMX_B_EquipmentDesc', ['Equipment', 'Language', 'EquipmentName'])
        self.table('ZEMX_B_ObjectPartner', ['ObjectNumber', 'PartnerFunction', 'PartnerCounter', 'Partner', 'IsMarkedForDeletion'])
        self.table('ZEMX_I_ObjectStatus', ['ObjectNumber', 'StatusCode', 'StatusKind', 'StatusProfile', 'StatusChangeNumber'])
        self.table('ZEMX_B_LongTextHeader', ['TextObject', 'TextName', 'TextID', 'Language'])
        for eq in ['E1', 'E3', 'ORPHAN']:
            for lang in ['E', 'D']: self.insert('ZEMX_B_EquipmentDesc', Equipment=eq, Language=lang, EquipmentName=eq + lang)
            for counter in range(3): self.insert('ZEMX_B_ObjectPartner', ObjectNumber='I'+eq, PartnerFunction='LF', PartnerCounter=str(counter), Partner='P'+str(counter))
            for code, kind in [('I1','I'),('I2','I'),('E1','E'),('E2','E')]: self.insert('ZEMX_I_ObjectStatus', ObjectNumber='I'+eq, StatusCode=code, StatusKind=kind)
            self.insert('ZEMX_B_LongTextHeader', TextObject='EQUI', TextName=eq, TextID='LTXT', Language='E')
        self.insert('ZEMX_B_LongTextHeader', TextObject='EQUI', TextName='E1suffix', TextID='LTXT', Language='E')
        self.insert('ZEMX_B_LongTextHeader', TextObject='OTHER', TextName='E1', TextID='LTXT', Language='E')
        self.insert('ZEMX_B_ObjectPartner', ObjectNumber='IE1', PartnerFunction='LF', PartnerCounter='deleted', IsMarkedForDeletion='X')
        self.insert('ZEMX_B_EquipmentTimeSegment', Equipment='E1', ValidityEndDate='20200101', LocAcctAssignment='E1')
        for suffix in ['Text', 'Partner', 'Status', 'LongText', 'Address']:
            name = 'ZEMX_I_Equip' + suffix
            self.db.execute('create view ' + name + ' as ' + cds_sql(name))
        for name in ['ZEMX_C_EquipmentTextMig', 'ZEMX_C_EquipPartnerMig', 'ZEMX_C_EquipStatusMig', 'ZEMX_C_EquipUserStatusMig', 'ZEMX_C_EquipLongTextMig', 'ZEMX_C_EquipAddressMig']:
            self.db.execute('create view ' + name + ' as ' + cds_sql(name))

    def table(self, name, cols):
        self.db.execute('create table ' + name + ' (' + ','.join(c + " text default ''" for c in sorted(cols)) + ')')

    def insert(self, table, **values):
        self.db.execute('insert into ' + table + ' (' + ','.join(values) + ') values (' + ','.join('?' for _ in values) + ')', list(values.values()))

    def rows(self, view):
        return self.db.execute('select * from ' + view).fetchall()

    def tearDown(self):
        self.db.close()

    def test_master_grain_optional_addresses_and_versions(self):
        rows = {r['Equipment']: r for r in self.rows('ZEMX_C_EquipmentMig')}
        self.assertEqual(len(self.rows('ZEMX_C_EquipmentMig')), 3)
        self.assertEqual(set(rows), {'E1', 'E2', 'E4'})
        self.assertEqual(rows['E1']['AddressCity'], 'Berlin')
        self.assertEqual(rows['E1']['HasStandardAddress'], 'X')
        self.assertEqual(rows['E2']['HasStandardAddress'], '')
        self.assertEqual(rows['E4']['AddressNumber'], 'A4')
        self.assertEqual(rows['E4']['HasStandardAddress'], '')
        versions = self.rows('ZEMX_C_EquipAddressMig')
        self.assertEqual(len(versions), 4)
        self.assertEqual(len({(r['Equipment'],r['AddressValidFrom'],r['AddressVersion']) for r in versions}), 4)

    def test_repeating_children_do_not_multiply_master_or_include_orphans(self):
        for view, expected in [('ZEMX_C_EquipmentTextMig',2), ('ZEMX_C_EquipPartnerMig',3), ('ZEMX_C_EquipStatusMig',4), ('ZEMX_C_EquipUserStatusMig',2), ('ZEMX_C_EquipLongTextMig',1)]:
            rows = self.rows(view)
            self.assertEqual(len(rows), expected, view)
            self.assertEqual({r['Equipment'] for r in rows}, {'E1'}, view)
        self.assertEqual(len(self.rows('ZEMX_C_EquipmentMig')), 3)

    def test_equipment_cohort_recipes_include_every_new_child(self):
        contracts = json.loads((PRODUCT/'customer/contracts/structure-cohorts.json').read_text())
        project = json.loads((PRODUCT/'customer/contracts/customer-cohort-project.json').read_text())
        for name in ['ZEMX_C_EquipPartnerMig','ZEMX_C_EquipStatusMig','ZEMX_C_EquipUserStatusMig','ZEMX_C_EquipLongTextMig','ZEMX_C_EquipAddressMig']:
            self.assertEqual(contracts[name]['parent'], 'ZEMX_C_EquipmentMig')
            self.assertIn(name+'_scoped', project['outputs'])

    def test_customer_selected_population_filters_children_and_rejects_duplicate_roots(self):
        self.insert('ZEMX_B_ObjectPartner', ObjectNumber='IE4', PartnerFunction='LF', PartnerCounter='1', Partner='P4')
        children = [dict(r) for r in self.rows('ZEMX_C_EquipPartnerMig')]
        self.assertEqual(len(children), 4)
        selected = [{'Equipment': 'E1'}]
        result = ep.cohort(children, selected, ['Equipment'], ['Equipment'])
        self.assertEqual(len(result), 3)
        self.assertEqual({r['Equipment'] for r in result}, {'E1'})
        with self.assertRaises(ep.InputError):
            ep.cohort(children, selected + selected, ['Equipment'], ['Equipment'])


if __name__ == '__main__':
    unittest.main()
