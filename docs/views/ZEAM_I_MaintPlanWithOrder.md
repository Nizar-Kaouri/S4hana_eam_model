# ZEAM_I_MaintPlanWithOrder

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Maintenance Plan with Orders |
| Module | link: `maintenance_order` + `maintenance_plan` |
| Batch | 2 |
| Layer | link (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `ZEAM_I_MaintPlan` |
| Source file | `src/zeam_i_maintplanwithorder.ddls.asddls` |

## Purpose

Maintenance plan with a to-many association to the orders it generated.

## Keys

- `MaintenancePlan`

## Associations defined here

- `_MaintenanceOrder` → `ZEAM_I_MaintOrder` [0..*]

## Access control

Role inherits the conditions of `ZEAM_I_MaintPlan`.

## Example use case

Preventive maintenance compliance: orders per plan and their completion status.

## Open verification items

none
