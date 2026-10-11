# ZEMX_C_TaskListOperationMig

> Version **1.0.0**

| | |
|---|---|
| Description | Task list operation (migration) |
| Module | `task_list` |
| Batch | 2 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_I_TaskListOperation` |
| Source file | `src/zemx_c_tasklistoperationmig.ddls.asddls` |

## Purpose

Operations of the task lists in scope (not deleted) with work center, control key and units.

## Keys

- `TaskListType`
- `TaskListGroup`
- `TaskListGroupCounter`
- `TaskListSequence`
- `TaskListOperation`

## Associations defined here

- `_TaskListCurrent` → `ZEMX_I_TaskListCurrent` [0..1]

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

The load program adds the operations to the task list created from ZEMX_C_TaskListMig.
