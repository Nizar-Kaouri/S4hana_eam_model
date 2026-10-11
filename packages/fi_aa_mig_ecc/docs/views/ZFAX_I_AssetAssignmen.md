# ZFAX_I_AssetAssignmen

> Version **1.0.0**

| | |
|---|---|
| Description | AssetAssignmen |
| Module | `fixed_asset` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZFAX_I_AssetAssignmenData` |
| Source file | `src/zfax_i_assetassignmen.ddls.asddls` |

## Purpose

Read AssetAssignmen as source records; approve the key-date population before posting.

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
