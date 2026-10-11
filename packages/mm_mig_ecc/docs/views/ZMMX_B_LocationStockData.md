# ZMMX_B_LocationStockData

> Version **1.0.0**

| | |
|---|---|
| Description | LocationStockData |
| Module | `material_stock` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `mard` |
| Source file | `src/zmmx_b_locationstockdata.ddls.asddls` |

## Purpose

Read LocationStockData as source records; approve the key-date population before posting.

## Keys

- `Product`
- `Plant`
- `StorageLocation`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
