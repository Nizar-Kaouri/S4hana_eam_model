# Migration interface: environmental_data

> Status: **draft-unverified** · tested release: none (draft, customer staging on NetWeaver 7.40 SP08+ assumed). Nothing below has been run on a system.

- **Read by:** Customer-selected supported business interface; stages are not posting
- **Load after:** `ehs_location`, `chemical_property`
- **Business key:** `SourceSystem`, `SourceClient`, `ExportBatch`, `ClassifierID` · numbering **keep**
- **Key rule:** Origin metadata identifies the source cohort. Normalize mapped target identifiers back to source keys and retain original target IDs in a separate audit ledger.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZEHX_C_DataClassifierMig`

- Source: `ZEHX_I_DataClassifier`
- Keys: `SourceSystem`, `SourceClient`, `ExportBatch`, `ClassifierID`
- Scope: `all rows`
- Delivery mode: **reference**
- Before posting: Approve native source completeness, business state and parent/child closure. Select one origin cohort. Customer stages do not establish business eligibility. Specification records and modern EHSM objects are not interchangeable. Preserve versions, validity, regulatory jurisdiction, units, multilingual phrases and native evaluation semantics. Incident people/medical content needs restricted access; attachments and long texts use approved repository/text interfaces. Historic assessments, measurements and incidents are reference data until a supported target object is selected. Product Compliance and Dangerous Goods have separate object/release scopes; a canonical contract does not certify legal or regulatory content.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SourceSystem` | ZEHX_EHS016-F001 | Customer native interface: SourceSystem (adapter required) | information only | yes |
| `SourceClient` | ZEHX_EHS016-F002 | Customer native interface: SourceClient (adapter required) | information only | yes |
| `ExportBatch` | ZEHX_EHS016-F003 | Customer native interface: ExportBatch (adapter required) | information only | yes |
| `ClassifierID` | ZEHX_EHS016-F004 | Customer native interface: ClassifierID (adapter required) | information only | yes |
| `Description` | ZEHX_EHS016-F005 | Customer native interface: Description (adapter required) | information only | yes |
| `ClassifierType` | ZEHX_EHS016-F006 | Customer native interface: ClassifierType (adapter required) | information only | yes |
| `PropertyID` | ZEHX_EHS016-F007 | Customer native interface: PropertyID (adapter required) | information only | yes |

## `ZEHX_C_DataCollectionMig`

- Source: `ZEHX_I_DataCollection`
- Keys: `SourceSystem`, `SourceClient`, `ExportBatch`, `CollectionID`
- Scope: `all rows`
- Delivery mode: **reference**
- Before posting: Approve native source completeness, business state and parent/child closure. Select one origin cohort. Customer stages do not establish business eligibility. Specification records and modern EHSM objects are not interchangeable. Preserve versions, validity, regulatory jurisdiction, units, multilingual phrases and native evaluation semantics. Incident people/medical content needs restricted access; attachments and long texts use approved repository/text interfaces. Historic assessments, measurements and incidents are reference data until a supported target object is selected. Product Compliance and Dangerous Goods have separate object/release scopes; a canonical contract does not certify legal or regulatory content.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SourceSystem` | ZEHX_EHS017-F001 | Customer native interface: SourceSystem (adapter required) | information only | yes |
| `SourceClient` | ZEHX_EHS017-F002 | Customer native interface: SourceClient (adapter required) | information only | yes |
| `ExportBatch` | ZEHX_EHS017-F003 | Customer native interface: ExportBatch (adapter required) | information only | yes |
| `CollectionID` | ZEHX_EHS017-F004 | Customer native interface: CollectionID (adapter required) | information only | yes |
| `LocationID` | ZEHX_EHS017-F005 | Customer native interface: LocationID (adapter required) | information only | yes |
| `ClassifierID` | ZEHX_EHS017-F006 | Customer native interface: ClassifierID (adapter required) | information only | yes |
| `Description` | ZEHX_EHS017-F007 | Customer native interface: Description (adapter required) | information only | yes |
| `ScheduleType` | ZEHX_EHS017-F008 | Customer native interface: ScheduleType (adapter required) | information only | yes |
| `TimeZone` | ZEHX_EHS017-F009 | Customer native interface: TimeZone (adapter required) | information only | yes |

## `ZEHX_C_MeasurementMig`

- Source: `ZEHX_I_Measurement`
- Keys: `SourceSystem`, `SourceClient`, `ExportBatch`, `CollectionID`, `MeasurementID`
- Scope: `all rows`
- Delivery mode: **reference**
- Before posting: Approve native source completeness, business state and parent/child closure. Select one origin cohort. Customer stages do not establish business eligibility. Specification records and modern EHSM objects are not interchangeable. Preserve versions, validity, regulatory jurisdiction, units, multilingual phrases and native evaluation semantics. Incident people/medical content needs restricted access; attachments and long texts use approved repository/text interfaces. Historic assessments, measurements and incidents are reference data until a supported target object is selected. Product Compliance and Dangerous Goods have separate object/release scopes; a canonical contract does not certify legal or regulatory content.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SourceSystem` | ZEHX_EHS018-F001 | Customer native interface: SourceSystem (adapter required) | information only | yes |
| `SourceClient` | ZEHX_EHS018-F002 | Customer native interface: SourceClient (adapter required) | information only | yes |
| `ExportBatch` | ZEHX_EHS018-F003 | Customer native interface: ExportBatch (adapter required) | information only | yes |
| `CollectionID` | ZEHX_EHS018-F004 | Customer native interface: CollectionID (adapter required) | information only | yes |
| `MeasurementID` | ZEHX_EHS018-F005 | Customer native interface: MeasurementID (adapter required) | information only | yes |
| `MeasuredAtUTC` | ZEHX_EHS018-F006 | Customer native interface: MeasuredAtUTC (adapter required) | information only | yes |
| `Value` | ZEHX_EHS018-F007 | Customer native interface: Value (adapter required) | information only | yes |
| `QuantityUnit` | ZEHX_EHS018-F008 | Customer native interface: QuantityUnit (adapter required) | information only | yes |
| `MethodID` | ZEHX_EHS018-F009 | Customer native interface: MethodID (adapter required) | information only | yes |
| `QualityStatus` | ZEHX_EHS018-F010 | Customer native interface: QualityStatus (adapter required) | information only | yes |

## Reconciliation

- Counts: `ZEHX_C_DataClassifierMigCount` (ECC) vs `ZEHT_I_DataClassifierCount` (S/4HANA) per `SourceSystem`, `SourceClient`, `ExportBatch`
- Records and fields: `ZEHX_C_DataClassifierMig` vs `ZEHT_I_DataClassifierCompare` on `SourceSystem`, `SourceClient`, `ExportBatch`, `ClassifierID`; compared: `Description`, `ClassifierType`, `PropertyID`

```bash
python3 tools/mig_reconcile.py counts --product ehs_mig_src --module environmental_data --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --product ehs_mig_src --module environmental_data --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- Specification records and modern EHSM objects are not interchangeable. Preserve versions, validity, regulatory jurisdiction, units, multilingual phrases and native evaluation semantics. Incident people/medical content needs restricted access; attachments and long texts use approved repository/text interfaces. Historic assessments, measurements and incidents are reference data until a supported target object is selected. Product Compliance and Dangerous Goods have separate object/release scopes; a canonical contract does not certify legal or regulatory content.
- Native export adapters and target business posting are customer implementations.
