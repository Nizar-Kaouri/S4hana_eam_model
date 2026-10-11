# ZPSX_C_WBSMigCount

> Version **1.0.0**

| | |
|---|---|
| Description | WBSMigCount |
| Module | `wbs_element` |
| Batch | 1 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZPSX_C_WBSMig` |
| Source file | `src/zpsx_c_wbsmigcount.ddls.asddls` |

## Purpose

Read WBSMigCount as source records; approve the key-date population before posting.

## Keys

- `WBSElementInternalID`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
