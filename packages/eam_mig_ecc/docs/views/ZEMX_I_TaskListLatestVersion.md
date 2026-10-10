# ZEMX_I_TaskListLatestVersion

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Task list latest version |
| Module | `task_list` |
| Batch | 2 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_I_TaskListHeader` |
| Source file | `src/zemx_i_tasklistlatestversion.ddls.asddls` |

## Purpose

Highest version counter per task list group and group counter (helper for the current task list).

## Keys

- `TaskListType`
- `TaskListGroup`
- `TaskListGroupCounter`

## Associations defined here

- none

## Access control

No DCL by design: Migration view on ECC: it must return every record of the object. Access is controlled by the user / RFC user of the load program and the extraction channel (S_TABU_NAM), not by CDS access control (decision XGEN-D01; CDS access control also needs a newer release than the 7.40 SP08 baseline).

## Example use case

Read the current version of task list group 4711 / counter 01.

## Open verification items

none
