# ZEMX_I_FuncTaskListAsgmt

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

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

- `plnty`
- `plnnr`
- `plnal`
- `tplnr`
- `zkriz`
- `zaehl`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Find the task lists of equipment 10000001.

## Open verification items

`XTL-A02` - see `BATCH_REPORT.md`.
