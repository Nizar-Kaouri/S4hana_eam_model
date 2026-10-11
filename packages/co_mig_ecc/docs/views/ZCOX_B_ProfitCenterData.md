# ZCOX_B_ProfitCenterData

> Version **1.0.0**

| | |
|---|---|
| Description | ProfitCenterData |
| Module | `profit_center` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `cepc` |
| Source file | `src/zcox_b_profitcenterdata.ddls.asddls` |

## Purpose

Read ProfitCenterData as source records; approve the key-date population before posting.

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
