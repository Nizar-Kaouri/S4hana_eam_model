# ZCOX_C_InternalOrderMigCount

> Version **1.0.0**

| | |
|---|---|
| Description | InternalOrderMigCount |
| Module | `internal_order` |
| Batch | 1 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZCOX_C_InternalOrderMig` |
| Source file | `src/zcox_c_internalordermigcount.ddls.asddls` |

## Purpose

Read InternalOrderMigCount as source records; approve the key-date population before posting.

## Keys

- `InternalOrder`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
