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
| Data source | `ZEMX_I_TaskListObjectAssgmt` |
| Source file | `src/zemx_c_tasklistallocationmig.ddls.asddls` |

## Purpose

Equipment / functional location allocation of the task lists in scope.

## Keys

- `TaskListType`
- `TaskListGroup`
- `TaskListGroupCounter`
- `Equipment`
- `FunctionalLocation`
- `AdditionalCriteriaCounter`
- `AssignmentCounter`

## Associations defined here

- `_TaskListCurrent` → `ZEMX_I_TaskListCurrent` [0..1]

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

The load program assigns each equipment task list to its equipment.

## Open verification items

none
