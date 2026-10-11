# ZWMT_I_WhDeliveryItemCompare

> Status: **draft-unverified** · tested release: none (native DDIC and SAP activation pending). Nothing below has been activated on a system.

| | |
|---|---|
| Description | WhDeliveryItemCompare |
| Module | `warehouse_delivery` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `/scdl/db_proci_i` |
| Source file | `src/zwmt_i_whdeliveryitemcompare.ddls.asddls` |

## Purpose

Read WhDeliveryItemCompare as target comparison candidates.

## Keys

- `DeliveryUUID`
- `DeliveryItemUUID`

## Associations defined here

- none

## Access control

No DCL by design: Read-only native extraction without DCL. Restrict and test authorized CDS extraction channels and current-client isolation. Table display authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.

## Open verification items

`WMT-013` - see `BATCH_REPORT.md`.
