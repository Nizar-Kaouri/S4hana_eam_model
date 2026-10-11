# ZCOT_I_ProfitCenterCompare

> Version **1.0.0**

| | |
|---|---|
| Description | ProfitCenterCompare |
| Module | `profit_center` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `I_ProfitCenter` |
| Source file | `src/zcot_i_profitcentercompare.ddls.asddls` |

## Purpose

Read ProfitCenterCompare as target comparison records.

## Keys

- `ProfitCenter`
- `ValidityEndDate`
- `ControllingArea`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
