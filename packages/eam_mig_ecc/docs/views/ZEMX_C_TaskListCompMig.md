# ZEMX_C_TaskListCompMig

> Version **1.0.0**

| | |
|---|---|
| Description | TaskListComp migration extract |
| Module | `task_list` |
| Batch | 2 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_I_TaskListComp` |
| Source file | `src/zemx_c_tasklistcompmig.ddls.asddls` |

## Purpose

TaskListComp migration extract

## Keys

- `TaskListType`
- `TaskListGroup`
- `TaskListGroupCounter`
- `OperationInternalID`
- `VersionCounter`
- `AllocationNumber`

## Associations defined here

- `_Parent` → `ZEMX_I_TaskListCurrent` [0..1]

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Export the selected migration scope; validate keys and row counts before loading.
