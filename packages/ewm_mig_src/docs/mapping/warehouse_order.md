# Migration interface: warehouse_order

> Status: **draft-unverified** · tested release: none (native DDIC and SAP activation pending). Nothing below has been run on a system.

- **Read by:** Customer-selected supported business interface; native views are read-only
- **Load after:** - (first level)
- **Business key:** `Warehouse`, `WarehouseOrder` · numbering **keep**
- **Key rule:** Native internal keys are retained. Client is implicit. Record system/client/export time outside the CDS. Map regenerated target UUIDs using an approved key ledger during loading.

The consumption views deliver the values **exactly as stored in SAP source**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZWMX_C_WarehouseOrderMig`

- Source: `ZWMX_I_WarehouseOrder`
- Keys: `Warehouse`, `WarehouseOrder`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: All native warehouse-order records; customer must approve process state and cutover scope. Confirm full native key flags and approve the business cohort. Native extraction is not posting.

| Element | Source (SAP source) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `Warehouse` | /SCWM/WHO-LGNUM | Native target evidence: ZWMT_B_WarehouseOrderCompare.Warehouse | information only |
| `WarehouseOrder` | /SCWM/WHO-WHO | Native target evidence: ZWMT_B_WarehouseOrderCompare.WarehouseOrder | information only |
| `CreationRule` | /SCWM/WHO-WCR | Native target evidence: ZWMT_B_WarehouseOrderCompare.CreationRule | information only |
| `OrderStatus` | /SCWM/WHO-STATUS | Native target evidence: ZWMT_B_WarehouseOrderCompare.OrderStatus | information only |
| `Queue` | /SCWM/WHO-QUEUE | Native target evidence: ZWMT_B_WarehouseOrderCompare.Queue | information only |
| `ActivityArea` | /SCWM/WHO-AREAWHO | Native target evidence: ZWMT_B_WarehouseOrderCompare.ActivityArea | information only |
| `CreatedAt` | /SCWM/WHO-CREATED_AT | Native target evidence: ZWMT_B_WarehouseOrderCompare.CreatedAt | information only |
| `CreatedBy` | /SCWM/WHO-CREATED_BY | Native target evidence: ZWMT_B_WarehouseOrderCompare.CreatedBy | information only |
| `StartedAt` | /SCWM/WHO-STARTED_AT | Native target evidence: ZWMT_B_WarehouseOrderCompare.StartedAt | information only |
| `ConfirmedAt` | /SCWM/WHO-CONFIRMED_AT | Native target evidence: ZWMT_B_WarehouseOrderCompare.ConfirmedAt | information only |

## Source controls

- Source count view: `ZWMX_C_WarehouseOrderMigCount`

## Open gaps

- Actual DDIC, release, SAP activation and acceptance unverified.
- WarehouseOrder: All native warehouse-order records; customer must approve process state and cutover scope.
