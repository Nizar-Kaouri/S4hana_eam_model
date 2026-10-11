# ZTMT_B_FreightOrdStopCompare

> Status: **draft-unverified** · tested release: none (native DDIC and SAP activation pending). Nothing below has been activated on a system.

| | |
|---|---|
| Description | FreightOrdStopCompare |
| Module | `freight_order` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `/scmtms/d_torstp`, join `ZTMT_B_FreightOrderCompare` |
| Source file | `src/ztmt_b_freightordstopcompare.ddls.asddls` |

## Purpose

Read FreightOrdStopCompare as target comparison candidates.

## Keys

- `StopUUID`

## Associations defined here

- none

## Access control

No DCL by design: Read-only native extraction without DCL. Restrict and test authorized CDS extraction channels and current-client isolation. Table display authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.

## Open verification items

`TMT-016` - see `BATCH_REPORT.md`.
