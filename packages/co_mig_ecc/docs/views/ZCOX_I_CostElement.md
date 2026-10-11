# ZCOX_I_CostElement

> Version **1.0.0**

| | |
|---|---|
| Description | CostElement |
| Module | `cost_element` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZCOX_B_CostElementData` |
| Source file | `src/zcox_i_costelement.ddls.asddls` |

## Purpose

Read CostElement as source records; approve the key-date population before posting.

## Keys

- `ChartOfAccounts`
- `CostElement`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
