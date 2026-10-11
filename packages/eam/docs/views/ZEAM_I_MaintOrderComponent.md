# ZEAM_I_MaintOrderComponent

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Maintenance Order Component - Cube |
| Module | `maintenance_order` |
| Batch | 2 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | #CUBE |
| Data source | `ZEAM_B_MaintOrderComponent` |
| Source file | `src/zeam_i_maintordercomponent.ddls.asddls` |

## Purpose

Component cube with requirement, withdrawn and open quantity per material, plus order header characteristics via path expressions.

## Keys

- `Reservation`
- `ReservationItem`

## Associations defined here

- none

## Access control

Role inherits the conditions of `ZEAM_B_MaintOrderComponent`.

## Example use case

Spare-part demand per plant/material for open orders; open withdrawals per storage location.

## Open verification items

`MO-R03` - see `BATCH_REPORT.md`.
