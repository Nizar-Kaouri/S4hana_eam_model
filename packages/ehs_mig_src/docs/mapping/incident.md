# Migration interface: incident

> Status: **draft-unverified** · tested release: none (draft, customer staging on NetWeaver 7.40 SP08+ assumed). Nothing below has been run on a system.

- **Read by:** Customer-selected supported business interface; stages are not posting
- **Load after:** `ehs_location`
- **Business key:** `SourceSystem`, `SourceClient`, `ExportBatch`, `IncidentID` · numbering **keep**
- **Key rule:** Origin metadata identifies the source cohort. Normalize mapped target identifiers back to source keys and retain original target IDs in a separate audit ledger.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZEHX_C_IncidentMig`

- Source: `ZEHX_I_Incident`
- Keys: `SourceSystem`, `SourceClient`, `ExportBatch`, `IncidentID`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: Approve native source completeness, business state and parent/child closure. Select one origin cohort. Customer stages do not establish business eligibility. Specification records and modern EHSM objects are not interchangeable. Preserve versions, validity, regulatory jurisdiction, units, multilingual phrases and native evaluation semantics. Incident people/medical content needs restricted access; attachments and long texts use approved repository/text interfaces. Historic assessments, measurements and incidents are reference data until a supported target object is selected. Product Compliance and Dangerous Goods have separate object/release scopes; a canonical contract does not certify legal or regulatory content.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SourceSystem` | ZEHX_EHS010-F001 | Customer native interface: SourceSystem (adapter required) | information only | yes |
| `SourceClient` | ZEHX_EHS010-F002 | Customer native interface: SourceClient (adapter required) | information only | yes |
| `ExportBatch` | ZEHX_EHS010-F003 | Customer native interface: ExportBatch (adapter required) | information only | yes |
| `IncidentID` | ZEHX_EHS010-F004 | Customer native interface: IncidentID (adapter required) | information only | yes |
| `IncidentType` | ZEHX_EHS010-F005 | Customer native interface: IncidentType (adapter required) | information only | yes |
| `LocationID` | ZEHX_EHS010-F006 | Customer native interface: LocationID (adapter required) | information only | yes |
| `OccurredAtUTC` | ZEHX_EHS010-F007 | Customer native interface: OccurredAtUTC (adapter required) | information only | yes |
| `TimeZone` | ZEHX_EHS010-F008 | Customer native interface: TimeZone (adapter required) | information only | yes |
| `IncidentStatus` | ZEHX_EHS010-F009 | Customer native interface: IncidentStatus (adapter required) | information only | yes |
| `Description` | ZEHX_EHS010-F010 | Customer native interface: Description (adapter required) | information only | yes |

## `ZEHX_C_IncidentPersonMig`

- Source: `ZEHX_I_IncidentPerson`
- Keys: `SourceSystem`, `SourceClient`, `ExportBatch`, `IncidentID`, `PersonRole`, `PersonID`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: Approve native source completeness, business state and parent/child closure. Select one origin cohort. Customer stages do not establish business eligibility. Specification records and modern EHSM objects are not interchangeable. Preserve versions, validity, regulatory jurisdiction, units, multilingual phrases and native evaluation semantics. Incident people/medical content needs restricted access; attachments and long texts use approved repository/text interfaces. Historic assessments, measurements and incidents are reference data until a supported target object is selected. Product Compliance and Dangerous Goods have separate object/release scopes; a canonical contract does not certify legal or regulatory content.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SourceSystem` | ZEHX_EHS011-F001 | Customer native interface: SourceSystem (adapter required) | information only | yes |
| `SourceClient` | ZEHX_EHS011-F002 | Customer native interface: SourceClient (adapter required) | information only | yes |
| `ExportBatch` | ZEHX_EHS011-F003 | Customer native interface: ExportBatch (adapter required) | information only | yes |
| `IncidentID` | ZEHX_EHS011-F004 | Customer native interface: IncidentID (adapter required) | information only | yes |
| `PersonRole` | ZEHX_EHS011-F005 | Customer native interface: PersonRole (adapter required) | information only | yes |
| `PersonID` | ZEHX_EHS011-F006 | Customer native interface: PersonID (adapter required) | information only | yes |
| `BusinessPartner` | ZEHX_EHS011-F007 | Customer native interface: BusinessPartner (adapter required) | information only | yes |
| `RestrictedRecordReference` | ZEHX_EHS011-F008 | Customer native interface: RestrictedRecordReference (adapter required) | information only | yes |

## `ZEHX_C_IncidentActionMig`

- Source: `ZEHX_I_IncidentAction`
- Keys: `SourceSystem`, `SourceClient`, `ExportBatch`, `IncidentID`, `ActionID`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: Approve native source completeness, business state and parent/child closure. Select one origin cohort. Customer stages do not establish business eligibility. Specification records and modern EHSM objects are not interchangeable. Preserve versions, validity, regulatory jurisdiction, units, multilingual phrases and native evaluation semantics. Incident people/medical content needs restricted access; attachments and long texts use approved repository/text interfaces. Historic assessments, measurements and incidents are reference data until a supported target object is selected. Product Compliance and Dangerous Goods have separate object/release scopes; a canonical contract does not certify legal or regulatory content.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SourceSystem` | ZEHX_EHS012-F001 | Customer native interface: SourceSystem (adapter required) | information only | yes |
| `SourceClient` | ZEHX_EHS012-F002 | Customer native interface: SourceClient (adapter required) | information only | yes |
| `ExportBatch` | ZEHX_EHS012-F003 | Customer native interface: ExportBatch (adapter required) | information only | yes |
| `IncidentID` | ZEHX_EHS012-F004 | Customer native interface: IncidentID (adapter required) | information only | yes |
| `ActionID` | ZEHX_EHS012-F005 | Customer native interface: ActionID (adapter required) | information only | yes |
| `ActionType` | ZEHX_EHS012-F006 | Customer native interface: ActionType (adapter required) | information only | yes |
| `ResponsiblePartner` | ZEHX_EHS012-F007 | Customer native interface: ResponsiblePartner (adapter required) | information only | yes |
| `DueDate` | ZEHX_EHS012-F008 | Customer native interface: DueDate (adapter required) | information only | yes |
| `ActionStatus` | ZEHX_EHS012-F009 | Customer native interface: ActionStatus (adapter required) | information only | yes |

## Reconciliation

- Counts: `ZEHX_C_IncidentMigCount` (ECC) vs `ZEHT_I_IncidentCount` (S/4HANA) per `SourceSystem`, `SourceClient`, `ExportBatch`
- Records and fields: `ZEHX_C_IncidentMig` vs `ZEHT_I_IncidentCompare` on `SourceSystem`, `SourceClient`, `ExportBatch`, `IncidentID`; compared: `IncidentType`, `LocationID`, `OccurredAtUTC`, `TimeZone`, `IncidentStatus`, `Description`

```bash
python3 tools/mig_reconcile.py counts --product ehs_mig_src --module incident --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --product ehs_mig_src --module incident --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- Specification records and modern EHSM objects are not interchangeable. Preserve versions, validity, regulatory jurisdiction, units, multilingual phrases and native evaluation semantics. Incident people/medical content needs restricted access; attachments and long texts use approved repository/text interfaces. Historic assessments, measurements and incidents are reference data until a supported target object is selected. Product Compliance and Dangerous Goods have separate object/release scopes; a canonical contract does not certify legal or regulatory content.
- Native export adapters and target business posting are customer implementations.
