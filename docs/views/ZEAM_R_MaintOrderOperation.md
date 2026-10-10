# ZEAM_R_MaintOrderOperation

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Maintenance Order Operation - Cube |
| Module | `maintenance_order` |
| Batch | 2 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | #CUBE |
| Data source | `ZEAM_I_MaintOrderOperation` |
| Source file | `src/zeam_r_maintorderoperation.ddls.asddls` |

## Purpose

Operation cube with planned and actual work and order header characteristics (order type, activity type, planning plant, open flag) taken over via path expressions.

## Keys

- `MaintenanceOrder`
- `MaintenanceOrderOperation`
- `MaintenanceOrderSubOperation`

## Associations defined here

- none

## Access control

Role inherits the conditions of `ZEAM_I_MaintOrderOperation`.

## Example use case

Planned vs. actual work hours per work center and month; work-plan adherence per planner group.

## Open verification items

`MO-R02` - see `BATCH_REPORT.md`.
