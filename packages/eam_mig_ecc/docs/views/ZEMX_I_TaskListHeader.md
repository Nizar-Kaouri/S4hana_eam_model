# ZEMX_I_TaskListHeader

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Task list header |
| Module | `task_list` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #DIMENSION |
| Data source | `plko` |
| Source file | `src/zemx_i_tasklistheader.ddls.asddls` |

## Purpose

All versions (change-number states) of maintenance task list headers of type A (general), E (equipment) and T (functional location).

## Keys

- `TaskListType`
- `TaskListGroup`
- `TaskListGroupCounter`
- `TaskListVersionCounter`

## Associations defined here

- `_MainWorkCenter` → `ZEMX_I_WorkCenterHeader` [0..1]

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

See every version of task list group 4711: filter TaskListGroup = '00004711'.

## Open verification items

`XTL-001`, `XTL-002`, `XTL-003` - see `BATCH_REPORT.md`.
