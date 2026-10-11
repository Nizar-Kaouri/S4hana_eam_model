# ZWMX_B_WhDeliveryItemData

> Status: **draft-unverified** · tested release: none (native DDIC and SAP activation pending). Nothing below has been activated on a system.

| | |
|---|---|
| Description | WhDeliveryItemData |
| Module | `warehouse_delivery` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `/scdl/db_proci_i` |
| Source file | `src/zwmx_b_whdeliveryitemdata.ddls.asddls` |

## Purpose

Read WhDeliveryItemData as source candidates; approve the key-date population before posting.

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

`WMX-013` - see `BATCH_REPORT.md`.
