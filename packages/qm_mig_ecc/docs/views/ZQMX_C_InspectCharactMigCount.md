# ZQMX_C_InspectCharactMigCount

> Version **1.0.0**

| | |
|---|---|
| Description | InspectCharactMigCount |
| Module | `inspection_result` |
| Batch | 1 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZQMX_C_InspectCharactMig` |
| Source file | `src/zqmx_c_inspectcharactmigcount.ddls.asddls` |

## Purpose

Read InspectCharactMigCount as source records; approve the key-date population before posting.

## Keys

- `InspectionLot`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
