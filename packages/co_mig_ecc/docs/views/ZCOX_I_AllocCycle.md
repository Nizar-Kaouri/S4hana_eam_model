# ZCOX_I_AllocCycle

> Version **1.0.0**

| | |
|---|---|
| Description | AllocCycle |
| Module | `allocation_cycle` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZCOX_I_AllocCycleData` |
| Source file | `src/zcox_i_alloccycle.ddls.asddls` |

## Purpose

Read AllocCycle as source records; approve the key-date population before posting.

## Keys

- `AllocationTable`
- `AllocationCycle`
- `ValidityStartDate`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
