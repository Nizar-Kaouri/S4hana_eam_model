# ZMMV_I_ConsumptionWithProduct

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Material Consumption with Product |
| Module | link: `product` + `rpt_material_consumption` |
| Batch | 1 |
| Layer | link (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | #CUBE |
| Data source | `ZMMV_I_MaterialConsumption` |
| Source file | `src/zmmv_i_consumptionwithproduct.ddls.asddls` |

## Purpose

Consumption cube enriched with product type and group (spare-part classes).

## Keys

- `MaterialDocumentYear`
- `MaterialDocument`
- `MaterialDocumentItem`

## Associations defined here

- `_Product` → `ZMMV_B_Product` [0..1]

## Access control

Role inherits the conditions of `ZMMV_I_MaterialConsumption`.

## Example use case

Spare-part consumption value per product group and plant.

## Open verification items

none
