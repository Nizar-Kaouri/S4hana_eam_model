# ZEMX_C_TaskListOperationMig

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Task list operation (migration) |
| Module | `task_list` |
| Batch | 2 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_I_TaskListOperation`, join `ZEMX_I_TaskListCurrent` |
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

- none

## Access control

No DCL by design: Migration view on ECC: it must return every record of the object. Access is controlled by the user / RFC user of the load program and the extraction channel (S_TABU_NAM), not by CDS access control (decision XGEN-D01; CDS access control also needs a newer release than the 7.40 SP08 baseline).

## Example use case

The load program adds the operations to the task list created from ZEMX_C_TaskListMig.

## Open verification items

none
