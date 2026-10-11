# ZEMX_I_FuncTaskListAsgmt

> Version **1.0.0**

| | |
|---|---|
| Description | Task list assignment change states |
| Module | `task_list` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #DIMENSION |
| Data source | `tapl` |
| Source file | `src/zemx_i_functasklistasgmt.ddls.asddls` |

## Purpose

Task-list object allocation change states; customer resolves validity at cutover.

## Keys

- `TaskListType`
- `TaskListGroup`
- `TaskListGroupCounter`
- `FunctionalLocation`
- `AdditionalCriteriaCounter`
- `AssignmentCounter`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Find the task lists of equipment 10000001.
