# ZPPX_C_ConfirmationMig

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | ConfirmationMig |
| Module | `production_confirmation` |
| Batch | 1 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZPPX_I_Confirmation` |
| Source file | `src/zppx_c_confirmationmig.ddls.asddls` |

## Purpose

Read ConfirmationMig as source candidates; approve the key-date population before posting.

## Keys

- `ConfirmationNumber`
- `ConfirmationCounter`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.

## Open verification items

none
