# ZEMX_I_TaskListAllocation

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Task list object allocation (migration extract) |
| Module | `task_list` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #DIMENSION |
| Data source | `eapl` |
| Source file | `src/zemx_i_tasklistallocation.ddls.asddls` |

## Purpose

Assignment of equipment task lists (type E) to equipment and of functional location task lists (type T) to functional locations.

## Keys

- `plnty`
- `plnnr`
- `plnal`

## Associations defined here

- none

## Access control

No DCL by design: Migration extraction/reconciliation view on ECC: it must return every record of the object. Access is controlled by the extraction channel (ODP/RFC user, S_TABU_NAM / S_TABU_DIS), not by CDS access control (decision XGEN-D01).

## Example use case

Find the task lists of equipment 10000001: filter Equipment = '000000000010000001'.

## Open verification items

`XTL-005` - see `BATCH_REPORT.md`.
