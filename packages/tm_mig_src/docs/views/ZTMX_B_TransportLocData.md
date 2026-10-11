# ZTMX_B_TransportLocData

> Status: **draft-unverified** · tested release: none (native DDIC and SAP activation pending). Nothing below has been activated on a system.

| | |
|---|---|
| Description | TransportLocData |
| Module | `transport_location` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `/sapapo/loc` |
| Source file | `src/ztmx_b_transportlocdata.ddls.asddls` |

## Purpose

Read TransportLocData as source candidates; approve the key-date population before posting.

## Keys

- `LocationUUID`

## Associations defined here

- none

## Access control

No DCL by design: Read-only native migration extraction without DCL. Restrict the CDS extraction channel to authorized migration users; native table display authorization alone does not protect every CDS consumer. Verify business authorization and current-client isolation on SAP.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.

## Open verification items

`TMX-001` - see `BATCH_REPORT.md`.
