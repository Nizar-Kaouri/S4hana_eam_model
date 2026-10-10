# ZEAM_R_MaintOrder

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Maintenance Order - Cube |
| Module | `maintenance_order` |
| Batch | 2 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | #CUBE |
| Data source | `ZEAM_I_MaintOrder` |
| Source file | `src/zeam_r_maintorder.ddls.asddls` |

## Purpose

Order header cube with counters for all and open orders and the planned order duration.

## Keys

- `MaintenanceOrder`

## Associations defined here

- `_MaintenanceOrder` → `ZEAM_I_MaintOrder` [1..1]

## Access control

Role inherits the conditions of `ZEAM_I_MaintOrder`.

## Example use case

Open orders per planning plant and order type; share of breakdown (activity type) orders.

## Open verification items

`MO-R01` - see `BATCH_REPORT.md`.
