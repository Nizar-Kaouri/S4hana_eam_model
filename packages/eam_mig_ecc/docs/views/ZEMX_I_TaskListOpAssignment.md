# ZEMX_I_TaskListOpAssignment

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Task list operation assignment |
| Module | `task_list` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #DIMENSION |
| Data source | `plas` |
| Source file | `src/zemx_i_tasklistopassignment.ddls.asddls` |

## Purpose

Assignment of operations to task list sequences (PLAS) for maintenance task lists.

## Keys

- `plnty`
- `plnnr`
- `plnal`
- `plnfl`
- `plnkn`
- `zaehl`

## Associations defined here

- none

## Access control

No DCL by design: Migration view on ECC: it must return every record of the object. Access is controlled by the user / RFC user of the load program and the extraction channel (S_TABU_NAM), not by CDS access control (decision XGEN-D01; CDS access control also needs a newer release than the 7.40 SP08 baseline).

## Example use case

Read the operation nodes of task list group 4711, group counter 01.

## Open verification items

`XTL-004` - see `BATCH_REPORT.md`.
