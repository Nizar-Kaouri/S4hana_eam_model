# ZTMT_B_FreightUnitItemCompare

> Status: **draft-unverified** · tested release: none (native DDIC and SAP activation pending). Nothing below has been activated on a system.

| | |
|---|---|
| Description | FreightUnitItemCompare |
| Module | `freight_unit` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `/scmtms/d_torite`, join `ZTMT_B_FreightUnitCompare` |
| Source file | `src/ztmt_b_freightunititemcompare.ddls.asddls` |

## Purpose

Read FreightUnitItemCompare as target comparison candidates.

## Keys

- `ItemUUID`

## Associations defined here

- none

## Access control

No DCL by design: Read-only native extraction without DCL. Restrict and test authorized CDS extraction channels and current-client isolation. Table display authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.

## Open verification items

`TMT-012` - see `BATCH_REPORT.md`.
