# Migration interface: warehouse_task

> Status: **draft-unverified** · tested release: none (draft, customer staging on NetWeaver 7.40 SP08+ assumed). Nothing below has been run on a system.

- **Read by:** Customer-selected supported business interface; stages are not posting
- **Load after:** `storage_bin`, `warehouse_product`
- **Business key:** `SourceSystem`, `SourceClient`, `ExportBatch`, `Warehouse`, `WarehouseTask` · numbering **keep**
- **Key rule:** Origin metadata identifies the source cohort. Normalize mapped target identifiers back to source keys and retain original target IDs in a separate audit ledger.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZWMX_C_WarehouseTaskMig`

- Source: `ZWMX_I_WarehouseTask`
- Keys: `SourceSystem`, `SourceClient`, `ExportBatch`, `Warehouse`, `WarehouseTask`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: Approve native source completeness, business state and parent/child closure. Select one origin cohort. Customer stages do not establish business eligibility. LE-WM and EWM are distinct source models. Warehouse numbers, entitled-to-dispose party, owner, stock type, batch, HU and serial identities require mapping. Freeze inventory and reconcile MM/IM and EWM without loading stock twice. Open warehouse tasks, orders and deliveries require a verified process migration; recreate or complete them through supported business operations, not table inserts. Packaging specifications and storage-type customizing must be validated independently.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SourceSystem` | ZWMX_WMS009-F001 | Customer native interface: SourceSystem (adapter required) | information only | yes |
| `SourceClient` | ZWMX_WMS009-F002 | Customer native interface: SourceClient (adapter required) | information only | yes |
| `ExportBatch` | ZWMX_WMS009-F003 | Customer native interface: ExportBatch (adapter required) | information only | yes |
| `Warehouse` | ZWMX_WMS009-F004 | Customer native interface: Warehouse (adapter required) | information only | yes |
| `WarehouseTask` | ZWMX_WMS009-F005 | Customer native interface: WarehouseTask (adapter required) | information only | yes |
| `WarehouseOrder` | ZWMX_WMS009-F006 | Customer native interface: WarehouseOrder (adapter required) | information only | yes |
| `Product` | ZWMX_WMS009-F007 | Customer native interface: Product (adapter required) | information only | yes |
| `SourceBin` | ZWMX_WMS009-F008 | Customer native interface: SourceBin (adapter required) | information only | yes |
| `DestinationBin` | ZWMX_WMS009-F009 | Customer native interface: DestinationBin (adapter required) | information only | yes |
| `HandlingUnit` | ZWMX_WMS009-F010 | Customer native interface: HandlingUnit (adapter required) | information only | yes |
| `PlannedQuantity` | ZWMX_WMS009-F011 | Customer native interface: PlannedQuantity (adapter required) | information only | yes |
| `QuantityUnit` | ZWMX_WMS009-F012 | Customer native interface: QuantityUnit (adapter required) | information only | yes |
| `ProcessType` | ZWMX_WMS009-F013 | Customer native interface: ProcessType (adapter required) | information only | yes |
| `TaskStatus` | ZWMX_WMS009-F014 | Customer native interface: TaskStatus (adapter required) | information only | yes |

## `ZWMX_C_TaskConfirmMig`

- Source: `ZWMX_I_TaskConfirm`
- Keys: `SourceSystem`, `SourceClient`, `ExportBatch`, `Warehouse`, `WarehouseTask`, `ConfirmationID`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: Approve native source completeness, business state and parent/child closure. Select one origin cohort. Customer stages do not establish business eligibility. LE-WM and EWM are distinct source models. Warehouse numbers, entitled-to-dispose party, owner, stock type, batch, HU and serial identities require mapping. Freeze inventory and reconcile MM/IM and EWM without loading stock twice. Open warehouse tasks, orders and deliveries require a verified process migration; recreate or complete them through supported business operations, not table inserts. Packaging specifications and storage-type customizing must be validated independently.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SourceSystem` | ZWMX_WMS010-F001 | Customer native interface: SourceSystem (adapter required) | information only | yes |
| `SourceClient` | ZWMX_WMS010-F002 | Customer native interface: SourceClient (adapter required) | information only | yes |
| `ExportBatch` | ZWMX_WMS010-F003 | Customer native interface: ExportBatch (adapter required) | information only | yes |
| `Warehouse` | ZWMX_WMS010-F004 | Customer native interface: Warehouse (adapter required) | information only | yes |
| `WarehouseTask` | ZWMX_WMS010-F005 | Customer native interface: WarehouseTask (adapter required) | information only | yes |
| `ConfirmationID` | ZWMX_WMS010-F006 | Customer native interface: ConfirmationID (adapter required) | information only | yes |
| `ConfirmedQuantity` | ZWMX_WMS010-F007 | Customer native interface: ConfirmedQuantity (adapter required) | information only | yes |
| `DifferenceQuantity` | ZWMX_WMS010-F008 | Customer native interface: DifferenceQuantity (adapter required) | information only | yes |
| `QuantityUnit` | ZWMX_WMS010-F009 | Customer native interface: QuantityUnit (adapter required) | information only | yes |
| `ConfirmedAtUTC` | ZWMX_WMS010-F010 | Customer native interface: ConfirmedAtUTC (adapter required) | information only | yes |
| `ReversalStatus` | ZWMX_WMS010-F011 | Customer native interface: ReversalStatus (adapter required) | information only | yes |

## Reconciliation

- Counts: `ZWMX_C_WarehouseTaskMigCount` (ECC) vs `ZWMT_I_WarehouseTaskCount` (S/4HANA) per `SourceSystem`, `SourceClient`, `ExportBatch`
- Records and fields: `ZWMX_C_WarehouseTaskMig` vs `ZWMT_I_WarehouseTaskCompare` on `SourceSystem`, `SourceClient`, `ExportBatch`, `Warehouse`, `WarehouseTask`; compared: `WarehouseOrder`, `Product`, `SourceBin`, `DestinationBin`, `HandlingUnit`, `PlannedQuantity`, `QuantityUnit`, `ProcessType`, `TaskStatus`

```bash
python3 tools/mig_reconcile.py counts --product ewm_mig_src --module warehouse_task --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --product ewm_mig_src --module warehouse_task --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- LE-WM and EWM are distinct source models. Warehouse numbers, entitled-to-dispose party, owner, stock type, batch, HU and serial identities require mapping. Freeze inventory and reconcile MM/IM and EWM without loading stock twice. Open warehouse tasks, orders and deliveries require a verified process migration; recreate or complete them through supported business operations, not table inserts. Packaging specifications and storage-type customizing must be validated independently.
- Native export adapters and target business posting are customer implementations.
