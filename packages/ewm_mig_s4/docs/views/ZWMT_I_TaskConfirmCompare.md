# ZWMT_I_TaskConfirmCompare

> Status: **draft-unverified** · tested release: none (native DDIC and SAP activation pending). Nothing below has been activated on a system.

| | |
|---|---|
| Description | TaskConfirmCompare |
| Module | `warehouse_task` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `/scwm/ordim_c` |
| Source file | `src/zwmt_i_taskconfirmcompare.ddls.asddls` |

## Purpose

Read TaskConfirmCompare as target comparison candidates.

## Keys

- `Warehouse`
- `WarehouseTask`
- `WarehouseTaskItem`

## Associations defined here

- none

## Access control

No DCL by design: Read-only native migration extraction without DCL. Restrict the CDS extraction channel to authorized migration users; native table display authorization alone does not protect every CDS consumer. Verify business authorization and current-client isolation on SAP.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.

## Open verification items

`WMT-010` - see `BATCH_REPORT.md`.
