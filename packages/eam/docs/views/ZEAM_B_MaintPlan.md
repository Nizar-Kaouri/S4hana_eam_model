# ZEAM_B_MaintPlan

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Maintenance Plan |
| Module | `maintenance_plan` |
| Batch | 3 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | #DIMENSION |
| Data source | `I_MaintenancePlan` |
| Source file | `src/zeam_b_maintplan.ddls.asddls` |

## Purpose

One row per maintenance plan with description, category, strategy and creation data; dimension for maintenance item and order analyses.

## Keys

- `MaintenancePlan`

## Associations defined here

- `_MaintenanceItem` → `ZEAM_B_MaintItem` [0..*]

## Access control

Role inherits the conditions of `I_MaintenancePlan`.

## Example use case

Strategy plans vs. single-cycle plans per category; maintenance plan as characteristic in order cubes.

## Open verification items

`PL-001`, `PL-002`, `PL-003`, `PL-D01` - see `BATCH_REPORT.md`.
