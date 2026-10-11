# ZQMX_I_InspectPlanHeaData

> Version **1.0.0**

| | |
|---|---|
| Description | InspectPlanHeaData |
| Module | `inspection_plan` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `plko` |
| Source file | `src/zqmx_i_inspectplanheadata.ddls.asddls` |

## Purpose

Read InspectPlanHeaData as source records; approve the key-date population before posting.

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
