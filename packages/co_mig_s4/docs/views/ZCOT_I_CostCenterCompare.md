# ZCOT_I_CostCenterCompare

> Version **1.0.0**

| | |
|---|---|
| Description | CostCenterCompare |
| Module | `cost_center` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `I_CostCenter` |
| Source file | `src/zcot_i_costcentercompare.ddls.asddls` |

## Purpose

Read CostCenterCompare as target comparison records.

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
