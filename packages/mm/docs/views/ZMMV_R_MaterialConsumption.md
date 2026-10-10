# ZMMV_R_MaterialConsumption

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Material Consumption |
| Module | `rpt_material_consumption` |
| Batch | 4 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | #CUBE |
| Data source | `ZMMV_I_GoodsMovement` |
| Source file | `src/zmmv_r_materialconsumption.ddls.asddls` |

## Purpose

Consumption cube: issued and reversed quantities and issue value for consumption movement types, per material, plant, cost center, order and month.

## Keys

- `MaterialDocumentYear`
- `MaterialDocument`
- `MaterialDocumentItem`

## Associations defined here

- none

## Access control

Role inherits the conditions of `ZMMV_I_GoodsMovement`.

## Example use case

Spare-part consumption per plant and month; top consumed materials by maintenance orders.

## Open verification items

`MM-R03` - see `BATCH_REPORT.md`.
