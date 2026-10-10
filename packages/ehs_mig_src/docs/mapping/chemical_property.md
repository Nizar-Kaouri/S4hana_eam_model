# Migration interface: chemical_property

> Status: **draft-unverified** · tested release: none (draft, customer staging on NetWeaver 7.40 SP08+ assumed). Nothing below has been run on a system.

- **Read by:** Customer-selected supported business interface; stages are not posting
- **Load after:** - (first level)
- **Business key:** `SourceSystem`, `SourceClient`, `ExportBatch`, `PropertyID` · numbering **keep**
- **Key rule:** Origin metadata identifies the source cohort. Normalize mapped target identifiers back to source keys and retain original target IDs in a separate audit ledger.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZEHX_C_ChemicalPropMig`

- Source: `ZEHX_I_ChemicalProp`
- Keys: `SourceSystem`, `SourceClient`, `ExportBatch`, `PropertyID`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Approve native source completeness, business state and parent/child closure. Select one origin cohort. Customer stages do not establish business eligibility. Specification records and modern EHSM objects are not interchangeable. Preserve versions, validity, regulatory jurisdiction, units, multilingual phrases and native evaluation semantics. Incident people/medical content needs restricted access; attachments and long texts use approved repository/text interfaces. Historic assessments, measurements and incidents are reference data until a supported target object is selected. Product Compliance and Dangerous Goods have separate object/release scopes; a canonical contract does not certify legal or regulatory content.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SourceSystem` | ZEHX_EHS003-F001 | Customer native interface: SourceSystem (adapter required) | copy | yes |
| `SourceClient` | ZEHX_EHS003-F002 | Customer native interface: SourceClient (adapter required) | copy | yes |
| `ExportBatch` | ZEHX_EHS003-F003 | Customer native interface: ExportBatch (adapter required) | copy | yes |
| `PropertyID` | ZEHX_EHS003-F004 | Customer native interface: PropertyID (adapter required) | copy | yes |
| `Description` | ZEHX_EHS003-F005 | Customer native interface: Description (adapter required) | copy | yes |
| `PropertyType` | ZEHX_EHS003-F006 | Customer native interface: PropertyType (adapter required) | copy | yes |
| `DefaultUnit` | ZEHX_EHS003-F007 | Customer native interface: DefaultUnit (adapter required) | copy | yes |
| `Dimension` | ZEHX_EHS003-F008 | Customer native interface: Dimension (adapter required) | copy | yes |

## `ZEHX_C_PropertyUnitMig`

- Source: `ZEHX_I_PropertyUnit`
- Keys: `SourceSystem`, `SourceClient`, `ExportBatch`, `PropertyID`, `UnitID`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Approve native source completeness, business state and parent/child closure. Select one origin cohort. Customer stages do not establish business eligibility. Specification records and modern EHSM objects are not interchangeable. Preserve versions, validity, regulatory jurisdiction, units, multilingual phrases and native evaluation semantics. Incident people/medical content needs restricted access; attachments and long texts use approved repository/text interfaces. Historic assessments, measurements and incidents are reference data until a supported target object is selected. Product Compliance and Dangerous Goods have separate object/release scopes; a canonical contract does not certify legal or regulatory content.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SourceSystem` | ZEHX_EHS004-F001 | Customer native interface: SourceSystem (adapter required) | copy | yes |
| `SourceClient` | ZEHX_EHS004-F002 | Customer native interface: SourceClient (adapter required) | copy | yes |
| `ExportBatch` | ZEHX_EHS004-F003 | Customer native interface: ExportBatch (adapter required) | copy | yes |
| `PropertyID` | ZEHX_EHS004-F004 | Customer native interface: PropertyID (adapter required) | copy | yes |
| `UnitID` | ZEHX_EHS004-F005 | Customer native interface: UnitID (adapter required) | copy | yes |
| `ConversionNumerator` | ZEHX_EHS004-F006 | Customer native interface: ConversionNumerator (adapter required) | copy | yes |
| `ConversionDenominator` | ZEHX_EHS004-F007 | Customer native interface: ConversionDenominator (adapter required) | copy | yes |

## Reconciliation

- Counts: `ZEHX_C_ChemicalPropMigCount` (ECC) vs `ZEHT_I_ChemicalPropCount` (S/4HANA) per `SourceSystem`, `SourceClient`, `ExportBatch`
- Records and fields: `ZEHX_C_ChemicalPropMig` vs `ZEHT_I_ChemicalPropCompare` on `SourceSystem`, `SourceClient`, `ExportBatch`, `PropertyID`; compared: `Description`, `PropertyType`, `DefaultUnit`, `Dimension`

```bash
python3 tools/mig_reconcile.py counts --product ehs_mig_src --module chemical_property --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --product ehs_mig_src --module chemical_property --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- Specification records and modern EHSM objects are not interchangeable. Preserve versions, validity, regulatory jurisdiction, units, multilingual phrases and native evaluation semantics. Incident people/medical content needs restricted access; attachments and long texts use approved repository/text interfaces. Historic assessments, measurements and incidents are reference data until a supported target object is selected. Product Compliance and Dangerous Goods have separate object/release scopes; a canonical contract does not certify legal or regulatory content.
- Native export adapters and target business posting are customer implementations.
