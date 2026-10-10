# Migration interface: compliance

> Status: **draft-unverified** · tested release: none (draft, customer staging on NetWeaver 7.40 SP08+ assumed). Nothing below has been run on a system.

- **Read by:** Customer-selected supported business interface; stages are not posting
- **Load after:** `ehs_location`, `chemical_property`, `environmental_data`
- **Business key:** `SourceSystem`, `SourceClient`, `ExportBatch`, `RequirementID`, `Version` · numbering **keep**
- **Key rule:** Origin metadata identifies the source cohort. Normalize mapped target identifiers back to source keys and retain original target IDs in a separate audit ledger.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZEHX_C_ComplianceReqMig`

- Source: `ZEHX_I_ComplianceReq`
- Keys: `SourceSystem`, `SourceClient`, `ExportBatch`, `RequirementID`, `Version`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Approve native source completeness, business state and parent/child closure. Select one origin cohort. Customer stages do not establish business eligibility. Specification records and modern EHSM objects are not interchangeable. Preserve versions, validity, regulatory jurisdiction, units, multilingual phrases and native evaluation semantics. Incident people/medical content needs restricted access; attachments and long texts use approved repository/text interfaces. Historic assessments, measurements and incidents are reference data until a supported target object is selected. Product Compliance and Dangerous Goods have separate object/release scopes; a canonical contract does not certify legal or regulatory content.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SourceSystem` | ZEHX_EHS019-F001 | Customer native interface: SourceSystem (adapter required) | copy | yes |
| `SourceClient` | ZEHX_EHS019-F002 | Customer native interface: SourceClient (adapter required) | copy | yes |
| `ExportBatch` | ZEHX_EHS019-F003 | Customer native interface: ExportBatch (adapter required) | copy | yes |
| `RequirementID` | ZEHX_EHS019-F004 | Customer native interface: RequirementID (adapter required) | copy | yes |
| `Version` | ZEHX_EHS019-F005 | Customer native interface: Version (adapter required) | copy | yes |
| `RegulatoryArea` | ZEHX_EHS019-F006 | Customer native interface: RegulatoryArea (adapter required) | copy | yes |
| `Description` | ZEHX_EHS019-F007 | Customer native interface: Description (adapter required) | copy | yes |
| `ValidityStartDate` | ZEHX_EHS019-F008 | Customer native interface: ValidityStartDate (adapter required) | copy | yes |
| `ValidityEndDate` | ZEHX_EHS019-F009 | Customer native interface: ValidityEndDate (adapter required) | copy | yes |

## `ZEHX_C_ComplianceScenMig`

- Source: `ZEHX_I_ComplianceScen`
- Keys: `SourceSystem`, `SourceClient`, `ExportBatch`, `ScenarioID`, `Version`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Approve native source completeness, business state and parent/child closure. Select one origin cohort. Customer stages do not establish business eligibility. Specification records and modern EHSM objects are not interchangeable. Preserve versions, validity, regulatory jurisdiction, units, multilingual phrases and native evaluation semantics. Incident people/medical content needs restricted access; attachments and long texts use approved repository/text interfaces. Historic assessments, measurements and incidents are reference data until a supported target object is selected. Product Compliance and Dangerous Goods have separate object/release scopes; a canonical contract does not certify legal or regulatory content.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SourceSystem` | ZEHX_EHS020-F001 | Customer native interface: SourceSystem (adapter required) | copy | yes |
| `SourceClient` | ZEHX_EHS020-F002 | Customer native interface: SourceClient (adapter required) | copy | yes |
| `ExportBatch` | ZEHX_EHS020-F003 | Customer native interface: ExportBatch (adapter required) | copy | yes |
| `ScenarioID` | ZEHX_EHS020-F004 | Customer native interface: ScenarioID (adapter required) | copy | yes |
| `Version` | ZEHX_EHS020-F005 | Customer native interface: Version (adapter required) | copy | yes |
| `LocationID` | ZEHX_EHS020-F006 | Customer native interface: LocationID (adapter required) | copy | yes |
| `Description` | ZEHX_EHS020-F007 | Customer native interface: Description (adapter required) | copy | yes |
| `ScenarioStatus` | ZEHX_EHS020-F008 | Customer native interface: ScenarioStatus (adapter required) | copy | yes |

## `ZEHX_C_ComplianceLinkMig`

- Source: `ZEHX_I_ComplianceLink`
- Keys: `SourceSystem`, `SourceClient`, `ExportBatch`, `ScenarioID`, `Version`, `RequirementID`, `RequirementVersion`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Approve native source completeness, business state and parent/child closure. Select one origin cohort. Customer stages do not establish business eligibility. Specification records and modern EHSM objects are not interchangeable. Preserve versions, validity, regulatory jurisdiction, units, multilingual phrases and native evaluation semantics. Incident people/medical content needs restricted access; attachments and long texts use approved repository/text interfaces. Historic assessments, measurements and incidents are reference data until a supported target object is selected. Product Compliance and Dangerous Goods have separate object/release scopes; a canonical contract does not certify legal or regulatory content.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SourceSystem` | ZEHX_EHS021-F001 | Customer native interface: SourceSystem (adapter required) | copy | yes |
| `SourceClient` | ZEHX_EHS021-F002 | Customer native interface: SourceClient (adapter required) | copy | yes |
| `ExportBatch` | ZEHX_EHS021-F003 | Customer native interface: ExportBatch (adapter required) | copy | yes |
| `ScenarioID` | ZEHX_EHS021-F004 | Customer native interface: ScenarioID (adapter required) | copy | yes |
| `Version` | ZEHX_EHS021-F005 | Customer native interface: Version (adapter required) | copy | yes |
| `RequirementID` | ZEHX_EHS021-F006 | Customer native interface: RequirementID (adapter required) | copy | yes |
| `RequirementVersion` | ZEHX_EHS021-F007 | Customer native interface: RequirementVersion (adapter required) | copy | yes |
| `ClassifierID` | ZEHX_EHS021-F008 | Customer native interface: ClassifierID (adapter required) | copy | yes |
| `PropertyID` | ZEHX_EHS021-F009 | Customer native interface: PropertyID (adapter required) | copy | yes |

## Reconciliation

- Counts: `ZEHX_C_ComplianceReqMigCount` (ECC) vs `ZEHT_I_ComplianceReqCount` (S/4HANA) per `SourceSystem`, `SourceClient`, `ExportBatch`
- Records and fields: `ZEHX_C_ComplianceReqMig` vs `ZEHT_I_ComplianceReqCompare` on `SourceSystem`, `SourceClient`, `ExportBatch`, `RequirementID`, `Version`; compared: `RegulatoryArea`, `Description`, `ValidityStartDate`, `ValidityEndDate`

```bash
python3 tools/mig_reconcile.py counts --product ehs_mig_src --module compliance --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --product ehs_mig_src --module compliance --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- Specification records and modern EHSM objects are not interchangeable. Preserve versions, validity, regulatory jurisdiction, units, multilingual phrases and native evaluation semantics. Incident people/medical content needs restricted access; attachments and long texts use approved repository/text interfaces. Historic assessments, measurements and incidents are reference data until a supported target object is selected. Product Compliance and Dangerous Goods have separate object/release scopes; a canonical contract does not certify legal or regulatory content.
- Native export adapters and target business posting are customer implementations.
