# ZEMX_B_TaskListOpDetail

> Version **1.0.0**

| | |
|---|---|
| Description | Task list operation detail |
| Module | `task_list` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #DIMENSION |
| Data source | `plpo` |
| Source file | `src/zemx_b_tasklistopdetail.ddls.asddls` |

## Purpose

Operation details of task lists (PLPO): operation number, control key, work center, work, duration.

## Keys

- `TaskListType`
- `TaskListGroup`
- `TaskListOperationInternalId`
- `TaskListOpVersionCounter`

## Associations defined here

- `_WorkCenter` → `ZEMX_B_WorkCenterHeader` [0..1]

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Read the operations of task list group 4711.
