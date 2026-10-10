# ZEAM_I_MaintItemWithTaskList

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Maintenance Item with Task List |
| Module | link: `maintenance_plan` + `task_list` |
| Batch | 3 |
| Layer | link (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `ZEAM_I_MaintItem` |
| Source file | `src/zeam_i_maintitemwithtasklist.ddls.asddls` |

## Purpose

Maintenance item with an association to the task list (all change versions) it uses.

## Keys

- `MaintenanceItem`

## Associations defined here

- `_TaskList` → `ZEAM_I_TaskList` [0..*]

## Access control

Role inherits the conditions of `ZEAM_I_MaintItem`.

## Example use case

Show task list description and status next to each maintenance item.

## Open verification items

`TL-004` - see `BATCH_REPORT.md`.
