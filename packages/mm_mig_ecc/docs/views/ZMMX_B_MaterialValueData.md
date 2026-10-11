# ZMMX_B_MaterialValueData

> Version **1.0.0**

| | |
|---|---|
| Description | MaterialValueData |
| Module | `product` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `mbew` |
| Source file | `src/zmmx_b_materialvaluedata.ddls.asddls` |

## Purpose

Read MaterialValueData as source records; approve the key-date population before posting.

## Keys

- `Product`
- `ValuationArea`
- `ValuationType`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
