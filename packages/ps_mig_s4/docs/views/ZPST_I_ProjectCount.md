# ZPST_I_ProjectCount

> Version **1.0.0**

| | |
|---|---|
| Description | ProjectCount |
| Module | `project` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | - |
| Data source | `ZPST_I_ProjectCompare` |
| Source file | `src/zpst_i_projectcount.ddls.asddls` |

## Purpose

Read ProjectCount as target comparison records.

## Keys

- `ProjectInternalID`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
