# ZCOX_B_AllocCycleData

> Version **1.0.0**

| | |
|---|---|
| Description | AllocCycleData |
| Module | `allocation_cycle` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `t811c` |
| Source file | `src/zcox_b_alloccycledata.ddls.asddls` |

## Purpose

Read AllocCycleData as source records; approve the key-date population before posting.

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
