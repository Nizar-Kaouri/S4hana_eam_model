# ZSDV_B_SOItemWithDelivery

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Sales Order Item with Deliveries |
| Module | link: `outbound_delivery` + `sales_order` |
| Batch | 2 |
| Layer | link (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `ZSDV_B_SalesOrderItem` |
| Source file | `src/zsdv_b_soitemwithdelivery.ddls.asddls` |

## Purpose

Sales order item with a to-many association to the delivery items that reference it.

## Keys

- `SalesDocument`
- `SalesDocumentItem`

## Associations defined here

- `_DeliveryItem` → `ZSDV_B_DeliveryItem` [0..*]

## Access control

Role inherits the conditions of `ZSDV_B_SalesOrderItem`.

## Example use case

Document flow order → delivery in an order item object page.

## Open verification items

none
