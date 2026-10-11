# ZQMX_B_InspectPlanSelData

> Version **1.0.0**

| | |
|---|---|
| Description | InspectPlanSelData |
| Module | `inspection_plan` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `plas` |
| Source file | `src/zqmx_b_inspectplanseldata.ddls.asddls` |

## Purpose

Read InspectPlanSelData as source records; approve the key-date population before posting.

## Keys

- `TaskListType`
- `TaskListGroup`
- `TaskListGroupCounter`
- `Sequence`
- `TaskListNode`
- `InternalCounter`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
