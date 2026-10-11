# ZQMX_I_InspectPlanHea

> Version **1.0.0**

| | |
|---|---|
| Description | InspectPlanHea |
| Module | `inspection_plan` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZQMX_B_InspectPlanHeaData` |
| Source file | `src/zqmx_i_inspectplanhea.ddls.asddls` |

## Purpose

Read InspectPlanHea as source records; approve the key-date population before posting.

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
