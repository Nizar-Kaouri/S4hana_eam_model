# ZEMX_R_TaskListLatestVersion

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Task list latest version (helper) |
| Module | `task_list` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_I_TaskList` |
| Source file | `src/zemx_r_tasklistlatestversion.ddls.asddls` |

## Purpose

Highest version counter per task list group and group counter (helper for the current task list).

## Keys

- `TaskListType`
- `TaskListGroup`
- `TaskListGroupCounter`

## Associations defined here

- none

## Access control

No DCL by design: Migration extraction/reconciliation view on ECC: it must return every record of the object. Access is controlled by the extraction channel (ODP/RFC user, S_TABU_NAM / S_TABU_DIS), not by CDS access control (decision XGEN-D01).

## Example use case

Read the current version of task list group 4711 / counter 1.

## Open verification items

none
