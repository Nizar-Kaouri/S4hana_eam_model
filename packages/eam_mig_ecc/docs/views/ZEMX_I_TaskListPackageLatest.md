# ZEMX_I_TaskListPackageLatest

> Version **1.0.0**

| | |
|---|---|
| Description | TaskListPackage latest recorded counter |
| Module | `task_list` |
| Batch | 2 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_B_TaskListPackageData` |
| Source file | `src/zemx_i_tasklistpackagelatest.ddls.asddls` |

## Purpose

TaskListPackage latest recorded counter

## Keys

- `TaskListType`
- `TaskListGroup`
- `TaskListGroupCounter`
- `OperationInternalID`
- `MaintenancePackage`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Export the selected migration scope; validate keys and row counts before loading.
