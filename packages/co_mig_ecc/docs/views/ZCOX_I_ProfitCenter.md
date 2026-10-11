# ZCOX_I_ProfitCenter

> Version **1.0.0**

| | |
|---|---|
| Description | ProfitCenter |
| Module | `profit_center` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZCOX_I_ProfitCenterData` |
| Source file | `src/zcox_i_profitcenter.ddls.asddls` |

## Purpose

Read ProfitCenter as source records; approve the key-date population before posting.

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
