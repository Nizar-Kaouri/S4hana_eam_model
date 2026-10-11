# ZCOX_I_CostCenterText

> Version **1.0.0**

| | |
|---|---|
| Description | CostCenterText |
| Module | `cost_center` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZCOX_B_CostCenterTextData` |
| Source file | `src/zcox_i_costcentertext.ddls.asddls` |

## Purpose

Read CostCenterText as source records; approve the key-date population before posting.

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
