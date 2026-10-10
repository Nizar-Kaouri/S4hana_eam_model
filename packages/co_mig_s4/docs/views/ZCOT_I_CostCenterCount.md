# ZCOT_I_CostCenterCount

> Status: **draft-unverified** · tested release: none (draft, S/4HANA 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | CostCenterCount |
| Module | `cost_center` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | - |
| Data source | `ZCOT_I_CostCenterCompare` |
| Source file | `src/zcot_i_costcentercount.ddls.asddls` |

## Purpose

Read CostCenterCount as target comparison candidates.

## Keys

- `ControllingArea`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.

## Open verification items

none
