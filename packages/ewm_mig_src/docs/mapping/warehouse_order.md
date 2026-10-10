# Migration interface: warehouse_order

> Status: **draft-unverified** · tested release: none (draft, customer staging on NetWeaver 7.40 SP08+ assumed). Nothing below has been run on a system.

- **Read by:** Customer-selected supported business interface; stages are not posting
- **Load after:** - (first level)
- **Business key:** `SourceSystem`, `SourceClient`, `ExportBatch`, `Warehouse`, `WarehouseOrder` · numbering **keep**
- **Key rule:** Origin metadata identifies the source cohort. Normalize mapped target identifiers back to source keys and retain original target IDs in a separate audit ledger.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZWMX_C_WarehouseOrderMig`

- Source: `ZWMX_I_WarehouseOrder`
- Keys: `SourceSystem`, `SourceClient`, `ExportBatch`, `Warehouse`, `WarehouseOrder`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: Approve native source completeness, business state and parent/child closure. Select one origin cohort. Customer stages do not establish business eligibility. LE-WM and EWM are distinct source models. Warehouse numbers, entitled-to-dispose party, owner, stock type, batch, HU and serial identities require mapping. Freeze inventory and reconcile MM/IM and EWM without loading stock twice. Open warehouse tasks, orders and deliveries require a verified process migration; recreate or complete them through supported business operations, not table inserts. Packaging specifications and storage-type customizing must be validated independently.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SourceSystem` | ZWMX_WMS011-F001 | Customer native interface: SourceSystem (adapter required) | information only | yes |
| `SourceClient` | ZWMX_WMS011-F002 | Customer native interface: SourceClient (adapter required) | information only | yes |
| `ExportBatch` | ZWMX_WMS011-F003 | Customer native interface: ExportBatch (adapter required) | information only | yes |
| `Warehouse` | ZWMX_WMS011-F004 | Customer native interface: Warehouse (adapter required) | information only | yes |
| `WarehouseOrder` | ZWMX_WMS011-F005 | Customer native interface: WarehouseOrder (adapter required) | information only | yes |
| `ActivityArea` | ZWMX_WMS011-F006 | Customer native interface: ActivityArea (adapter required) | information only | yes |
| `Queue` | ZWMX_WMS011-F007 | Customer native interface: Queue (adapter required) | information only | yes |
| `Resource` | ZWMX_WMS011-F008 | Customer native interface: Resource (adapter required) | information only | yes |
| `OrderStatus` | ZWMX_WMS011-F009 | Customer native interface: OrderStatus (adapter required) | information only | yes |
| `CreatedAtUTC` | ZWMX_WMS011-F010 | Customer native interface: CreatedAtUTC (adapter required) | information only | yes |

## Reconciliation

- Counts: `ZWMX_C_WarehouseOrderMigCount` (ECC) vs `ZWMT_I_WarehouseOrderCount` (S/4HANA) per `SourceSystem`, `SourceClient`, `ExportBatch`
- Records and fields: `ZWMX_C_WarehouseOrderMig` vs `ZWMT_I_WarehouseOrderCompare` on `SourceSystem`, `SourceClient`, `ExportBatch`, `Warehouse`, `WarehouseOrder`; compared: `ActivityArea`, `Queue`, `Resource`, `OrderStatus`, `CreatedAtUTC`

```bash
python3 tools/mig_reconcile.py counts --product ewm_mig_src --module warehouse_order --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --product ewm_mig_src --module warehouse_order --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- LE-WM and EWM are distinct source models. Warehouse numbers, entitled-to-dispose party, owner, stock type, batch, HU and serial identities require mapping. Freeze inventory and reconcile MM/IM and EWM without loading stock twice. Open warehouse tasks, orders and deliveries require a verified process migration; recreate or complete them through supported business operations, not table inserts. Packaging specifications and storage-type customizing must be validated independently.
- Native export adapters and target business posting are customer implementations.
