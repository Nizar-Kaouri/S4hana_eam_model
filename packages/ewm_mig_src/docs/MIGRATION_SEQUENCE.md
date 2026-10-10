# Migration sequence

> Status: **draft-unverified** · tested release: none (native DDIC and SAP activation pending). Nothing below has been run on a system.

This groups the supplied native extraction drafts only. Pending dependencies remain listed in module metadata and mappings; this is not a complete business load plan. No load program is supplied.

| Level | Modules | Supplied native consumption views |
|---|---|---|
| 1 | [`storage_bin`](mapping/storage_bin.md), [`warehouse_order`](mapping/warehouse_order.md) | `ZWMX_C_StorageBinMig`, `ZWMX_C_BinSortingMig`, `ZWMX_C_WarehouseOrderMig` |
| 2 | [`warehouse_task`](mapping/warehouse_task.md) | `ZWMX_C_TaskConfirmMig` |
