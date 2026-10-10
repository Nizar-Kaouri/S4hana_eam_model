# ZEMX_R_TaskListCurrent

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Current maintenance task list (migration scope) |
| Module | `task_list` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | #DIMENSION |
| Data source | `ZEMX_I_TaskList`, join `ZEMX_R_TaskListLatestVersion` |
| Source file | `src/zemx_r_tasklistcurrent.ddls.asddls` |

## Purpose

Current, not deleted version of each maintenance task list header: the migration scope of the task list object.

## Keys

- `TaskListType`
- `TaskListGroup`
- `TaskListGroupCounter`

## Associations defined here

- none

## Access control

No DCL by design: Migration extraction/reconciliation view on ECC: it must return every record of the object. Access is controlled by the extraction channel (ODP/RFC user, S_TABU_NAM / S_TABU_DIS), not by CDS access control (decision XGEN-D01).

## Example use case

Extract all rows of plant 1000: filter Plant = '1000'.

## Open verification items

none
