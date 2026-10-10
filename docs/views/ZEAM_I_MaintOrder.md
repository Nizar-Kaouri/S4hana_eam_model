# ZEAM_I_MaintOrder

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Maintenance Order |
| Module | `maintenance_order` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | #DIMENSION |
| Data source | `I_MaintenanceOrder` |
| Source file | `src/zeam_i_maintorder.ddls.asddls` |

## Purpose

One row per maintenance order header with type, activity type, priority, process phase, planning and cost-assignment data, basic dates and a derived open/closed flag; analytical dimension for operation, component, cost and backlog cubes.

## Keys

- `MaintenanceOrder`

## Associations defined here

- `_MaintenancePlant` → `I_Plant` [0..1]
- `_MaintenancePlanningPlant` → `I_Plant` [0..1]
- `_CompanyCode` → `I_CompanyCode` [0..1]

## Access control

Role inherits the conditions of `I_MaintenanceOrder`.

## Example use case

List open preventive orders per planning plant; join cost line items to order attributes. Equipment, functional location, notification and maintenance plan are plain fields here; their associations live in link views (ZEAM_I_*WithOrder, ZEAM_I_NotifWithOrder, ZEAM_I_MaintPlanWithOrder).

## Open verification items

`MO-001`, `MO-002`, `MO-003`, `MO-004`, `MO-005`, `MO-006`, `MO-007`, `MO-008`, `MO-D01` - see `BATCH_REPORT.md`.
