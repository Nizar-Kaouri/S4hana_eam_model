# ZEAM_I_TaskListVH

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Maintenance Task List - Value Help |
| Module | `task_list` |
| Batch | 3 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | #VALUE_HELP |
| Data source | `ZEAM_I_TaskList` |
| Source file | `src/zeam_i_tasklistvh.ddls.asddls` |

## Purpose

Searchable value help for task lists (type, group, group counter, description).

## Keys

- `TaskListType`
- `TaskListGroup`
- `TaskListGroupCounter`
- `TaskListVersionCounter`

## Associations defined here

- none

## Access control

Role inherits the conditions of `ZEAM_I_TaskList`.

## Example use case

Value help for TaskListGroup in maintenance item or task list analyses.

## Open verification items

none
