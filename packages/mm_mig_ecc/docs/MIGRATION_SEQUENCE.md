# Migration sequence

> Version **1.0.0**

Load order derived from `sequence_after`. Objects on the same level can be loaded in parallel; objects that refer to other objects load after them.

| Level | Modules | Consumption views read by the load program |
|---|---|---|
| 1 | [`product`](mapping/product.md) | `ZMMX_C_MaterialMig`, `ZMMX_C_MaterialTextMig`, `ZMMX_C_MaterialPlantMig`, `ZMMX_C_MaterialLocatiMig`, `ZMMX_C_MaterialUnitMig`, `ZMMX_C_MaterialValueMig`, `ZMMX_C_BatchGeneralMig`, `ZMMX_C_BatchPlantMig` |
| 2 | [`goods_movement`](mapping/goods_movement.md), [`material_stock`](mapping/material_stock.md), [`purchase_order`](mapping/purchase_order.md), [`purchase_requisition`](mapping/purchase_requisition.md), [`purchasing_contract`](mapping/purchasing_contract.md), [`purchasing_info_record`](mapping/purchasing_info_record.md) | `ZMMX_C_MatDocHeaderMig`, `ZMMX_C_MatDocItemMig`, `ZMMX_C_LocationStockMig`, `ZMMX_C_BatchStockMig`, `ZMMX_C_SalesOrderStocMig`, `ZMMX_C_SupplierStockMig`, `ZMMX_C_PurchaseOrderMig`, `ZMMX_C_PurchaseItemMig`, `ZMMX_C_PurchaseScheduMig`, `ZMMX_C_PurchaseAssignMig`, `ZMMX_C_PurchaseHistorMig`, `ZMMX_C_RequisitionMig`, `ZMMX_C_ReqAssignmentMig`, `ZMMX_C_ContractHeaderMig`, `ZMMX_C_ContractItemMig`, `ZMMX_C_ContractAssignMig`, `ZMMX_C_InfoRecordMig`, `ZMMX_C_InfoPurchOrgMig` |
