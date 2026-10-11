# ZSDV_B_DeliveryItem

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Outbound Delivery Item |
| Module | `outbound_delivery` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `I_DeliveryDocumentItem` |
| Source file | `src/zsdv_b_deliveryitem.ddls.asddls` |

## Purpose

One row per delivery item: material, plant, storage location, delivered quantity and the reference sales order item.

## Keys

- `DeliveryDocument`
- `DeliveryDocumentItem`

## Associations defined here

- `_Delivery` → `ZSDV_B_OutboundDelivery` [1..1]
- `_Plant` → `I_Plant` [0..1]

## Access control

Role inherits the conditions of `I_DeliveryDocumentItem`.

## Example use case

Delivered quantity per material and plant; deliveries per sales order.

## Open verification items

`SD-012`, `SD-D04` - see `BATCH_REPORT.md`.
