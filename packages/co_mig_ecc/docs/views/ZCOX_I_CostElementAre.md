# ZCOX_I_CostElementAre

> Version **1.0.0**

| | |
|---|---|
| Description | CostElementAre |
| Module | `cost_element` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZCOX_B_CostElementAreData` |
| Source file | `src/zcox_i_costelementare.ddls.asddls` |

## Purpose

Read CostElementAre as source records; approve the key-date population before posting.

## Keys

- `ControllingArea`
- `CostElement`
- `ValidityEndDate`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
