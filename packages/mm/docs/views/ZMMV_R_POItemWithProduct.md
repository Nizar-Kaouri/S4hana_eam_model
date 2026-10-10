# ZMMV_R_POItemWithProduct

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Purchase Order Item with Product |
| Module | link: `product` + `purchase_order` |
| Batch | 1 |
| Layer | link (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | #CUBE |
| Data source | `ZMMV_R_PurchaseOrderItem` |
| Source file | `src/zmmv_r_poitemwithproduct.ddls.asddls` |

## Purpose

Purchase order item cube enriched with product type and group.

## Keys

- `PurchaseOrder`
- `PurchaseOrderItem`

## Associations defined here

- `_Product` → `ZMMV_I_Product` [0..1]

## Access control

Role inherits the conditions of `ZMMV_R_PurchaseOrderItem`.

## Example use case

Purchase volume per product group and supplier.

## Open verification items

none
