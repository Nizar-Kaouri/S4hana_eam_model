# ZEAM_B_MaintItem

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Maintenance Item |
| Module | `maintenance_plan` |
| Batch | 3 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | #DIMENSION |
| Data source | `I_MaintenanceItem` |
| Source file | `src/zeam_b_maintitem.ddls.asddls` |

## Purpose

One row per maintenance item with its plan, reference object (plain fields), planning data, order type / priority / activity type to be generated and the assigned task list.

## Keys

- `MaintenanceItem`

## Associations defined here

- `_MaintenancePlan` → `ZEAM_B_MaintPlan` [0..1]
- `_MaintenancePlanningPlant` → `I_Plant` [0..1]

## Access control

Role inherits the conditions of `I_MaintenanceItem`.

## Example use case

Which equipment is covered by preventive maintenance, and with which task list.

## Open verification items

`PL-010`, `PL-011`, `PL-012`, `PL-013`, `PL-014`, `PL-D02` - see `BATCH_REPORT.md`.
