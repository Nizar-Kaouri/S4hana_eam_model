# ZCOX_B_CostElementData

> Version **1.0.0**

| | |
|---|---|
| Description | CostElementData |
| Module | `cost_element` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `cska` |
| Source file | `src/zcox_b_costelementdata.ddls.asddls` |

## Purpose

Read CostElementData as source records; approve the key-date population before posting.

## Keys

- `ChartOfAccounts`
- `CostElement`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
