# ZPPX_C_ProdVersionMig

> Version **1.0.0**

| | |
|---|---|
| Description | ProdVersionMig |
| Module | `production_version` |
| Batch | 1 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZPPX_I_ProdVersion` |
| Source file | `src/zppx_c_prodversionmig.ddls.asddls` |

## Purpose

Read ProdVersionMig as source records; approve the key-date population before posting.

## Keys

- `Product`
- `Plant`
- `ProductionVersion`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
