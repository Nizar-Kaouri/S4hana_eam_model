# ZPPX_I_Confirmation

> Version **1.0.0**

| | |
|---|---|
| Description | Confirmation |
| Module | `production_confirmation` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZPPX_I_ConfirmationData` |
| Source file | `src/zppx_i_confirmation.ddls.asddls` |

## Purpose

Read Confirmation as source records; approve the key-date population before posting.

## Keys

- `ConfirmationNumber`
- `ConfirmationCounter`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
