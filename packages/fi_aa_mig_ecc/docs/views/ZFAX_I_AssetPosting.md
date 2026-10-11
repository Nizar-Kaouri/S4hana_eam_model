# ZFAX_I_AssetPosting

> Version **1.0.0**

| | |
|---|---|
| Description | AssetPosting |
| Module | `asset_transaction` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZFAX_B_AssetPostingData` |
| Source file | `src/zfax_i_assetposting.ddls.asddls` |

## Purpose

Read AssetPosting as source records; approve the key-date population before posting.

## Keys

- `CompanyCode`
- `MasterFixedAsset`
- `FixedAsset`
- `FiscalYear`
- `AssetLineItem`
- `DepreciationArea`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
