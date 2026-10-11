# ZPST_B_ProjectCompare

> Version **1.0.0**

| | |
|---|---|
| Description | ProjectCompare |
| Module | `project` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `I_EnterpriseProject` |
| Source file | `src/zpst_b_projectcompare.ddls.asddls` |

## Purpose

Read ProjectCompare as target comparison records.

## Keys

- `ProjectInternalID`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
