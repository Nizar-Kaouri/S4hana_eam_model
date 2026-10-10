# Migration interface: handling_unit

> Status: **draft-unverified** · tested release: none (draft, customer staging on NetWeaver 7.40 SP08+ assumed). Nothing below has been run on a system.

- **Read by:** Customer-selected supported business interface; stages are not posting
- **Load after:** `storage_bin`, `warehouse_product`
- **Business key:** `SourceSystem`, `SourceClient`, `ExportBatch`, `Warehouse`, `HandlingUnit` · numbering **keep**
- **Key rule:** Origin metadata identifies the source cohort. Normalize mapped target identifiers back to source keys and retain original target IDs in a separate audit ledger.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZWMX_C_HandlingUnitMig`

- Source: `ZWMX_I_HandlingUnit`
- Keys: `SourceSystem`, `SourceClient`, `ExportBatch`, `Warehouse`, `HandlingUnit`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: Approve native source completeness, business state and parent/child closure. Select one origin cohort. Customer stages do not establish business eligibility. LE-WM and EWM are distinct source models. Warehouse numbers, entitled-to-dispose party, owner, stock type, batch, HU and serial identities require mapping. Freeze inventory and reconcile MM/IM and EWM without loading stock twice. Open warehouse tasks, orders and deliveries require a verified process migration; recreate or complete them through supported business operations, not table inserts. Packaging specifications and storage-type customizing must be validated independently.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SourceSystem` | ZWMX_WMS007-F001 | Customer native interface: SourceSystem (adapter required) | information only | yes |
| `SourceClient` | ZWMX_WMS007-F002 | Customer native interface: SourceClient (adapter required) | information only | yes |
| `ExportBatch` | ZWMX_WMS007-F003 | Customer native interface: ExportBatch (adapter required) | information only | yes |
| `Warehouse` | ZWMX_WMS007-F004 | Customer native interface: Warehouse (adapter required) | information only | yes |
| `HandlingUnit` | ZWMX_WMS007-F005 | Customer native interface: HandlingUnit (adapter required) | information only | yes |
| `ExternalHU` | ZWMX_WMS007-F006 | Customer native interface: ExternalHU (adapter required) | information only | yes |
| `ParentHU` | ZWMX_WMS007-F007 | Customer native interface: ParentHU (adapter required) | information only | yes |
| `PackagingProduct` | ZWMX_WMS007-F008 | Customer native interface: PackagingProduct (adapter required) | information only | yes |
| `GrossWeight` | ZWMX_WMS007-F009 | Customer native interface: GrossWeight (adapter required) | information only | yes |
| `NetWeight` | ZWMX_WMS007-F010 | Customer native interface: NetWeight (adapter required) | information only | yes |
| `WeightUnit` | ZWMX_WMS007-F011 | Customer native interface: WeightUnit (adapter required) | information only | yes |
| `StorageBin` | ZWMX_WMS007-F012 | Customer native interface: StorageBin (adapter required) | information only | yes |
| `HUStatus` | ZWMX_WMS007-F013 | Customer native interface: HUStatus (adapter required) | information only | yes |

## `ZWMX_C_HUContentMig`

- Source: `ZWMX_I_HUContent`
- Keys: `SourceSystem`, `SourceClient`, `ExportBatch`, `Warehouse`, `HandlingUnit`, `ContentItem`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: Approve native source completeness, business state and parent/child closure. Select one origin cohort. Customer stages do not establish business eligibility. LE-WM and EWM are distinct source models. Warehouse numbers, entitled-to-dispose party, owner, stock type, batch, HU and serial identities require mapping. Freeze inventory and reconcile MM/IM and EWM without loading stock twice. Open warehouse tasks, orders and deliveries require a verified process migration; recreate or complete them through supported business operations, not table inserts. Packaging specifications and storage-type customizing must be validated independently.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SourceSystem` | ZWMX_WMS008-F001 | Customer native interface: SourceSystem (adapter required) | information only | yes |
| `SourceClient` | ZWMX_WMS008-F002 | Customer native interface: SourceClient (adapter required) | information only | yes |
| `ExportBatch` | ZWMX_WMS008-F003 | Customer native interface: ExportBatch (adapter required) | information only | yes |
| `Warehouse` | ZWMX_WMS008-F004 | Customer native interface: Warehouse (adapter required) | information only | yes |
| `HandlingUnit` | ZWMX_WMS008-F005 | Customer native interface: HandlingUnit (adapter required) | information only | yes |
| `ContentItem` | ZWMX_WMS008-F006 | Customer native interface: ContentItem (adapter required) | information only | yes |
| `Product` | ZWMX_WMS008-F007 | Customer native interface: Product (adapter required) | information only | yes |
| `Batch` | ZWMX_WMS008-F008 | Customer native interface: Batch (adapter required) | information only | yes |
| `StockIdentity` | ZWMX_WMS008-F009 | Customer native interface: StockIdentity (adapter required) | information only | yes |
| `Quantity` | ZWMX_WMS008-F010 | Customer native interface: Quantity (adapter required) | information only | yes |
| `QuantityUnit` | ZWMX_WMS008-F011 | Customer native interface: QuantityUnit (adapter required) | information only | yes |
| `Owner` | ZWMX_WMS008-F012 | Customer native interface: Owner (adapter required) | information only | yes |
| `EntitledParty` | ZWMX_WMS008-F013 | Customer native interface: EntitledParty (adapter required) | information only | yes |

## Reconciliation

- Counts: `ZWMX_C_HandlingUnitMigCount` (ECC) vs `ZWMT_I_HandlingUnitCount` (S/4HANA) per `SourceSystem`, `SourceClient`, `ExportBatch`
- Records and fields: `ZWMX_C_HandlingUnitMig` vs `ZWMT_I_HandlingUnitCompare` on `SourceSystem`, `SourceClient`, `ExportBatch`, `Warehouse`, `HandlingUnit`; compared: `ExternalHU`, `ParentHU`, `PackagingProduct`, `GrossWeight`, `NetWeight`, `WeightUnit`, `StorageBin`, `HUStatus`

```bash
python3 tools/mig_reconcile.py counts --product ewm_mig_src --module handling_unit --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --product ewm_mig_src --module handling_unit --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- LE-WM and EWM are distinct source models. Warehouse numbers, entitled-to-dispose party, owner, stock type, batch, HU and serial identities require mapping. Freeze inventory and reconcile MM/IM and EWM without loading stock twice. Open warehouse tasks, orders and deliveries require a verified process migration; recreate or complete them through supported business operations, not table inserts. Packaging specifications and storage-type customizing must be validated independently.
- Native export adapters and target business posting are customer implementations.
