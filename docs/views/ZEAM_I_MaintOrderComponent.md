# ZEAM_I_MaintOrderComponent

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Maintenance Order Component |
| Module | `maintenance_order` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `I_MaintenanceOrderComponent` |
| Source file | `src/zeam_i_maintordercomponent.ddls.asddls` |

## Purpose

One row per material component (reservation item) of a maintenance order with requirement and withdrawn quantity.

## Keys

- `Reservation`
- `ReservationItem`

## Associations defined here

- `_MaintenanceOrder` → `ZEAM_I_MaintOrder` [1..1]
- `_Plant` → `I_Plant` [0..1]

## Access control

Role inherits the conditions of `I_MaintenanceOrderComponent`.

## Example use case

Spare-part demand per plant and material; components still to be withdrawn for open orders.

## Open verification items

`MO-C01`, `MO-C02`, `MO-C03`, `MO-C04`, `MO-D03` - see `BATCH_REPORT.md`.
