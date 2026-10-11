# ZMMV_I_PurchaseOrderItem

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Purchase Order Item - Cube |
| Module | `purchase_order` |
| Batch | 3 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | #CUBE |
| Data source | `ZMMV_B_PurchaseOrderItem` |
| Source file | `src/zmmv_i_purchaseorderitem.ddls.asddls` |

## Purpose

Purchase order item cube: ordered quantity, net value, number of (open) items, with supplier, purchasing organization and group from the header.

## Keys

- `PurchaseOrder`
- `PurchaseOrderItem`

## Associations defined here

- none

## Access control

Role inherits the conditions of `ZMMV_B_PurchaseOrderItem`.

## Example use case

Purchase volume per supplier and material group; open items per purchasing group.

## Open verification items

none
