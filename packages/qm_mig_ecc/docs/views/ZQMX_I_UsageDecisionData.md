# ZQMX_I_UsageDecisionData

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | UsageDecisionData |
| Module | `inspection_lot` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `qave` |
| Source file | `src/zqmx_i_usagedecisiondata.ddls.asddls` |

## Purpose

Read UsageDecisionData as source candidates; approve the key-date population before posting.

## Keys

- `InspectionLot`
- `UsageDecisionType`
- `UsageDecisionCounter`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.

## Open verification items

`QMX-002` - see `BATCH_REPORT.md`.
