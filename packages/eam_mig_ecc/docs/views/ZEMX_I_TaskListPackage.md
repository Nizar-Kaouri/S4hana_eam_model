# ZEMX_I_TaskListPackage

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | TaskListPackage migration business data |
| Module | `task_list` |
| Batch | 2 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_I_TaskListPackageData`, join `ZEMX_I_TaskListPackageLatest` |
| Source file | `src/zemx_i_tasklistpackage.ddls.asddls` |

## Purpose

TaskListPackage migration business data

## Keys

- `TaskListType`
- `TaskListGroup`
- `TaskListGroupCounter`
- `OperationInternalID`
- `VersionCounter`
- `MaintenancePackage`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Export the selected migration scope; validate keys and row counts before loading.

## Open verification items

none
