# ZPSX_I_WBSHierarchy

> Version **1.0.0**

| | |
|---|---|
| Description | WBSHierarchy |
| Module | `wbs_element` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZPSX_B_WBSHierarchyData` |
| Source file | `src/zpsx_i_wbshierarchy.ddls.asddls` |

## Purpose

Read WBSHierarchy as source records; approve the key-date population before posting.

## Keys

- `WBSElementInternalID`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
