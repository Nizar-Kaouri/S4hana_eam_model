# ZPPV_B_MaterialBOMLink

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Material BOM Assignment |
| Module | `bill_of_material` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `I_MaterialBOMLink` |
| Source file | `src/zppv_b_materialbomlink.ddls.asddls` |

## Purpose

Assignment of a BOM to a material, plant and BOM usage (production, engineering, maintenance) with the alternative (variant).

## Keys

- `Material`
- `Plant`
- `BillOfMaterialVariantUsage`
- `BillOfMaterialVariant`

## Associations defined here

- none

## Access control

Role inherits the conditions of `I_MaterialBOMLink`.

## Example use case

Which production BOM alternatives exist per material and plant.

## Open verification items

`PP-020`, `PP-D03` - see `BATCH_REPORT.md`.
