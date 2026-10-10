# ZBRG_I_OrderCompWithProduct

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Order Component with Product |
| Module | bridge: `eam:maintenance_order` + `mm:product` |
| Batch | 1 |
| Layer | link (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `ZEAM_I_MaintOrderComponent` |
| Source file | `src/zbrg_i_ordercompwithproduct.ddls.asddls` |

## Purpose

Maintenance order components with the material master (product type, group, base unit, texts via the product dimension).

## Keys

- `Reservation`
- `ReservationItem`

## Associations defined here

- `_Product` → `ZMMV_I_Product` [0..1]

## Access control

Role inherits the conditions of `ZEAM_I_MaintOrderComponent`.

## Example use case

Spare-part demand of maintenance orders by product group.

## Open verification items

none
