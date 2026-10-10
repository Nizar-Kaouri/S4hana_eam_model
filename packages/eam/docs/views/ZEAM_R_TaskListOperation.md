# ZEAM_R_TaskListOperation

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Task List Operation - Cube |
| Module | `task_list` |
| Batch | 3 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | #CUBE |
| Data source | `ZEAM_I_TaskListOperation` |
| Source file | `src/zeam_r_tasklistoperation.ddls.asddls` |

## Purpose

Task list operation cube with planned work and number of operations per work center, plant and task list.

## Keys

- `TaskListType`
- `TaskListGroup`
- `TaskListGroupCounter`
- `TaskListOperationInternalId`
- `TaskListOpVersionCounter`

## Associations defined here

- none

## Access control

Role inherits the conditions of `ZEAM_I_TaskListOperation`.

## Example use case

Planned work content per work center across all equipment task lists.

## Open verification items

none
