# ZFAX_B_AssetBalanceData

> Version **1.0.0**

| | |
|---|---|
| Description | AssetBalanceData |
| Module | `asset_balance` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `anlc` |
| Source file | `src/zfax_b_assetbalancedata.ddls.asddls` |

## Purpose

Read AssetBalanceData as source records; approve the key-date population before posting.

## Keys

- `CompanyCode`
- `MasterFixedAsset`
- `FixedAsset`
- `FiscalYear`
- `DepreciationArea`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
