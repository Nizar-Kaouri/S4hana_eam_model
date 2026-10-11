# ZCOX_C_CostActualMigCount

> Version **1.0.0**

| | |
|---|---|
| Description | CostActualMigCount |
| Module | `cost_actuals` |
| Batch | 1 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZCOX_C_CostActualMig` |
| Source file | `src/zcox_c_costactualmigcount.ddls.asddls` |

## Purpose

Read CostActualMigCount as source records; approve the key-date population before posting.

## Keys

- `ControllingArea`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
