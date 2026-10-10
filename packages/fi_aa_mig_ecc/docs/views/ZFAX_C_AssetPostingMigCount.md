# ZFAX_C_AssetPostingMigCount

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | AssetPostingMigCount |
| Module | `asset_transaction` |
| Batch | 1 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZFAX_C_AssetPostingMig` |
| Source file | `src/zfax_c_assetpostingmigcount.ddls.asddls` |

## Purpose

Read AssetPostingMigCount as source candidates; approve the key-date population before posting.

## Keys

- `CompanyCode`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.

## Open verification items

none
