# ZQMX_I_InspectPlanSel

> Version **1.0.0**

| | |
|---|---|
| Description | InspectPlanSel |
| Module | `inspection_plan` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZQMX_I_InspectPlanSelData` |
| Source file | `src/zqmx_i_inspectplansel.ddls.asddls` |

## Purpose

Read InspectPlanSel as source records; approve the key-date population before posting.

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
