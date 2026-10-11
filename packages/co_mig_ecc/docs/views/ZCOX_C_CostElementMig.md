# ZCOX_C_CostElementMig

> Version **1.0.0**

| | |
|---|---|
| Description | CostElementMig |
| Module | `cost_element` |
| Batch | 1 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZCOX_I_CostElement` |
| Source file | `src/zcox_c_costelementmig.ddls.asddls` |

## Purpose

Read CostElementMig as source records; approve the key-date population before posting.

## Keys

- `ChartOfAccounts`
- `CostElement`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
