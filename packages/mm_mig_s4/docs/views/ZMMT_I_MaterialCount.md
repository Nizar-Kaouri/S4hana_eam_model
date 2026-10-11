# ZMMT_I_MaterialCount

> Version **1.0.0**

| | |
|---|---|
| Description | MaterialCount |
| Module | `product` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | - |
| Data source | `ZMMT_B_MaterialCompare` |
| Source file | `src/zmmt_i_materialcount.ddls.asddls` |

## Purpose

Read MaterialCount as target comparison records.

## Keys

- `Product`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
