# Migration interface: risk_assessment

> Status: **draft-unverified** · tested release: none (draft, customer staging on NetWeaver 7.40 SP08+ assumed). Nothing below has been run on a system.

- **Read by:** Customer-selected supported business interface; stages are not posting
- **Load after:** `ehs_location`
- **Business key:** `SourceSystem`, `SourceClient`, `ExportBatch`, `AssessmentID`, `Version` · numbering **keep**
- **Key rule:** Origin metadata identifies the source cohort. Normalize mapped target identifiers back to source keys and retain original target IDs in a separate audit ledger.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZEHX_C_RiskAssessmentMig`

- Source: `ZEHX_I_RiskAssessment`
- Keys: `SourceSystem`, `SourceClient`, `ExportBatch`, `AssessmentID`, `Version`
- Scope: `all rows`
- Delivery mode: **reference**
- Before posting: Approve native source completeness, business state and parent/child closure. Select one origin cohort. Customer stages do not establish business eligibility. Specification records and modern EHSM objects are not interchangeable. Preserve versions, validity, regulatory jurisdiction, units, multilingual phrases and native evaluation semantics. Incident people/medical content needs restricted access; attachments and long texts use approved repository/text interfaces. Historic assessments, measurements and incidents are reference data until a supported target object is selected. Product Compliance and Dangerous Goods have separate object/release scopes; a canonical contract does not certify legal or regulatory content.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SourceSystem` | ZEHX_EHS013-F001 | Customer native interface: SourceSystem (adapter required) | information only | yes |
| `SourceClient` | ZEHX_EHS013-F002 | Customer native interface: SourceClient (adapter required) | information only | yes |
| `ExportBatch` | ZEHX_EHS013-F003 | Customer native interface: ExportBatch (adapter required) | information only | yes |
| `AssessmentID` | ZEHX_EHS013-F004 | Customer native interface: AssessmentID (adapter required) | information only | yes |
| `Version` | ZEHX_EHS013-F005 | Customer native interface: Version (adapter required) | information only | yes |
| `LocationID` | ZEHX_EHS013-F006 | Customer native interface: LocationID (adapter required) | information only | yes |
| `ValidityStartDate` | ZEHX_EHS013-F007 | Customer native interface: ValidityStartDate (adapter required) | information only | yes |
| `ValidityEndDate` | ZEHX_EHS013-F008 | Customer native interface: ValidityEndDate (adapter required) | information only | yes |
| `AssessmentStatus` | ZEHX_EHS013-F009 | Customer native interface: AssessmentStatus (adapter required) | information only | yes |

## `ZEHX_C_RiskHazardMig`

- Source: `ZEHX_I_RiskHazard`
- Keys: `SourceSystem`, `SourceClient`, `ExportBatch`, `AssessmentID`, `Version`, `HazardID`
- Scope: `all rows`
- Delivery mode: **reference**
- Before posting: Approve native source completeness, business state and parent/child closure. Select one origin cohort. Customer stages do not establish business eligibility. Specification records and modern EHSM objects are not interchangeable. Preserve versions, validity, regulatory jurisdiction, units, multilingual phrases and native evaluation semantics. Incident people/medical content needs restricted access; attachments and long texts use approved repository/text interfaces. Historic assessments, measurements and incidents are reference data until a supported target object is selected. Product Compliance and Dangerous Goods have separate object/release scopes; a canonical contract does not certify legal or regulatory content.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SourceSystem` | ZEHX_EHS014-F001 | Customer native interface: SourceSystem (adapter required) | information only | yes |
| `SourceClient` | ZEHX_EHS014-F002 | Customer native interface: SourceClient (adapter required) | information only | yes |
| `ExportBatch` | ZEHX_EHS014-F003 | Customer native interface: ExportBatch (adapter required) | information only | yes |
| `AssessmentID` | ZEHX_EHS014-F004 | Customer native interface: AssessmentID (adapter required) | information only | yes |
| `Version` | ZEHX_EHS014-F005 | Customer native interface: Version (adapter required) | information only | yes |
| `HazardID` | ZEHX_EHS014-F006 | Customer native interface: HazardID (adapter required) | information only | yes |
| `HazardType` | ZEHX_EHS014-F007 | Customer native interface: HazardType (adapter required) | information only | yes |
| `Likelihood` | ZEHX_EHS014-F008 | Customer native interface: Likelihood (adapter required) | information only | yes |
| `Severity` | ZEHX_EHS014-F009 | Customer native interface: Severity (adapter required) | information only | yes |
| `RiskRating` | ZEHX_EHS014-F010 | Customer native interface: RiskRating (adapter required) | information only | yes |
| `RatingScheme` | ZEHX_EHS014-F011 | Customer native interface: RatingScheme (adapter required) | information only | yes |

## `ZEHX_C_RiskControlMig`

- Source: `ZEHX_I_RiskControl`
- Keys: `SourceSystem`, `SourceClient`, `ExportBatch`, `AssessmentID`, `Version`, `HazardID`, `ControlID`
- Scope: `all rows`
- Delivery mode: **reference**
- Before posting: Approve native source completeness, business state and parent/child closure. Select one origin cohort. Customer stages do not establish business eligibility. Specification records and modern EHSM objects are not interchangeable. Preserve versions, validity, regulatory jurisdiction, units, multilingual phrases and native evaluation semantics. Incident people/medical content needs restricted access; attachments and long texts use approved repository/text interfaces. Historic assessments, measurements and incidents are reference data until a supported target object is selected. Product Compliance and Dangerous Goods have separate object/release scopes; a canonical contract does not certify legal or regulatory content.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SourceSystem` | ZEHX_EHS015-F001 | Customer native interface: SourceSystem (adapter required) | information only | yes |
| `SourceClient` | ZEHX_EHS015-F002 | Customer native interface: SourceClient (adapter required) | information only | yes |
| `ExportBatch` | ZEHX_EHS015-F003 | Customer native interface: ExportBatch (adapter required) | information only | yes |
| `AssessmentID` | ZEHX_EHS015-F004 | Customer native interface: AssessmentID (adapter required) | information only | yes |
| `Version` | ZEHX_EHS015-F005 | Customer native interface: Version (adapter required) | information only | yes |
| `HazardID` | ZEHX_EHS015-F006 | Customer native interface: HazardID (adapter required) | information only | yes |
| `ControlID` | ZEHX_EHS015-F007 | Customer native interface: ControlID (adapter required) | information only | yes |
| `ControlType` | ZEHX_EHS015-F008 | Customer native interface: ControlType (adapter required) | information only | yes |
| `Description` | ZEHX_EHS015-F009 | Customer native interface: Description (adapter required) | information only | yes |
| `ResponsiblePartner` | ZEHX_EHS015-F010 | Customer native interface: ResponsiblePartner (adapter required) | information only | yes |
| `ControlStatus` | ZEHX_EHS015-F011 | Customer native interface: ControlStatus (adapter required) | information only | yes |

## Reconciliation

- Counts: `ZEHX_C_RiskAssessmentMigCount` (ECC) vs `ZEHT_I_RiskAssessmentCount` (S/4HANA) per `SourceSystem`, `SourceClient`, `ExportBatch`
- Records and fields: `ZEHX_C_RiskAssessmentMig` vs `ZEHT_I_RiskAssessmentCompare` on `SourceSystem`, `SourceClient`, `ExportBatch`, `AssessmentID`, `Version`; compared: `LocationID`, `ValidityStartDate`, `ValidityEndDate`, `AssessmentStatus`

```bash
python3 tools/mig_reconcile.py counts --product ehs_mig_src --module risk_assessment --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --product ehs_mig_src --module risk_assessment --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- Specification records and modern EHSM objects are not interchangeable. Preserve versions, validity, regulatory jurisdiction, units, multilingual phrases and native evaluation semantics. Incident people/medical content needs restricted access; attachments and long texts use approved repository/text interfaces. Historic assessments, measurements and incidents are reference data until a supported target object is selected. Product Compliance and Dangerous Goods have separate object/release scopes; a canonical contract does not certify legal or regulatory content.
- Native export adapters and target business posting are customer implementations.
