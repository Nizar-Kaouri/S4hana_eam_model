# ZFAX_I_AssetAssignmenData

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | AssetAssignmenData |
| Module | `fixed_asset` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `anlz` |
| Source file | `src/zfax_i_assetassignmendata.ddls.asddls` |

## Purpose

Read AssetAssignmenData as source candidates; approve the key-date population before posting.

## Keys

- `CompanyCode`
- `MasterFixedAsset`
- `FixedAsset`
- `ValidityEndDate`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.

## Open verification items

`FAX-002` - see `BATCH_REPORT.md`.
