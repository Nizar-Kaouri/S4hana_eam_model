# ZMMX_C_LocationStockMig

> Version **1.0.0**

| | |
|---|---|
| Description | LocationStockMig |
| Module | `material_stock` |
| Batch | 1 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZMMX_I_LocationStock` |
| Source file | `src/zmmx_c_locationstockmig.ddls.asddls` |

## Purpose

Read LocationStockMig as source records; approve the key-date population before posting.

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
