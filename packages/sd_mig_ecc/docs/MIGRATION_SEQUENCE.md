# Migration sequence

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been run on a system.

Load order derived from `sequence_after`. Objects on the same level can be loaded in parallel; objects that refer to other objects load after them.

| Level | Modules | Consumption views read by the load program |
|---|---|---|
| 1 | [`sales_order`](mapping/sales_order.md) | `ZSDX_C_SalesOrderMig`, `ZSDX_C_SalesItemMig`, `ZSDX_C_SalesScheduleMig`, `ZSDX_C_SalesBusinessMig`, `ZSDX_C_SalesPartnerMig`, `ZSDX_C_SalesHeaderStaMig`, `ZSDX_C_SalesItemStatuMig`, `ZSDX_C_SalesFlowMig` |
| 2 | [`billing_document`](mapping/billing_document.md), [`outbound_delivery`](mapping/outbound_delivery.md) | `ZSDX_C_BillingMig`, `ZSDX_C_BillingItemMig`, `ZSDX_C_DeliveryMig`, `ZSDX_C_DeliveryItemMig` |
