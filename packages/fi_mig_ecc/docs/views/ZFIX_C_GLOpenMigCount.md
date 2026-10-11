# ZFIX_C_GLOpenMigCount

> Version **1.0.0**

| | |
|---|---|
| Description | GLOpenMigCount |
| Module | `open_items` |
| Batch | 1 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZFIX_C_GLOpenMig` |
| Source file | `src/zfix_c_glopenmigcount.ddls.asddls` |

## Purpose

Read GLOpenMigCount as source records; approve the key-date population before posting.

## Keys

- `CompanyCode`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
