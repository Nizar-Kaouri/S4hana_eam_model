# ZCOX_C_CostCenterTextMig

> Version **1.0.0**

| | |
|---|---|
| Description | CostCenterTextMig |
| Module | `cost_center` |
| Batch | 1 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZCOX_I_CostCenterText` |
| Source file | `src/zcox_c_costcentertextmig.ddls.asddls` |

## Purpose

Read CostCenterTextMig as source records; approve the key-date population before posting.

## Keys

- `Language`
- `ControllingArea`
- `CostCenter`
- `ValidityEndDate`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
