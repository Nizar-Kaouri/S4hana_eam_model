# ZEMX_I_TaskListObjectAssgmt

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Task list object assignment |
| Module | `task_list` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #DIMENSION |
| Data source | `eapl` |
| Source file | `src/zemx_i_tasklistobjectassgmt.ddls.asddls` |

## Purpose

Assignment of equipment task lists (type E) to equipment and of functional location task lists (type T) to functional locations (EAPL).

## Keys

- `plnty`
- `plnnr`
- `plnal`

## Associations defined here

- none

## Access control

No DCL by design: Migration view on ECC: it must return every record of the object. Access is controlled by the user / RFC user of the load program and the extraction channel (S_TABU_NAM), not by CDS access control (decision XGEN-D01; CDS access control also needs a newer release than the 7.40 SP08 baseline).

## Example use case

Find the task lists of equipment 10000001.

## Open verification items

`XTL-005` - see `BATCH_REPORT.md`.
