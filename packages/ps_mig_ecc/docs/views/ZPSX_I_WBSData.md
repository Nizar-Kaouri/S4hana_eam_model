# ZPSX_I_WBSData

> Version **1.0.0**

| | |
|---|---|
| Description | WBSData |
| Module | `wbs_element` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `prps` |
| Source file | `src/zpsx_i_wbsdata.ddls.asddls` |

## Purpose

Read WBSData as source records; approve the key-date population before posting.

## Keys

- `WBSElementInternalID`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
