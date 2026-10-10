# ZEAM_I_TaskList

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Maintenance Task List |
| Module | `task_list` |
| Batch | 3 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | #DIMENSION |
| Data source | `I_MaintenanceTaskList` |
| Source file | `src/zeam_i_tasklist.ddls.asddls` |

## Purpose

One row per maintenance task list header version (general / equipment / functional location task list) with description, plant, usage, status and strategy.

## Keys

- `TaskListType`
- `TaskListGroup`
- `TaskListGroupCounter`
- `TaskListVersionCounter`

## Associations defined here

- `_Plant` → `I_Plant` [0..1]

## Access control

Role inherits the conditions of `I_MaintenanceTaskList`.

## Example use case

Task lists per plant and strategy; task list as target of the maintenance item link view.

## Open verification items

`TL-001`, `TL-002`, `TL-003`, `TL-004`, `TL-D01` - see `BATCH_REPORT.md`.
