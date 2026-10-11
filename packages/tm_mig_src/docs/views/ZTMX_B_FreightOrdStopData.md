# ZTMX_B_FreightOrdStopData

> Status: **draft-unverified** · tested release: none (native DDIC and SAP activation pending). Nothing below has been activated on a system.

| | |
|---|---|
| Description | FreightOrdStopData |
| Module | `freight_order` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `/scmtms/d_torstp` |
| Source file | `src/ztmx_b_freightordstopdata.ddls.asddls` |

## Purpose

Read FreightOrdStopData as source candidates; approve the key-date population before posting.

## Keys

- `StopUUID`

## Associations defined here

- none

## Access control

No DCL by design: Read-only native extraction without DCL. Restrict and test authorized CDS extraction channels and current-client isolation. Table display authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.

## Open verification items

`TMX-016` - see `BATCH_REPORT.md`.
