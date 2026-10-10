# Migration interface: warehouse_product

> Status: **draft-unverified** · tested release: none (draft, customer staging on NetWeaver 7.40 SP08+ assumed). Nothing below has been run on a system.

- **Read by:** Customer-selected supported business interface; stages are not posting
- **Load after:** `storage_bin`
- **Business key:** `SourceSystem`, `SourceClient`, `ExportBatch`, `Warehouse`, `Product`, `EntitledParty` · numbering **keep**
- **Key rule:** Origin metadata identifies the source cohort. Normalize mapped target identifiers back to source keys and retain original target IDs in a separate audit ledger.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZWMX_C_WarehouseProdMig`

- Source: `ZWMX_I_WarehouseProd`
- Keys: `SourceSystem`, `SourceClient`, `ExportBatch`, `Warehouse`, `Product`, `EntitledParty`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Approve native source completeness, business state and parent/child closure. Select one origin cohort. Customer stages do not establish business eligibility. LE-WM and EWM are distinct source models. Warehouse numbers, entitled-to-dispose party, owner, stock type, batch, HU and serial identities require mapping. Freeze inventory and reconcile MM/IM and EWM without loading stock twice. Open warehouse tasks, orders and deliveries require a verified process migration; recreate or complete them through supported business operations, not table inserts. Packaging specifications and storage-type customizing must be validated independently.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SourceSystem` | ZWMX_WMS003-F001 | Customer native interface: SourceSystem (adapter required) | copy | yes |
| `SourceClient` | ZWMX_WMS003-F002 | Customer native interface: SourceClient (adapter required) | copy | yes |
| `ExportBatch` | ZWMX_WMS003-F003 | Customer native interface: ExportBatch (adapter required) | copy | yes |
| `Warehouse` | ZWMX_WMS003-F004 | Customer native interface: Warehouse (adapter required) | copy | yes |
| `Product` | ZWMX_WMS003-F005 | Customer native interface: Product (adapter required) | copy | yes |
| `EntitledParty` | ZWMX_WMS003-F006 | Customer native interface: EntitledParty (adapter required) | copy | yes |
| `WarehouseUoM` | ZWMX_WMS003-F007 | Customer native interface: WarehouseUoM (adapter required) | copy | yes |
| `PutawayControl` | ZWMX_WMS003-F008 | Customer native interface: PutawayControl (adapter required) | copy | yes |
| `RemovalControl` | ZWMX_WMS003-F009 | Customer native interface: RemovalControl (adapter required) | copy | yes |
| `CycleCountIndicator` | ZWMX_WMS003-F010 | Customer native interface: CycleCountIndicator (adapter required) | copy | yes |

## `ZWMX_C_FixedBinMig`

- Source: `ZWMX_I_FixedBin`
- Keys: `SourceSystem`, `SourceClient`, `ExportBatch`, `Warehouse`, `Product`, `EntitledParty`, `StorageType`, `StorageBin`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Approve native source completeness, business state and parent/child closure. Select one origin cohort. Customer stages do not establish business eligibility. LE-WM and EWM are distinct source models. Warehouse numbers, entitled-to-dispose party, owner, stock type, batch, HU and serial identities require mapping. Freeze inventory and reconcile MM/IM and EWM without loading stock twice. Open warehouse tasks, orders and deliveries require a verified process migration; recreate or complete them through supported business operations, not table inserts. Packaging specifications and storage-type customizing must be validated independently.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SourceSystem` | ZWMX_WMS004-F001 | Customer native interface: SourceSystem (adapter required) | copy | yes |
| `SourceClient` | ZWMX_WMS004-F002 | Customer native interface: SourceClient (adapter required) | copy | yes |
| `ExportBatch` | ZWMX_WMS004-F003 | Customer native interface: ExportBatch (adapter required) | copy | yes |
| `Warehouse` | ZWMX_WMS004-F004 | Customer native interface: Warehouse (adapter required) | copy | yes |
| `Product` | ZWMX_WMS004-F005 | Customer native interface: Product (adapter required) | copy | yes |
| `EntitledParty` | ZWMX_WMS004-F006 | Customer native interface: EntitledParty (adapter required) | copy | yes |
| `StorageType` | ZWMX_WMS004-F007 | Customer native interface: StorageType (adapter required) | copy | yes |
| `StorageBin` | ZWMX_WMS004-F008 | Customer native interface: StorageBin (adapter required) | copy | yes |
| `MinimumQuantity` | ZWMX_WMS004-F009 | Customer native interface: MinimumQuantity (adapter required) | copy | yes |
| `MaximumQuantity` | ZWMX_WMS004-F010 | Customer native interface: MaximumQuantity (adapter required) | copy | yes |
| `QuantityUnit` | ZWMX_WMS004-F011 | Customer native interface: QuantityUnit (adapter required) | copy | yes |

## Reconciliation

- Counts: `ZWMX_C_WarehouseProdMigCount` (ECC) vs `ZWMT_I_WarehouseProdCount` (S/4HANA) per `SourceSystem`, `SourceClient`, `ExportBatch`
- Records and fields: `ZWMX_C_WarehouseProdMig` vs `ZWMT_I_WarehouseProdCompare` on `SourceSystem`, `SourceClient`, `ExportBatch`, `Warehouse`, `Product`, `EntitledParty`; compared: `WarehouseUoM`, `PutawayControl`, `RemovalControl`, `CycleCountIndicator`

```bash
python3 tools/mig_reconcile.py counts --product ewm_mig_src --module warehouse_product --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --product ewm_mig_src --module warehouse_product --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- LE-WM and EWM are distinct source models. Warehouse numbers, entitled-to-dispose party, owner, stock type, batch, HU and serial identities require mapping. Freeze inventory and reconcile MM/IM and EWM without loading stock twice. Open warehouse tasks, orders and deliveries require a verified process migration; recreate or complete them through supported business operations, not table inserts. Packaging specifications and storage-type customizing must be validated independently.
- Native export adapters and target business posting are customer implementations.
