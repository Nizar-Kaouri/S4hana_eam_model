# Migration interface: warehouse_order

> Status: **draft-unverified** · tested release: none (native DDIC and SAP activation pending). Nothing below has been run on a system.

- **Read by:** Customer-selected supported business interface; native views are read-only
- **Load after:** - (first level)
- **Business key:** `Warehouse`, `WarehouseOrder` · numbering **keep**
- **Key rule:** Native internal keys are retained. Client is implicit. Record system/client/export time outside the CDS. Map regenerated target UUIDs using an approved key ledger before comparison.

The consumption views deliver the values **exactly as stored in SAP source**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZWMX_C_WarehouseOrderMig`

- Source: `ZWMX_I_WarehouseOrder`
- Keys: `Warehouse`, `WarehouseOrder`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: All native warehouse-order records; customer must approve process state and cutover scope. Confirm full native key flags and approve the business cohort. Native extraction is not posting.

| Element | Source (SAP source) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Warehouse` | /SCWM/WHO-LGNUM | Native target evidence: ZWMT_B_WarehouseOrderCompare.Warehouse | information only | yes |
| `WarehouseOrder` | /SCWM/WHO-WHO | Native target evidence: ZWMT_B_WarehouseOrderCompare.WarehouseOrder | information only | yes |
| `CreationRule` | /SCWM/WHO-WCR | Native target evidence: ZWMT_B_WarehouseOrderCompare.CreationRule | information only | yes |
| `OrderStatus` | /SCWM/WHO-STATUS | Native target evidence: ZWMT_B_WarehouseOrderCompare.OrderStatus | information only | yes |
| `Queue` | /SCWM/WHO-QUEUE | Native target evidence: ZWMT_B_WarehouseOrderCompare.Queue | information only | yes |
| `ActivityArea` | /SCWM/WHO-AREAWHO | Native target evidence: ZWMT_B_WarehouseOrderCompare.ActivityArea | information only | yes |
| `CreatedAt` | /SCWM/WHO-CREATED_AT | Native target evidence: ZWMT_B_WarehouseOrderCompare.CreatedAt | information only | yes |
| `CreatedBy` | /SCWM/WHO-CREATED_BY | Native target evidence: ZWMT_B_WarehouseOrderCompare.CreatedBy | information only | yes |
| `StartedAt` | /SCWM/WHO-STARTED_AT | Native target evidence: ZWMT_B_WarehouseOrderCompare.StartedAt | information only | yes |
| `ConfirmedAt` | /SCWM/WHO-CONFIRMED_AT | Native target evidence: ZWMT_B_WarehouseOrderCompare.ConfirmedAt | information only | yes |

## Reconciliation

- Counts: `ZWMX_C_WarehouseOrderMigCount` (SAP source) vs `ZWMT_I_WarehouseOrderCount` (S/4HANA) per `Warehouse`
- Records and fields: `ZWMX_C_WarehouseOrderMig` vs `ZWMT_B_WarehouseOrderCompare` on `Warehouse`, `WarehouseOrder`; compared: `CreationRule`, `OrderStatus`, `Queue`, `ActivityArea`, `CreatedAt`, `CreatedBy`, `StartedAt`, `ConfirmedAt`

```bash
python3 tools/mig_reconcile.py counts --product ewm_mig_src --module warehouse_order --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --product ewm_mig_src --module warehouse_order --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- Actual DDIC, release, SAP activation and acceptance unverified.
- WarehouseOrder: All native warehouse-order records; customer must approve process state and cutover scope.
