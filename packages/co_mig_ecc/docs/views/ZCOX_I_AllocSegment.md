# ZCOX_I_AllocSegment

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | AllocSegment |
| Module | `allocation_cycle` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZCOX_I_AllocSegmentData` |
| Source file | `src/zcox_i_allocsegment.ddls.asddls` |

## Purpose

Read AllocSegment as source candidates; approve the key-date population before posting.

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

## Open verification items

none
