# Migration interface: ehs_location

> Status: **draft-unverified** · tested release: none (draft, customer staging on NetWeaver 7.40 SP08+ assumed). Nothing below has been run on a system.

- **Read by:** Customer-selected supported business interface; stages are not posting
- **Load after:** - (first level)
- **Business key:** `SourceSystem`, `SourceClient`, `ExportBatch`, `LocationID` · numbering **keep**
- **Key rule:** Origin metadata identifies the source cohort. Normalize mapped target identifiers back to source keys and retain original target IDs in a separate audit ledger.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZEHX_C_EHSLocationMig`

- Source: `ZEHX_I_EHSLocation`
- Keys: `SourceSystem`, `SourceClient`, `ExportBatch`, `LocationID`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Approve native source completeness, business state and parent/child closure. Select one origin cohort. Customer stages do not establish business eligibility. Specification records and modern EHSM objects are not interchangeable. Preserve versions, validity, regulatory jurisdiction, units, multilingual phrases and native evaluation semantics. Incident people/medical content needs restricted access; attachments and long texts use approved repository/text interfaces. Historic assessments, measurements and incidents are reference data until a supported target object is selected. Product Compliance and Dangerous Goods have separate object/release scopes; a canonical contract does not certify legal or regulatory content.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SourceSystem` | ZEHX_EHS001-F001 | Customer native interface: SourceSystem (adapter required) | copy | yes |
| `SourceClient` | ZEHX_EHS001-F002 | Customer native interface: SourceClient (adapter required) | copy | yes |
| `ExportBatch` | ZEHX_EHS001-F003 | Customer native interface: ExportBatch (adapter required) | copy | yes |
| `LocationID` | ZEHX_EHS001-F004 | Customer native interface: LocationID (adapter required) | copy | yes |
| `LocationType` | ZEHX_EHS001-F005 | Customer native interface: LocationType (adapter required) | copy | yes |
| `Description` | ZEHX_EHS001-F006 | Customer native interface: Description (adapter required) | copy | yes |
| `Plant` | ZEHX_EHS001-F007 | Customer native interface: Plant (adapter required) | copy | yes |
| `Country` | ZEHX_EHS001-F008 | Customer native interface: Country (adapter required) | copy | yes |
| `TimeZone` | ZEHX_EHS001-F009 | Customer native interface: TimeZone (adapter required) | copy | yes |
| `ValidityStartDate` | ZEHX_EHS001-F010 | Customer native interface: ValidityStartDate (adapter required) | copy | yes |
| `ValidityEndDate` | ZEHX_EHS001-F011 | Customer native interface: ValidityEndDate (adapter required) | copy | yes |

## `ZEHX_C_EHSLocHierarchMig`

- Source: `ZEHX_I_EHSLocHierarch`
- Keys: `SourceSystem`, `SourceClient`, `ExportBatch`, `HierarchyID`, `ParentLocation`, `ChildLocation`, `ValidityStartDate`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Approve native source completeness, business state and parent/child closure. Select one origin cohort. Customer stages do not establish business eligibility. Specification records and modern EHSM objects are not interchangeable. Preserve versions, validity, regulatory jurisdiction, units, multilingual phrases and native evaluation semantics. Incident people/medical content needs restricted access; attachments and long texts use approved repository/text interfaces. Historic assessments, measurements and incidents are reference data until a supported target object is selected. Product Compliance and Dangerous Goods have separate object/release scopes; a canonical contract does not certify legal or regulatory content.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SourceSystem` | ZEHX_EHS002-F001 | Customer native interface: SourceSystem (adapter required) | copy | yes |
| `SourceClient` | ZEHX_EHS002-F002 | Customer native interface: SourceClient (adapter required) | copy | yes |
| `ExportBatch` | ZEHX_EHS002-F003 | Customer native interface: ExportBatch (adapter required) | copy | yes |
| `HierarchyID` | ZEHX_EHS002-F004 | Customer native interface: HierarchyID (adapter required) | copy | yes |
| `ParentLocation` | ZEHX_EHS002-F005 | Customer native interface: ParentLocation (adapter required) | copy | yes |
| `ChildLocation` | ZEHX_EHS002-F006 | Customer native interface: ChildLocation (adapter required) | copy | yes |
| `ValidityStartDate` | ZEHX_EHS002-F007 | Customer native interface: ValidityStartDate (adapter required) | copy | yes |
| `ValidityEndDate` | ZEHX_EHS002-F008 | Customer native interface: ValidityEndDate (adapter required) | copy | yes |

## Reconciliation

- Counts: `ZEHX_C_EHSLocationMigCount` (ECC) vs `ZEHT_I_EHSLocationCount` (S/4HANA) per `SourceSystem`, `SourceClient`, `ExportBatch`
- Records and fields: `ZEHX_C_EHSLocationMig` vs `ZEHT_I_EHSLocationCompare` on `SourceSystem`, `SourceClient`, `ExportBatch`, `LocationID`; compared: `LocationType`, `Description`, `Plant`, `Country`, `TimeZone`, `ValidityStartDate`, `ValidityEndDate`

```bash
python3 tools/mig_reconcile.py counts --product ehs_mig_src --module ehs_location --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --product ehs_mig_src --module ehs_location --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- Specification records and modern EHSM objects are not interchangeable. Preserve versions, validity, regulatory jurisdiction, units, multilingual phrases and native evaluation semantics. Incident people/medical content needs restricted access; attachments and long texts use approved repository/text interfaces. Historic assessments, measurements and incidents are reference data until a supported target object is selected. Product Compliance and Dangerous Goods have separate object/release scopes; a canonical contract does not certify legal or regulatory content.
- Native export adapters and target business posting are customer implementations.
