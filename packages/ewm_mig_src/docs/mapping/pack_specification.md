# Migration interface: pack_specification

> Status: **draft-unverified** · tested release: none (draft, customer staging on NetWeaver 7.40 SP08+ assumed). Nothing below has been run on a system.

- **Read by:** Customer-selected supported business interface; stages are not posting
- **Load after:** - (first level)
- **Business key:** `SourceSystem`, `SourceClient`, `ExportBatch`, `PackSpecification`, `Version` · numbering **keep**
- **Key rule:** Origin metadata identifies the source cohort. Normalize mapped target identifiers back to source keys and retain original target IDs in a separate audit ledger.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZWMX_C_PackSpecMig`

- Source: `ZWMX_I_PackSpec`
- Keys: `SourceSystem`, `SourceClient`, `ExportBatch`, `PackSpecification`, `Version`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Approve native source completeness, business state and parent/child closure. Select one origin cohort. Customer stages do not establish business eligibility. LE-WM and EWM are distinct source models. Warehouse numbers, entitled-to-dispose party, owner, stock type, batch, HU and serial identities require mapping. Freeze inventory and reconcile MM/IM and EWM without loading stock twice. Open warehouse tasks, orders and deliveries require a verified process migration; recreate or complete them through supported business operations, not table inserts. Packaging specifications and storage-type customizing must be validated independently.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SourceSystem` | ZWMX_WMS014-F001 | Customer native interface: SourceSystem (adapter required) | copy | yes |
| `SourceClient` | ZWMX_WMS014-F002 | Customer native interface: SourceClient (adapter required) | copy | yes |
| `ExportBatch` | ZWMX_WMS014-F003 | Customer native interface: ExportBatch (adapter required) | copy | yes |
| `PackSpecification` | ZWMX_WMS014-F004 | Customer native interface: PackSpecification (adapter required) | copy | yes |
| `Version` | ZWMX_WMS014-F005 | Customer native interface: Version (adapter required) | copy | yes |
| `Description` | ZWMX_WMS014-F006 | Customer native interface: Description (adapter required) | copy | yes |
| `ValidityStartDate` | ZWMX_WMS014-F007 | Customer native interface: ValidityStartDate (adapter required) | copy | yes |
| `ValidityEndDate` | ZWMX_WMS014-F008 | Customer native interface: ValidityEndDate (adapter required) | copy | yes |
| `ReleaseStatus` | ZWMX_WMS014-F009 | Customer native interface: ReleaseStatus (adapter required) | copy | yes |

## `ZWMX_C_PackLevelMig`

- Source: `ZWMX_I_PackLevel`
- Keys: `SourceSystem`, `SourceClient`, `ExportBatch`, `PackSpecification`, `Version`, `LevelID`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Approve native source completeness, business state and parent/child closure. Select one origin cohort. Customer stages do not establish business eligibility. LE-WM and EWM are distinct source models. Warehouse numbers, entitled-to-dispose party, owner, stock type, batch, HU and serial identities require mapping. Freeze inventory and reconcile MM/IM and EWM without loading stock twice. Open warehouse tasks, orders and deliveries require a verified process migration; recreate or complete them through supported business operations, not table inserts. Packaging specifications and storage-type customizing must be validated independently.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SourceSystem` | ZWMX_WMS015-F001 | Customer native interface: SourceSystem (adapter required) | copy | yes |
| `SourceClient` | ZWMX_WMS015-F002 | Customer native interface: SourceClient (adapter required) | copy | yes |
| `ExportBatch` | ZWMX_WMS015-F003 | Customer native interface: ExportBatch (adapter required) | copy | yes |
| `PackSpecification` | ZWMX_WMS015-F004 | Customer native interface: PackSpecification (adapter required) | copy | yes |
| `Version` | ZWMX_WMS015-F005 | Customer native interface: Version (adapter required) | copy | yes |
| `LevelID` | ZWMX_WMS015-F006 | Customer native interface: LevelID (adapter required) | copy | yes |
| `ParentLevel` | ZWMX_WMS015-F007 | Customer native interface: ParentLevel (adapter required) | copy | yes |
| `PackagingProduct` | ZWMX_WMS015-F008 | Customer native interface: PackagingProduct (adapter required) | copy | yes |
| `TargetQuantity` | ZWMX_WMS015-F009 | Customer native interface: TargetQuantity (adapter required) | copy | yes |
| `QuantityUnit` | ZWMX_WMS015-F010 | Customer native interface: QuantityUnit (adapter required) | copy | yes |

## `ZWMX_C_PackElementMig`

- Source: `ZWMX_I_PackElement`
- Keys: `SourceSystem`, `SourceClient`, `ExportBatch`, `PackSpecification`, `Version`, `LevelID`, `ElementID`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Approve native source completeness, business state and parent/child closure. Select one origin cohort. Customer stages do not establish business eligibility. LE-WM and EWM are distinct source models. Warehouse numbers, entitled-to-dispose party, owner, stock type, batch, HU and serial identities require mapping. Freeze inventory and reconcile MM/IM and EWM without loading stock twice. Open warehouse tasks, orders and deliveries require a verified process migration; recreate or complete them through supported business operations, not table inserts. Packaging specifications and storage-type customizing must be validated independently.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SourceSystem` | ZWMX_WMS016-F001 | Customer native interface: SourceSystem (adapter required) | copy | yes |
| `SourceClient` | ZWMX_WMS016-F002 | Customer native interface: SourceClient (adapter required) | copy | yes |
| `ExportBatch` | ZWMX_WMS016-F003 | Customer native interface: ExportBatch (adapter required) | copy | yes |
| `PackSpecification` | ZWMX_WMS016-F004 | Customer native interface: PackSpecification (adapter required) | copy | yes |
| `Version` | ZWMX_WMS016-F005 | Customer native interface: Version (adapter required) | copy | yes |
| `LevelID` | ZWMX_WMS016-F006 | Customer native interface: LevelID (adapter required) | copy | yes |
| `ElementID` | ZWMX_WMS016-F007 | Customer native interface: ElementID (adapter required) | copy | yes |
| `Product` | ZWMX_WMS016-F008 | Customer native interface: Product (adapter required) | copy | yes |
| `Quantity` | ZWMX_WMS016-F009 | Customer native interface: Quantity (adapter required) | copy | yes |
| `QuantityUnit` | ZWMX_WMS016-F010 | Customer native interface: QuantityUnit (adapter required) | copy | yes |
| `ElementType` | ZWMX_WMS016-F011 | Customer native interface: ElementType (adapter required) | copy | yes |

## Reconciliation

- Counts: `ZWMX_C_PackSpecMigCount` (ECC) vs `ZWMT_I_PackSpecCount` (S/4HANA) per `SourceSystem`, `SourceClient`, `ExportBatch`
- Records and fields: `ZWMX_C_PackSpecMig` vs `ZWMT_I_PackSpecCompare` on `SourceSystem`, `SourceClient`, `ExportBatch`, `PackSpecification`, `Version`; compared: `Description`, `ValidityStartDate`, `ValidityEndDate`, `ReleaseStatus`

```bash
python3 tools/mig_reconcile.py counts --product ewm_mig_src --module pack_specification --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --product ewm_mig_src --module pack_specification --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- LE-WM and EWM are distinct source models. Warehouse numbers, entitled-to-dispose party, owner, stock type, batch, HU and serial identities require mapping. Freeze inventory and reconcile MM/IM and EWM without loading stock twice. Open warehouse tasks, orders and deliveries require a verified process migration; recreate or complete them through supported business operations, not table inserts. Packaging specifications and storage-type customizing must be validated independently.
- Native export adapters and target business posting are customer implementations.
