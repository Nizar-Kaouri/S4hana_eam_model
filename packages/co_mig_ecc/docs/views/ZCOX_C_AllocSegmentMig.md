# ZCOX_C_AllocSegmentMig

> Version **1.0.0**

| | |
|---|---|
| Description | AllocSegmentMig |
| Module | `allocation_cycle` |
| Batch | 1 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZCOX_I_AllocSegment` |
| Source file | `src/zcox_c_allocsegmentmig.ddls.asddls` |

## Purpose

Read AllocSegmentMig as source records; approve the key-date population before posting.

## Keys

- `AllocationTable`
- `AllocationCycle`
- `ValidityStartDate`
- `SegmentSequence`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
