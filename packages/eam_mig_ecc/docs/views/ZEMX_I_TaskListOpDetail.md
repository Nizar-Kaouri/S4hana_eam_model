# ZEMX_I_TaskListOpDetail

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Task list operation detail |
| Module | `task_list` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #DIMENSION |
| Data source | `plpo` |
| Source file | `src/zemx_i_tasklistopdetail.ddls.asddls` |

## Purpose

Operation details of task lists (PLPO): operation number, control key, work center, work, duration.

## Keys

- `plnty`
- `plnnr`
- `plnkn`
- `zaehl`

## Associations defined here

- `_WorkCenter` → `ZEMX_I_WorkCenterHeader` [0..1]

## Access control

No DCL by design: Migration view on ECC: it must return every record of the object. Access is controlled by the user / RFC user of the load program and the extraction channel (S_TABU_NAM), not by CDS access control (decision XGEN-D01; CDS access control also needs a newer release than the 7.40 SP08 baseline).

## Example use case

Read the operations of task list group 4711.

## Open verification items

`XTL-006` - see `BATCH_REPORT.md`.
