# Migration sequence

> Version **1.0.0**

Load order derived from `sequence_after`. Objects on the same level can be loaded in parallel; objects that refer to other objects load after them.

| Level | Modules | Consumption views read by the load program |
|---|---|---|
| 1 | [`pricing_condition`](mapping/pricing_condition.md), [`sales_order`](mapping/sales_order.md) | `ZSDX_C_ConditionHdrMig`, `ZSDX_C_ConditionItemMig`, `ZSDX_C_QuantityScaleMig`, `ZSDX_C_ValueScaleMig`, `ZSDX_C_SalesOrderMig`, `ZSDX_C_SalesItemMig`, `ZSDX_C_SalesScheduleMig`, `ZSDX_C_SalesBusinessMig`, `ZSDX_C_SalesPartnerMig`, `ZSDX_C_SalesHeaderStaMig`, `ZSDX_C_SalesItemStatuMig`, `ZSDX_C_SalesFlowMig`, `ZSDX_C_SalesPartnerAddressMig`, `ZSDX_C_SalesLongTextMig` |
| 2 | [`billing_document`](mapping/billing_document.md), [`outbound_delivery`](mapping/outbound_delivery.md) | `ZSDX_C_BillingMig`, `ZSDX_C_BillingItemMig`, `ZSDX_C_BillingPartnerMig`, `ZSDX_C_BillingPartnerAddrMig`, `ZSDX_C_BillingLongTextMig`, `ZSDX_C_DeliveryMig`, `ZSDX_C_DeliveryItemMig`, `ZSDX_C_DeliveryPartnerMig`, `ZSDX_C_DeliveryPartnerAddrMig`, `ZSDX_C_DeliveryStatusMig`, `ZSDX_C_DlvItemStatusMig`, `ZSDX_C_DeliveryLongTextMig` |
