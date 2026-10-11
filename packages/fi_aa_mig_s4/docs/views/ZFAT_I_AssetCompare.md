# ZFAT_I_AssetCompare

> Version **1.0.0**

| | |
|---|---|
| Description | AssetCompare |
| Module | `fixed_asset` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `I_FixedAsset` |
| Source file | `src/zfat_i_assetcompare.ddls.asddls` |

## Purpose

Read AssetCompare as target comparison records.

## Keys

- `CompanyCode`
- `MasterFixedAsset`
- `FixedAsset`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
