# ZWMT_I_TaskConfirmCount

> Status: **draft-unverified** · tested release: none (native DDIC and SAP activation pending). Nothing below has been activated on a system.

| | |
|---|---|
| Description | TaskConfirmCount |
| Module | `warehouse_task` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | - |
| Data source | `ZWMT_I_TaskConfirmCompare` |
| Source file | `src/zwmt_i_taskconfirmcount.ddls.asddls` |

## Purpose

Read TaskConfirmCount as target comparison candidates.

## Keys

- `Warehouse`

## Associations defined here

- none

## Access control

No DCL by design: Read-only native migration extraction without DCL. Restrict the CDS extraction channel to authorized migration users; native table display authorization alone does not protect every CDS consumer. Verify business authorization and current-client isolation on SAP.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.

## Open verification items

none
