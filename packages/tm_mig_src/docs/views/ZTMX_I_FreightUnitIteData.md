# ZTMX_I_FreightUnitIteData

> Status: **draft-unverified** · tested release: none (native DDIC and SAP activation pending). Nothing below has been activated on a system.

| | |
|---|---|
| Description | FreightUnitIteData |
| Module | `freight_unit` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `/scmtms/d_torite` |
| Source file | `src/ztmx_i_freightunititedata.ddls.asddls` |

## Purpose

Read FreightUnitIteData as source candidates; approve the key-date population before posting.

## Keys

- `ItemUUID`

## Associations defined here

- none

## Access control

No DCL by design: Read-only native extraction without DCL. Restrict and test authorized CDS extraction channels and current-client isolation. Table display authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.

## Open verification items

`TMX-012` - see `BATCH_REPORT.md`.
