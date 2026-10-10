# ZPPX_I_MaterialBOMData

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | MaterialBOMData |
| Module | `bill_of_material` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `mast` |
| Source file | `src/zppx_i_materialbomdata.ddls.asddls` |

## Purpose

Read MaterialBOMData as source candidates; approve the key-date population before posting.

## Keys

- `Material`
- `Plant`
- `BillOfMaterialUsage`
- `BillOfMaterial`
- `BillOfMaterialVariant`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.

## Open verification items

`PPX-007` - see `BATCH_REPORT.md`.
