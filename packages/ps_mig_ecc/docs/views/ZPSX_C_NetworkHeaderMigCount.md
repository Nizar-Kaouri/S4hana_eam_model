# ZPSX_C_NetworkHeaderMigCount

> Version **1.0.0**

| | |
|---|---|
| Description | NetworkHeaderMigCount |
| Module | `network` |
| Batch | 1 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZPSX_C_NetworkHeaderMig` |
| Source file | `src/zpsx_c_networkheadermigcount.ddls.asddls` |

## Purpose

Read NetworkHeaderMigCount as source records; approve the key-date population before posting.

## Keys

- `Network`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
