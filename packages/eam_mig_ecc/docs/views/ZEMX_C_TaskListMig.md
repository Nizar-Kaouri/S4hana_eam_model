# ZEMX_C_TaskListMig

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Maintenance task list (migration) |
| Module | `task_list` |
| Batch | 2 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_I_TaskListCurrent`, join `ZEMX_I_MigrationMap`, join `ZEMX_I_MigrationMap`, join `ZEMX_I_MigrationMap`, join `ZEMX_I_MigrationMap`, join `ZEMX_I_MigrationMap`, join `ZEMX_I_MigrationMap`, join `ZEMX_I_MigrationMap`, join `ZEMX_I_MigrationMap` |
| Source file | `src/zemx_c_tasklistmig.ddls.asddls` |

## Purpose

Current, not deleted maintenance task list headers with codes and keys translated.

## Keys

- `TaskListGroup`
- `TaskListType`
- `TaskListGroupCounter`

## Associations defined here

- none

## Access control

No DCL by design: Migration view on ECC: it must return every record of the object. Access is controlled by the user / RFC user of the load program and the extraction channel (S_TABU_NAM), not by CDS access control (decision XGEN-D01; CDS access control also needs a newer release than the 7.40 SP08 baseline).

## Example use case

The load program creates one task list per row and writes old -> new group numbers into the key map 'TASK_LIST_GROUP'.

## Open verification items

none
