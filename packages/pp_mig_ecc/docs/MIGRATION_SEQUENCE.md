# Migration sequence

> Version **1.0.0**

Load order derived from `sequence_after`. Objects on the same level can be loaded in parallel; objects that refer to other objects load after them.

| Level | Modules | Consumption views read by the load program |
|---|---|---|
| 1 | [`bill_of_material`](mapping/bill_of_material.md), [`production_order`](mapping/production_order.md), [`routing`](mapping/routing.md) | `ZPPX_C_MaterialBOMMig`, `ZPPX_C_BOMHeaderMig`, `ZPPX_C_BOMSelectionMig`, `ZPPX_C_BOMItemMig`, `ZPPX_C_BOMLongTextMig`, `ZPPX_C_ProductionOrdeMig`, `ZPPX_C_ProductionHeadMig`, `ZPPX_C_ProductionItemMig`, `ZPPX_C_OrderStatusMig`, `ZPPX_C_OrderUserStatusMig`, `ZPPX_C_OrderLongTextMig`, `ZPPX_C_RoutingHeaderMig`, `ZPPX_C_RoutingMateriaMig`, `ZPPX_C_RoutingSelectiMig`, `ZPPX_C_RoutingOperatiMig`, `ZPPX_C_RoutingSequencMig`, `ZPPX_C_RoutingLongTextMig` |
| 2 | [`production_order_operation`](mapping/production_order_operation.md), [`production_version`](mapping/production_version.md) | `ZPPX_C_ProductionOperMig`, `ZPPX_C_OperationQuantMig`, `ZPPX_C_OrderComponentMig`, `ZPPX_C_ProdVersionMig` |
| 3 | [`production_confirmation`](mapping/production_confirmation.md) | `ZPPX_C_ConfirmationMig` |
