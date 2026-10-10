# ZMMV_C_PurchaseOrderQ

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Purchase Order Analysis |
| Module | `purchase_order` |
| Batch | 3 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | transient view entity |
| Data category | analytical query |
| Data source | `ZMMV_R_PurchaseOrderItem` |
| Source file | `src/zmmv_c_purchaseorderq.ddls.asddls` |

## Purpose

Analytical query on ZMMV_R_PurchaseOrderItem: purchase volume per purchasing organization and supplier.

## Keys

- none (transient / aggregated)

## Associations defined here

- none

## Access control

No DCL by design: Transient analytical query; authorization is enforced by the DCL of the provider ZMMV_R_PurchaseOrderItem (see GEN-Q01).

## Example use case

Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.

## Open verification items

`GEN-Q01` - see `BATCH_REPORT.md`.
