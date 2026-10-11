# ZPST_I_WBSCompare

> Version **1.0.0**

| | |
|---|---|
| Description | WBSCompare |
| Module | `wbs_element` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `I_WBSElement` |
| Source file | `src/zpst_i_wbscompare.ddls.asddls` |

## Purpose

Read WBSCompare as target comparison records.

## Keys

- `WBSElementInternalID`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
