# ZQMX_C_InspectPlanHeaMig

> Version **1.0.0**

| | |
|---|---|
| Description | InspectPlanHeaMig |
| Module | `inspection_plan` |
| Batch | 1 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZQMX_I_InspectPlanHea` |
| Source file | `src/zqmx_c_inspectplanheamig.ddls.asddls` |

## Purpose

Read InspectPlanHeaMig as source records; approve the key-date population before posting.

## Keys

- `TaskListType`
- `TaskListGroup`
- `TaskListGroupCounter`
- `InternalCounter`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
