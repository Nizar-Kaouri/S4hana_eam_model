# Migration interface: dangerous_goods

> Status: **draft-unverified** · tested release: none (draft, customer staging on NetWeaver 7.40 SP08+ assumed). Nothing below has been run on a system.

- **Read by:** Customer-selected supported business interface; stages are not posting
- **Load after:** - (first level)
- **Business key:** `SourceSystem`, `SourceClient`, `ExportBatch`, `Product`, `RegulationID`, `Version` · numbering **keep**
- **Key rule:** Origin metadata identifies the source cohort. Normalize mapped target identifiers back to source keys and retain original target IDs in a separate audit ledger.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZEHX_C_DangerousGoodsMig`

- Source: `ZEHX_I_DangerousGoods`
- Keys: `SourceSystem`, `SourceClient`, `ExportBatch`, `Product`, `RegulationID`, `Version`
- Scope: `all rows`
- Delivery mode: **regulatory-reference**
- Before posting: Approve native source completeness, business state and parent/child closure. Select one origin cohort. Customer stages do not establish business eligibility. Specification records and modern EHSM objects are not interchangeable. Preserve versions, validity, regulatory jurisdiction, units, multilingual phrases and native evaluation semantics. Incident people/medical content needs restricted access; attachments and long texts use approved repository/text interfaces. Historic assessments, measurements and incidents are reference data until a supported target object is selected. Product Compliance and Dangerous Goods have separate object/release scopes; a canonical contract does not certify legal or regulatory content.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SourceSystem` | ZEHX_EHS022-F001 | Customer native interface: SourceSystem (adapter required) | information only | yes |
| `SourceClient` | ZEHX_EHS022-F002 | Customer native interface: SourceClient (adapter required) | information only | yes |
| `ExportBatch` | ZEHX_EHS022-F003 | Customer native interface: ExportBatch (adapter required) | information only | yes |
| `Product` | ZEHX_EHS022-F004 | Customer native interface: Product (adapter required) | information only | yes |
| `RegulationID` | ZEHX_EHS022-F005 | Customer native interface: RegulationID (adapter required) | information only | yes |
| `Version` | ZEHX_EHS022-F006 | Customer native interface: Version (adapter required) | information only | yes |
| `UNNumber` | ZEHX_EHS022-F007 | Customer native interface: UNNumber (adapter required) | information only | yes |
| `ProperShippingName` | ZEHX_EHS022-F008 | Customer native interface: ProperShippingName (adapter required) | information only | yes |
| `HazardClass` | ZEHX_EHS022-F009 | Customer native interface: HazardClass (adapter required) | information only | yes |
| `PackingGroup` | ZEHX_EHS022-F010 | Customer native interface: PackingGroup (adapter required) | information only | yes |
| `ValidityStartDate` | ZEHX_EHS022-F011 | Customer native interface: ValidityStartDate (adapter required) | information only | yes |
| `ValidityEndDate` | ZEHX_EHS022-F012 | Customer native interface: ValidityEndDate (adapter required) | information only | yes |

## `ZEHX_C_DGTransportMig`

- Source: `ZEHX_I_DGTransport`
- Keys: `SourceSystem`, `SourceClient`, `ExportBatch`, `Product`, `RegulationID`, `Version`, `TransportMode`
- Scope: `all rows`
- Delivery mode: **regulatory-reference**
- Before posting: Approve native source completeness, business state and parent/child closure. Select one origin cohort. Customer stages do not establish business eligibility. Specification records and modern EHSM objects are not interchangeable. Preserve versions, validity, regulatory jurisdiction, units, multilingual phrases and native evaluation semantics. Incident people/medical content needs restricted access; attachments and long texts use approved repository/text interfaces. Historic assessments, measurements and incidents are reference data until a supported target object is selected. Product Compliance and Dangerous Goods have separate object/release scopes; a canonical contract does not certify legal or regulatory content.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SourceSystem` | ZEHX_EHS023-F001 | Customer native interface: SourceSystem (adapter required) | information only | yes |
| `SourceClient` | ZEHX_EHS023-F002 | Customer native interface: SourceClient (adapter required) | information only | yes |
| `ExportBatch` | ZEHX_EHS023-F003 | Customer native interface: ExportBatch (adapter required) | information only | yes |
| `Product` | ZEHX_EHS023-F004 | Customer native interface: Product (adapter required) | information only | yes |
| `RegulationID` | ZEHX_EHS023-F005 | Customer native interface: RegulationID (adapter required) | information only | yes |
| `Version` | ZEHX_EHS023-F006 | Customer native interface: Version (adapter required) | information only | yes |
| `TransportMode` | ZEHX_EHS023-F007 | Customer native interface: TransportMode (adapter required) | information only | yes |
| `LimitedQuantity` | ZEHX_EHS023-F008 | Customer native interface: LimitedQuantity (adapter required) | information only | yes |
| `QuantityUnit` | ZEHX_EHS023-F009 | Customer native interface: QuantityUnit (adapter required) | information only | yes |
| `ExemptionCode` | ZEHX_EHS023-F010 | Customer native interface: ExemptionCode (adapter required) | information only | yes |

## Reconciliation

- Counts: `ZEHX_C_DangerousGoodsMigCount` (ECC) vs `ZEHT_I_DangerousGoodsCount` (S/4HANA) per `SourceSystem`, `SourceClient`, `ExportBatch`
- Records and fields: `ZEHX_C_DangerousGoodsMig` vs `ZEHT_I_DangerousGoodsCompare` on `SourceSystem`, `SourceClient`, `ExportBatch`, `Product`, `RegulationID`, `Version`; compared: `UNNumber`, `ProperShippingName`, `HazardClass`, `PackingGroup`, `ValidityStartDate`, `ValidityEndDate`

```bash
python3 tools/mig_reconcile.py counts --product ehs_mig_src --module dangerous_goods --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --product ehs_mig_src --module dangerous_goods --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- Specification records and modern EHSM objects are not interchangeable. Preserve versions, validity, regulatory jurisdiction, units, multilingual phrases and native evaluation semantics. Incident people/medical content needs restricted access; attachments and long texts use approved repository/text interfaces. Historic assessments, measurements and incidents are reference data until a supported target object is selected. Product Compliance and Dangerous Goods have separate object/release scopes; a canonical contract does not certify legal or regulatory content.
- Native export adapters and target business posting are customer implementations.
