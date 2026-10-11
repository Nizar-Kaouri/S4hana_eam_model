# ZWMT_I_WhDeliveryCompare

> Status: **draft-unverified** · tested release: none (native DDIC and SAP activation pending). Nothing below has been activated on a system.

| | |
|---|---|
| Description | WhDeliveryCompare |
| Module | `warehouse_delivery` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `/scdl/db_proch_i` |
| Source file | `src/zwmt_i_whdeliverycompare.ddls.asddls` |

## Purpose

Read WhDeliveryCompare as target comparison candidates.

## Keys

- `DeliveryUUID`

## Associations defined here

- none

## Access control

No DCL by design: Read-only native extraction without DCL. Restrict and test authorized CDS extraction channels and current-client isolation. Table display authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.

## Open verification items

`WMT-012` - see `BATCH_REPORT.md`.
