# ZQMX_C_InspectPlanHeaMigCount

> Version **1.0.0**

| | |
|---|---|
| Description | InspectPlanHeaMigCount |
| Module | `inspection_plan` |
| Batch | 1 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZQMX_C_InspectPlanHeaMig` |
| Source file | `src/zqmx_c_inspectplanheamigcount.ddls.asddls` |

## Purpose

Read InspectPlanHeaMigCount as source records; approve the key-date population before posting.

## Keys

- `TaskListType`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
