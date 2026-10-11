# ZQMX_I_UsageDecisionData

> Version **1.0.0**

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

Read UsageDecisionData as source records; approve the key-date population before posting.

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
