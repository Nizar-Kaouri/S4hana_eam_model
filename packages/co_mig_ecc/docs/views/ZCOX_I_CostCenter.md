# ZCOX_I_CostCenter

> Version **1.0.0**

| | |
|---|---|
| Description | CostCenter |
| Module | `cost_center` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZCOX_I_CostCenterData` |
| Source file | `src/zcox_i_costcenter.ddls.asddls` |

## Purpose

Read CostCenter as source records; approve the key-date population before posting.

## Keys

- `ControllingArea`
- `CostCenter`
- `ValidityEndDate`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
