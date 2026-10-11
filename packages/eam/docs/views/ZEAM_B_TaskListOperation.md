# ZEAM_B_TaskListOperation

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Maintenance Task List Operation |
| Module | `task_list` |
| Batch | 3 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `I_MaintenanceTaskListOperation` |
| Source file | `src/zeam_b_tasklistoperation.ddls.asddls` |

## Purpose

One row per task list operation version with work center, control key and planned work.

## Keys

- `TaskListType`
- `TaskListGroup`
- `TaskListGroupCounter`
- `TaskListOperationInternalId`
- `TaskListOpVersionCounter`

## Associations defined here

- `_TaskList` → `ZEAM_B_TaskList` [0..*]

## Access control

Role inherits the conditions of `I_MaintenanceTaskListOperation`.

## Example use case

Planned work content of task lists per work center (capacity planning for preventive maintenance).

## Open verification items

`TL-010`, `TL-011`, `TL-012`, `TL-D02` - see `BATCH_REPORT.md`.
