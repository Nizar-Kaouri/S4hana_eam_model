# ZEMX_I_TaskListOperation

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Task list operation (migration extract) |
| Module | `task_list` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #DIMENSION |
| Data source | `plas`, join `plpo`, join `crhd` |
| Source file | `src/zemx_i_tasklistoperation.ddls.asddls` |

## Purpose

Operations of maintenance task lists (sequence assignment PLAS joined with operation PLPO) with work center, control key, work and duration.

## Keys

- `plnty`
- `plnnr`
- `plnal`
- `plnfl`
- `plnkn`
- `zaehl`
- `zaehl`

## Associations defined here

- none

## Access control

No DCL by design: Migration extraction/reconciliation view on ECC: it must return every record of the object. Access is controlled by the extraction channel (ODP/RFC user, S_TABU_NAM / S_TABU_DIS), not by CDS access control (decision XGEN-D01).

## Example use case

Extract the operations of the task lists in scope: join on TaskListType / TaskListGroup / TaskListGroupCounter with ZEMX_R_TaskListCurrent.

## Open verification items

`XTL-004`, `XTL-006` - see `BATCH_REPORT.md`.
