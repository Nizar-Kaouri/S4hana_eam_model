# ZCOX_I_ProfitCenterTe

> Version **1.0.0**

| | |
|---|---|
| Description | ProfitCenterTe |
| Module | `profit_center` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZCOX_B_ProfitCenterTeData` |
| Source file | `src/zcox_i_profitcenterte.ddls.asddls` |

## Purpose

Read ProfitCenterTe as source records; approve the key-date population before posting.

## Keys

- `Language`
- `ProfitCenter`
- `ValidityEndDate`
- `ControllingArea`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
