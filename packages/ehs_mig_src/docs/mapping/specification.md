# Migration interface: specification

> Status: **draft-unverified** · tested release: none (draft, customer staging on NetWeaver 7.40 SP08+ assumed). Nothing below has been run on a system.

- **Read by:** Customer-selected supported business interface; stages are not posting
- **Load after:** `chemical_property`
- **Business key:** `SourceSystem`, `SourceClient`, `ExportBatch`, `SpecificationID`, `Version` · numbering **keep**
- **Key rule:** Origin metadata identifies the source cohort. Normalize mapped target identifiers back to source keys and retain original target IDs in a separate audit ledger.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZEHX_C_SpecificationMig`

- Source: `ZEHX_I_Specification`
- Keys: `SourceSystem`, `SourceClient`, `ExportBatch`, `SpecificationID`, `Version`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Approve native source completeness, business state and parent/child closure. Select one origin cohort. Customer stages do not establish business eligibility. Specification records and modern EHSM objects are not interchangeable. Preserve versions, validity, regulatory jurisdiction, units, multilingual phrases and native evaluation semantics. Incident people/medical content needs restricted access; attachments and long texts use approved repository/text interfaces. Historic assessments, measurements and incidents are reference data until a supported target object is selected. Product Compliance and Dangerous Goods have separate object/release scopes; a canonical contract does not certify legal or regulatory content.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SourceSystem` | ZEHX_EHS005-F001 | Customer native interface: SourceSystem (adapter required) | copy | yes |
| `SourceClient` | ZEHX_EHS005-F002 | Customer native interface: SourceClient (adapter required) | copy | yes |
| `ExportBatch` | ZEHX_EHS005-F003 | Customer native interface: ExportBatch (adapter required) | copy | yes |
| `SpecificationID` | ZEHX_EHS005-F004 | Customer native interface: SpecificationID (adapter required) | copy | yes |
| `Version` | ZEHX_EHS005-F005 | Customer native interface: Version (adapter required) | copy | yes |
| `SpecificationType` | ZEHX_EHS005-F006 | Customer native interface: SpecificationType (adapter required) | copy | yes |
| `Description` | ZEHX_EHS005-F007 | Customer native interface: Description (adapter required) | copy | yes |
| `AuthorizationGroup` | ZEHX_EHS005-F008 | Customer native interface: AuthorizationGroup (adapter required) | copy | yes |
| `ValidityStartDate` | ZEHX_EHS005-F009 | Customer native interface: ValidityStartDate (adapter required) | copy | yes |
| `ValidityEndDate` | ZEHX_EHS005-F010 | Customer native interface: ValidityEndDate (adapter required) | copy | yes |

## `ZEHX_C_SpecIdentifierMig`

- Source: `ZEHX_I_SpecIdentifier`
- Keys: `SourceSystem`, `SourceClient`, `ExportBatch`, `SpecificationID`, `Version`, `IdentifierID`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Approve native source completeness, business state and parent/child closure. Select one origin cohort. Customer stages do not establish business eligibility. Specification records and modern EHSM objects are not interchangeable. Preserve versions, validity, regulatory jurisdiction, units, multilingual phrases and native evaluation semantics. Incident people/medical content needs restricted access; attachments and long texts use approved repository/text interfaces. Historic assessments, measurements and incidents are reference data until a supported target object is selected. Product Compliance and Dangerous Goods have separate object/release scopes; a canonical contract does not certify legal or regulatory content.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SourceSystem` | ZEHX_EHS006-F001 | Customer native interface: SourceSystem (adapter required) | copy | yes |
| `SourceClient` | ZEHX_EHS006-F002 | Customer native interface: SourceClient (adapter required) | copy | yes |
| `ExportBatch` | ZEHX_EHS006-F003 | Customer native interface: ExportBatch (adapter required) | copy | yes |
| `SpecificationID` | ZEHX_EHS006-F004 | Customer native interface: SpecificationID (adapter required) | copy | yes |
| `Version` | ZEHX_EHS006-F005 | Customer native interface: Version (adapter required) | copy | yes |
| `IdentifierID` | ZEHX_EHS006-F006 | Customer native interface: IdentifierID (adapter required) | copy | yes |
| `IdentifierType` | ZEHX_EHS006-F007 | Customer native interface: IdentifierType (adapter required) | copy | yes |
| `IdentifierCategory` | ZEHX_EHS006-F008 | Customer native interface: IdentifierCategory (adapter required) | copy | yes |
| `IdentifierValue` | ZEHX_EHS006-F009 | Customer native interface: IdentifierValue (adapter required) | copy | yes |
| `Language` | ZEHX_EHS006-F010 | Customer native interface: Language (adapter required) | copy | yes |

## `ZEHX_C_SpecPropertyMig`

- Source: `ZEHX_I_SpecProperty`
- Keys: `SourceSystem`, `SourceClient`, `ExportBatch`, `SpecificationID`, `Version`, `PropertyID`, `ValueID`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Approve native source completeness, business state and parent/child closure. Select one origin cohort. Customer stages do not establish business eligibility. Specification records and modern EHSM objects are not interchangeable. Preserve versions, validity, regulatory jurisdiction, units, multilingual phrases and native evaluation semantics. Incident people/medical content needs restricted access; attachments and long texts use approved repository/text interfaces. Historic assessments, measurements and incidents are reference data until a supported target object is selected. Product Compliance and Dangerous Goods have separate object/release scopes; a canonical contract does not certify legal or regulatory content.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SourceSystem` | ZEHX_EHS007-F001 | Customer native interface: SourceSystem (adapter required) | copy | yes |
| `SourceClient` | ZEHX_EHS007-F002 | Customer native interface: SourceClient (adapter required) | copy | yes |
| `ExportBatch` | ZEHX_EHS007-F003 | Customer native interface: ExportBatch (adapter required) | copy | yes |
| `SpecificationID` | ZEHX_EHS007-F004 | Customer native interface: SpecificationID (adapter required) | copy | yes |
| `Version` | ZEHX_EHS007-F005 | Customer native interface: Version (adapter required) | copy | yes |
| `PropertyID` | ZEHX_EHS007-F006 | Customer native interface: PropertyID (adapter required) | copy | yes |
| `ValueID` | ZEHX_EHS007-F007 | Customer native interface: ValueID (adapter required) | copy | yes |
| `ValueText` | ZEHX_EHS007-F008 | Customer native interface: ValueText (adapter required) | copy | yes |
| `ValueLow` | ZEHX_EHS007-F009 | Customer native interface: ValueLow (adapter required) | copy | yes |
| `ValueHigh` | ZEHX_EHS007-F010 | Customer native interface: ValueHigh (adapter required) | copy | yes |
| `QuantityUnit` | ZEHX_EHS007-F011 | Customer native interface: QuantityUnit (adapter required) | copy | yes |
| `UsageRating` | ZEHX_EHS007-F012 | Customer native interface: UsageRating (adapter required) | copy | yes |
| `RegulatoryArea` | ZEHX_EHS007-F013 | Customer native interface: RegulatoryArea (adapter required) | copy | yes |
| `ValidityStartDate` | ZEHX_EHS007-F014 | Customer native interface: ValidityStartDate (adapter required) | copy | yes |
| `ValidityEndDate` | ZEHX_EHS007-F015 | Customer native interface: ValidityEndDate (adapter required) | copy | yes |

## Reconciliation

- Counts: `ZEHX_C_SpecificationMigCount` (ECC) vs `ZEHT_I_SpecificationCount` (S/4HANA) per `SourceSystem`, `SourceClient`, `ExportBatch`
- Records and fields: `ZEHX_C_SpecificationMig` vs `ZEHT_I_SpecificationCompare` on `SourceSystem`, `SourceClient`, `ExportBatch`, `SpecificationID`, `Version`; compared: `SpecificationType`, `Description`, `AuthorizationGroup`, `ValidityStartDate`, `ValidityEndDate`

```bash
python3 tools/mig_reconcile.py counts --product ehs_mig_src --module specification --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --product ehs_mig_src --module specification --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- Specification records and modern EHSM objects are not interchangeable. Preserve versions, validity, regulatory jurisdiction, units, multilingual phrases and native evaluation semantics. Incident people/medical content needs restricted access; attachments and long texts use approved repository/text interfaces. Historic assessments, measurements and incidents are reference data until a supported target object is selected. Product Compliance and Dangerous Goods have separate object/release scopes; a canonical contract does not certify legal or regulatory content.
- Native export adapters and target business posting are customer implementations.
