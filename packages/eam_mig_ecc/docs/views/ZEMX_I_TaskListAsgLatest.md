# ZEMX_I_TaskListAsgLatest

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Latest recorded task list operation state |
| Module | `task_list` |
| Batch | 2 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_I_TaskListOpAssignment` |
| Source file | `src/zemx_i_tasklistasglatest.ddls.asddls` |

## Purpose

Latest recorded operation state, including deletion states; cutover effectivity still requires verification.

## Keys

- `TaskListType`
- `TaskListGroup`
- `TaskListGroupCounter`
- `TaskListSequence`
- `TaskListOperationInternalId`

## Associations defined here

- none

## Access control

No DCL by design: Migration view on ECC: it must return every record of the object. Access is controlled by the user / RFC user of the load program and the extraction channel (S_TABU_NAM), not by CDS access control (decision XGEN-D01; CDS access control also needs a newer release than the 7.40 SP08 baseline).

## Example use case

Join the counter back to its own table wrapper before applying deletion scope.

## Open verification items

none
