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

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Join the counter back to its own table wrapper before applying deletion scope.

## Open verification items

none
