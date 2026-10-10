# ZEMX_I_TaskList

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Maintenance task list header (migration extract) |
| Module | `task_list` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #DIMENSION |
| Data source | `plko`, join `crhd` |
| Source file | `src/zemx_i_tasklist.ddls.asddls` |

## Purpose

All versions (change-number states) of maintenance task list headers of type A (general), E (equipment) and T (functional location).

## Keys

- `plnty`
- `plnnr`
- `plnal`
- `zaehl`

## Associations defined here

- none

## Access control

No DCL by design: Migration extraction/reconciliation view on ECC: it must return every record of the object. Access is controlled by the extraction channel (ODP/RFC user, S_TABU_NAM / S_TABU_DIS), not by CDS access control (decision XGEN-D01).

## Example use case

See every version of task list group 4711: filter TaskListGroup = '00004711'.

## Open verification items

`XTL-001`, `XTL-002`, `XTL-003` - see `BATCH_REPORT.md`.
