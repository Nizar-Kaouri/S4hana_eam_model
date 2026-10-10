# Migration sequence

> Status: **draft-unverified** · tested release: none (draft, customer staging on NetWeaver 7.40 SP08+ assumed). Nothing below has been run on a system.

Load order derived from `sequence_after`. Objects on the same level can be loaded in parallel; objects that refer to other objects load after them.

| Level | Modules | Consumption views read by the load program |
|---|---|---|
| 1 | [`pack_specification`](mapping/pack_specification.md), [`storage_bin`](mapping/storage_bin.md), [`warehouse_order`](mapping/warehouse_order.md) | `ZWMX_C_PackSpecMig`, `ZWMX_C_PackLevelMig`, `ZWMX_C_PackElementMig`, `ZWMX_C_StorageBinMig`, `ZWMX_C_BinSortingMig`, `ZWMX_C_WarehouseOrderMig` |
| 2 | [`warehouse_product`](mapping/warehouse_product.md) | `ZWMX_C_WarehouseProdMig`, `ZWMX_C_FixedBinMig` |
| 3 | [`handling_unit`](mapping/handling_unit.md), [`warehouse_delivery`](mapping/warehouse_delivery.md), [`warehouse_stock`](mapping/warehouse_stock.md), [`warehouse_task`](mapping/warehouse_task.md) | `ZWMX_C_HandlingUnitMig`, `ZWMX_C_HUContentMig`, `ZWMX_C_WhDeliveryMig`, `ZWMX_C_WhDeliveryItemMig`, `ZWMX_C_WarehouseStockMig`, `ZWMX_C_StockSerialMig`, `ZWMX_C_WarehouseTaskMig`, `ZWMX_C_TaskConfirmMig` |
