# ZEMX_I_TaskListPRTData

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | TaskListPRT source data |
| Module | `task_list` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `plfh` |
| Source file | `src/zemx_i_tasklistprtdata.ddls.asddls` |

## Purpose

TaskListPRT source data

## Keys

- `plnty`
- `plnnr`
- `plnal`
- `plnkn`
- `zaehl`
- `psnfh`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Export the selected migration scope; validate keys and row counts before loading.

## Open verification items

`XADD-5` - see `BATCH_REPORT.md`.
