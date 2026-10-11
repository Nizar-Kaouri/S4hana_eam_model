# ZPPX_I_MaterialBOM

> Version **1.0.0**

| | |
|---|---|
| Description | MaterialBOM |
| Module | `bill_of_material` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZPPX_I_MaterialBOMData` |
| Source file | `src/zppx_i_materialbom.ddls.asddls` |

## Purpose

Read MaterialBOM as source records; approve the key-date population before posting.

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
