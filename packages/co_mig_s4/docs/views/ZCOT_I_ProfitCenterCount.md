# ZCOT_I_ProfitCenterCount

> Version **1.0.0**

| | |
|---|---|
| Description | ProfitCenterCount |
| Module | `profit_center` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | - |
| Data source | `ZCOT_B_ProfitCenterCompare` |
| Source file | `src/zcot_i_profitcentercount.ddls.asddls` |

## Purpose

Read ProfitCenterCount as target comparison records.

## Keys

- `ProfitCenter`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
