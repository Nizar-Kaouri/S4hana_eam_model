# ZEMX_I_TaskListOpAssignment

> Version **1.0.0**

| | |
|---|---|
| Description | Task list operation assignment |
| Module | `task_list` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #DIMENSION |
| Data source | `plas` |
| Source file | `src/zemx_i_tasklistopassignment.ddls.asddls` |

## Purpose

Assignment of operations to task list sequences (PLAS) for maintenance task lists.

## Keys

- `TaskListType`
- `TaskListGroup`
- `TaskListGroupCounter`
- `TaskListSequence`
- `TaskListOperationInternalId`
- `TaskListOpAssgmtVersion`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Read the operation nodes of task list group 4711, group counter 01.
