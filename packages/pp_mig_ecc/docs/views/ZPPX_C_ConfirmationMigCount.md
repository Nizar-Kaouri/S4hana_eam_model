# ZPPX_C_ConfirmationMigCount

> Version **1.0.0**

| | |
|---|---|
| Description | ConfirmationMigCount |
| Module | `production_confirmation` |
| Batch | 1 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZPPX_C_ConfirmationMig` |
| Source file | `src/zppx_c_confirmationmigcount.ddls.asddls` |

## Purpose

Read ConfirmationMigCount as source records; approve the key-date population before posting.

## Keys

- `ConfirmationNumber`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
