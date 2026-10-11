# ZBRG_I_OrderCompWithProduct

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Order Component Cube with Product |
| Module | bridge: `eam:maintenance_order` + `mm:product` |
| Batch | 1 |
| Layer | link (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | #CUBE |
| Data source | `ZEAM_I_MaintOrderComponent` |
| Source file | `src/zbrg_i_ordercompwithproduct.ddls.asddls` |

## Purpose

Maintenance order component cube enriched with product type and group.

## Keys

- `Reservation`
- `ReservationItem`

## Associations defined here

- `_Product` → `ZMMV_B_Product` [0..1]

## Access control

Role inherits the conditions of `ZEAM_I_MaintOrderComponent`.

## Example use case

Open spare-part quantities per product group and planning plant.

## Open verification items

none
