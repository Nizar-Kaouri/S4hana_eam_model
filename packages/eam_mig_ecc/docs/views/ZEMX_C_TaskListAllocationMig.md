# ZEMX_C_TaskListAllocationMig

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Task list allocation (migration) |
| Module | `task_list` |
| Batch | 2 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_I_TaskListObjectAssgmt`, join `ZEMX_I_TaskListCurrent`, join `ZEMX_I_MigrationMap`, join `ZEMX_I_MigrationMap`, join `ZEMX_I_MigrationMap` |
| Source file | `src/zemx_c_tasklistallocationmig.ddls.asddls` |

## Purpose

Equipment / functional location allocation of the task lists in scope with all keys translated.

## Keys

- `TaskListGroup`
- `TaskListType`
- `TaskListGroupCounter`

## Associations defined here

- none

## Access control

No DCL by design: Migration view on ECC: it must return every record of the object. Access is controlled by the user / RFC user of the load program and the extraction channel (S_TABU_NAM), not by CDS access control (decision XGEN-D01; CDS access control also needs a newer release than the 7.40 SP08 baseline).

## Example use case

The load program assigns each equipment task list to the translated equipment.

## Open verification items

none
