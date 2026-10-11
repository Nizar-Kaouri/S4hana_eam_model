# ZCOT_I_InternalOrderCount

> Version **1.0.0**

| | |
|---|---|
| Description | InternalOrderCount |
| Module | `internal_order` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | - |
| Data source | `ZCOT_I_InternalOrderCompare` |
| Source file | `src/zcot_i_internalordercount.ddls.asddls` |

## Purpose

Read InternalOrderCount as target comparison records.

## Keys

- `InternalOrder`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
