# ZMMT_B_MaterialCompare

> Version **1.0.0**

| | |
|---|---|
| Description | MaterialCompare |
| Module | `product` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `I_Product` |
| Source file | `src/zmmt_b_materialcompare.ddls.asddls` |

## Purpose

Read MaterialCompare as target comparison records.

## Keys

- `Product`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
