# ZTMT_I_FreightUnitStopCompare

> Status: **draft-unverified** · tested release: none (native DDIC and SAP activation pending). Nothing below has been activated on a system.

| | |
|---|---|
| Description | FreightUnitStopCompare |
| Module | `freight_unit` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `/scmtms/d_torstp`, join `ZTMT_I_FreightUnitCompare` |
| Source file | `src/ztmt_i_freightunitstopcompare.ddls.asddls` |

## Purpose

Read FreightUnitStopCompare as target comparison candidates.

## Keys

- `StopUUID`

## Associations defined here

- none

## Access control

No DCL by design: Read-only native extraction without DCL. Restrict and test authorized CDS extraction channels and current-client isolation. Table display authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.

## Open verification items

`TMT-013` - see `BATCH_REPORT.md`.
