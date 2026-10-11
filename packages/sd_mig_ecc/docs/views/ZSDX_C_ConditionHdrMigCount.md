# ZSDX_C_ConditionHdrMigCount

> Version **1.0.0**

| | |
|---|---|
| Description | ConditionHdrMigCount |
| Module | `pricing_condition` |
| Batch | 1 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZSDX_C_ConditionHdrMig` |
| Source file | `src/zsdx_c_conditionhdrmigcount.ddls.asddls` |

## Purpose

Read ConditionHdrMigCount as source records; approve the key-date population before posting.

## Keys

- `ConditionRecord`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
