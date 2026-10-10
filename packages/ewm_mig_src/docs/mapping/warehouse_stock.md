# Migration interface: warehouse_stock

> Status: **draft-unverified** · tested release: none (draft, customer staging on NetWeaver 7.40 SP08+ assumed). Nothing below has been run on a system.

- **Read by:** Customer-selected supported business interface; stages are not posting
- **Load after:** `storage_bin`, `warehouse_product`
- **Business key:** `SourceSystem`, `SourceClient`, `ExportBatch`, `Warehouse`, `StockIdentity` · numbering **keep**
- **Key rule:** Origin metadata identifies the source cohort. Normalize mapped target identifiers back to source keys and retain original target IDs in a separate audit ledger.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZWMX_C_WarehouseStockMig`

- Source: `ZWMX_I_WarehouseStock`
- Keys: `SourceSystem`, `SourceClient`, `ExportBatch`, `Warehouse`, `StockIdentity`
- Scope: `all rows`
- Delivery mode: **balance**
- Before posting: Approve native source completeness, business state and parent/child closure. Select one origin cohort. Customer stages do not establish business eligibility. LE-WM and EWM are distinct source models. Warehouse numbers, entitled-to-dispose party, owner, stock type, batch, HU and serial identities require mapping. Freeze inventory and reconcile MM/IM and EWM without loading stock twice. Open warehouse tasks, orders and deliveries require a verified process migration; recreate or complete them through supported business operations, not table inserts. Packaging specifications and storage-type customizing must be validated independently.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SourceSystem` | ZWMX_WMS005-F001 | Customer native interface: SourceSystem (adapter required) | copy | yes |
| `SourceClient` | ZWMX_WMS005-F002 | Customer native interface: SourceClient (adapter required) | copy | yes |
| `ExportBatch` | ZWMX_WMS005-F003 | Customer native interface: ExportBatch (adapter required) | copy | yes |
| `Warehouse` | ZWMX_WMS005-F004 | Customer native interface: Warehouse (adapter required) | copy | yes |
| `StockIdentity` | ZWMX_WMS005-F005 | Customer native interface: StockIdentity (adapter required) | copy | yes |
| `Product` | ZWMX_WMS005-F006 | Customer native interface: Product (adapter required) | copy | yes |
| `StorageBin` | ZWMX_WMS005-F007 | Customer native interface: StorageBin (adapter required) | copy | yes |
| `Batch` | ZWMX_WMS005-F008 | Customer native interface: Batch (adapter required) | copy | yes |
| `Owner` | ZWMX_WMS005-F009 | Customer native interface: Owner (adapter required) | copy | yes |
| `EntitledParty` | ZWMX_WMS005-F010 | Customer native interface: EntitledParty (adapter required) | copy | yes |
| `StockType` | ZWMX_WMS005-F011 | Customer native interface: StockType (adapter required) | copy | yes |
| `SpecialStock` | ZWMX_WMS005-F012 | Customer native interface: SpecialStock (adapter required) | copy | yes |
| `ReferenceDocument` | ZWMX_WMS005-F013 | Customer native interface: ReferenceDocument (adapter required) | copy | yes |
| `ReferenceItem` | ZWMX_WMS005-F014 | Customer native interface: ReferenceItem (adapter required) | copy | yes |
| `HandlingUnit` | ZWMX_WMS005-F015 | Customer native interface: HandlingUnit (adapter required) | copy | yes |
| `Quantity` | ZWMX_WMS005-F016 | Customer native interface: Quantity (adapter required) | copy | yes |
| `QuantityUnit` | ZWMX_WMS005-F017 | Customer native interface: QuantityUnit (adapter required) | copy | yes |
| `InventoryDate` | ZWMX_WMS005-F018 | Customer native interface: InventoryDate (adapter required) | copy | yes |

## `ZWMX_C_StockSerialMig`

- Source: `ZWMX_I_StockSerial`
- Keys: `SourceSystem`, `SourceClient`, `ExportBatch`, `Warehouse`, `StockIdentity`, `SerialNumber`
- Scope: `all rows`
- Delivery mode: **balance**
- Before posting: Approve native source completeness, business state and parent/child closure. Select one origin cohort. Customer stages do not establish business eligibility. LE-WM and EWM are distinct source models. Warehouse numbers, entitled-to-dispose party, owner, stock type, batch, HU and serial identities require mapping. Freeze inventory and reconcile MM/IM and EWM without loading stock twice. Open warehouse tasks, orders and deliveries require a verified process migration; recreate or complete them through supported business operations, not table inserts. Packaging specifications and storage-type customizing must be validated independently.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SourceSystem` | ZWMX_WMS006-F001 | Customer native interface: SourceSystem (adapter required) | copy | yes |
| `SourceClient` | ZWMX_WMS006-F002 | Customer native interface: SourceClient (adapter required) | copy | yes |
| `ExportBatch` | ZWMX_WMS006-F003 | Customer native interface: ExportBatch (adapter required) | copy | yes |
| `Warehouse` | ZWMX_WMS006-F004 | Customer native interface: Warehouse (adapter required) | copy | yes |
| `StockIdentity` | ZWMX_WMS006-F005 | Customer native interface: StockIdentity (adapter required) | copy | yes |
| `SerialNumber` | ZWMX_WMS006-F006 | Customer native interface: SerialNumber (adapter required) | copy | yes |
| `Product` | ZWMX_WMS006-F007 | Customer native interface: Product (adapter required) | copy | yes |
| `HandlingUnit` | ZWMX_WMS006-F008 | Customer native interface: HandlingUnit (adapter required) | copy | yes |

## Reconciliation

- Counts: `ZWMX_C_WarehouseStockMigCount` (ECC) vs `ZWMT_I_WarehouseStockCount` (S/4HANA) per `SourceSystem`, `SourceClient`, `ExportBatch`
- Records and fields: `ZWMX_C_WarehouseStockMig` vs `ZWMT_I_WarehouseStockCompare` on `SourceSystem`, `SourceClient`, `ExportBatch`, `Warehouse`, `StockIdentity`; compared: `Product`, `StorageBin`, `Batch`, `Owner`, `EntitledParty`, `StockType`, `SpecialStock`, `ReferenceDocument`, `ReferenceItem`, `HandlingUnit`, `Quantity`, `QuantityUnit`, `InventoryDate`

```bash
python3 tools/mig_reconcile.py counts --product ewm_mig_src --module warehouse_stock --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --product ewm_mig_src --module warehouse_stock --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- LE-WM and EWM are distinct source models. Warehouse numbers, entitled-to-dispose party, owner, stock type, batch, HU and serial identities require mapping. Freeze inventory and reconcile MM/IM and EWM without loading stock twice. Open warehouse tasks, orders and deliveries require a verified process migration; recreate or complete them through supported business operations, not table inserts. Packaging specifications and storage-type customizing must be validated independently.
- Native export adapters and target business posting are customer implementations.
