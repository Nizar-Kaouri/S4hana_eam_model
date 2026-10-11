# ZCOX_B_CostCenterTextData

> Version **1.0.0**

| | |
|---|---|
| Description | CostCenterTextData |
| Module | `cost_center` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `cskt` |
| Source file | `src/zcox_b_costcentertextdata.ddls.asddls` |

## Purpose

Read CostCenterTextData as source records; approve the key-date population before posting.

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
