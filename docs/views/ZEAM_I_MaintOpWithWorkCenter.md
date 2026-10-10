# ZEAM_I_MaintOpWithWorkCenter

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Order Operation with Work Center |
| Module | link: `maintenance_order` + `work_center` |
| Batch | 2 |
| Layer | link (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `ZEAM_I_MaintOrderOperation` |
| Source file | `src/zeam_i_maintopwithworkcenter.ddls.asddls` |

## Purpose

Maintenance order operations with an association to their work center (dimension) and the work center description / category via path expressions.

## Keys

- `MaintenanceOrder`
- `MaintenanceOrderOperation`
- `MaintenanceOrderSubOperation`

## Associations defined here

- `_WorkCenter` → `ZEAM_I_WorkCenter` [0..1]

## Access control

Role inherits the conditions of `ZEAM_I_MaintOrderOperation`.

## Example use case

Operation list with work center description; navigate from an operation to its work center.

## Open verification items

none
