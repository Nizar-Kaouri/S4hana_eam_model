# ZEMX_C_TaskListMigCount

> Version **1.0.0**

| | |
|---|---|
| Description | Task list count (migration) |
| Module | `task_list` |
| Batch | 2 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_C_TaskListMig` |
| Source file | `src/zemx_c_tasklistmigcount.ddls.asddls` |

## Purpose

Record count of the task lists delivered by ZEMX_C_TaskListMig per TaskListType, Plant.

## Keys

- `TaskListType`
- `Plant`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Export this source count view to record the selected extraction population by its dimensions.
