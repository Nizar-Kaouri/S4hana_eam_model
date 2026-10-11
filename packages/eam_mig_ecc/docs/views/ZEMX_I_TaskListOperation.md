# ZEMX_I_TaskListOperation

> Version **1.0.0**

| | |
|---|---|
| Description | Task list operation |
| Module | `task_list` |
| Batch | 2 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | #DIMENSION |
| Data source | `ZEMX_I_TaskListOpAssignment`, join `ZEMX_I_TaskListOpDetail`, join `ZEMX_I_TaskListAsgLatest`, join `ZEMX_I_TaskListOpLatest` |
| Source file | `src/zemx_i_tasklistoperation.ddls.asddls` |

## Purpose

Operations of maintenance task lists (sequence assignment joined with operation detail) with the work center as business key.

## Keys

- `TaskListType`
- `TaskListGroup`
- `TaskListGroupCounter`
- `TaskListSequence`
- `TaskListOperationInternalId`
- `TaskListOpAssgmtVersion`
- `TaskListOpVersionCounter`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Read the operations of task list group 4711, counter 01.
