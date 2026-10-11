# ZPST_I_WBSCount

> Version **1.0.0**

| | |
|---|---|
| Description | WBSCount |
| Module | `wbs_element` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | - |
| Data source | `ZPST_B_WBSCompare` |
| Source file | `src/zpst_i_wbscount.ddls.asddls` |

## Purpose

Read WBSCount as target comparison records.

## Keys

- `WBSElementInternalID`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
