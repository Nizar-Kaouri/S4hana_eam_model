# ZEMT_I_TaskListCount

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Maintenance task list count (reconciliation) |
| Module | `task_list` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | - |
| Data source | `I_MaintenanceTaskList` |
| Source file | `src/zemt_i_tasklistcount.ddls.asddls` |

## Purpose

Record count of maintenance task lists on S/4HANA per TaskListType, Plant; same structure as the ECC count view.

## Keys

- `TaskListType`
- `Plant`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Export after the load: python3 tools/mig_reconcile.py counts --module task_list --source <ECC export> --target <this export>.

## Open verification items

none
