# ZSDV_R_DeliveryItem

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Outbound Delivery Item - Cube |
| Module | `outbound_delivery` |
| Batch | 2 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | #CUBE |
| Data source | `ZSDV_I_DeliveryItem` |
| Source file | `src/zsdv_r_deliveryitem.ddls.asddls` |

## Purpose

Delivery item cube: delivered quantity and number of items per shipping point, plant, material and ship-to party, with goods-issue and on-time flags from the header.

## Keys

- `DeliveryDocument`
- `DeliveryDocumentItem`

## Associations defined here

- none

## Access control

Role inherits the conditions of `ZSDV_I_DeliveryItem`.

## Example use case

Share of items delivered on time per shipping point.

## Open verification items

none
