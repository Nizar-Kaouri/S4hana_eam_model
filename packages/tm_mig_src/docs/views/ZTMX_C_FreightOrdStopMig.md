# ZTMX_C_FreightOrdStopMig

> Status: **draft-unverified** · tested release: none (native DDIC and SAP activation pending). Nothing below has been activated on a system.

| | |
|---|---|
| Description | FreightOrdStopMig |
| Module | `freight_order` |
| Batch | 1 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZTMX_I_FreightOrdStop` |
| Source file | `src/ztmx_c_freightordstopmig.ddls.asddls` |

## Purpose

Read FreightOrdStopMig as source candidates; approve the key-date population before posting.

## Keys

- `StopUUID`

## Associations defined here

- none

## Access control

No DCL by design: Read-only native extraction without DCL. Restrict and test authorized CDS extraction channels and current-client isolation. Table display authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.

## Open verification items

none
