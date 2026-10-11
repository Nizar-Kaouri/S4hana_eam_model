# ZEMX_I_TaskListLatestVersion

> Version **1.0.0**

| | |
|---|---|
| Description | Task list latest version |
| Module | `task_list` |
| Batch | 2 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_B_TaskListHeader` |
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

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Read the current version of task list group 4711 / counter 01.
