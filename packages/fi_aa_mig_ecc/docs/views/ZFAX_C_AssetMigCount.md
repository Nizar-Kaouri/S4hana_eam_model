# ZFAX_C_AssetMigCount

> Version **1.0.0**

| | |
|---|---|
| Description | AssetMigCount |
| Module | `fixed_asset` |
| Batch | 1 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZFAX_C_AssetMig` |
| Source file | `src/zfax_c_assetmigcount.ddls.asddls` |

## Purpose

Read AssetMigCount as source records; approve the key-date population before posting.

## Keys

- `CompanyCode`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
