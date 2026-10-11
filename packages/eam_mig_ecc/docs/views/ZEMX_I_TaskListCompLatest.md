# ZEMX_I_TaskListCompLatest

> Version **1.0.0**

| | |
|---|---|
| Description | TaskListComp latest recorded counter |
| Module | `task_list` |
| Batch | 2 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_I_TaskListCompData` |
| Source file | `src/zemx_i_tasklistcomplatest.ddls.asddls` |

## Purpose

TaskListComp latest recorded counter

## Keys

- `TaskListType`
- `TaskListGroup`
- `TaskListGroupCounter`
- `OperationInternalID`
- `AllocationNumber`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Export the selected migration scope; validate keys and row counts before loading.
