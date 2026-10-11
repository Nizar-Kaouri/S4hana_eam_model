# ZFAT_I_AssetCount

> Version **1.0.0**

| | |
|---|---|
| Description | AssetCount |
| Module | `fixed_asset` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | - |
| Data source | `ZFAT_I_AssetCompare` |
| Source file | `src/zfat_i_assetcount.ddls.asddls` |

## Purpose

Read AssetCount as target comparison records.

## Keys

- `CompanyCode`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
