# ZEMX_I_TaskListCurrent

> Version **1.0.0**

| | |
|---|---|
| Description | Current maintenance task list |
| Module | `task_list` |
| Batch | 2 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | #DIMENSION |
| Data source | `ZEMX_I_TaskListHeader`, join `ZEMX_I_TaskListLatestVersion` |
| Source file | `src/zemx_i_tasklistcurrent.ddls.asddls` |

## Purpose

Current version of each maintenance task list header with the main work center as business key and the deletion flag.

## Keys

- `TaskListType`
- `TaskListGroup`
- `TaskListGroupCounter`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Read the current task lists of plant 1000.
