# ZBRG_I_InspLotWithProduct

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Inspection Lot with Product |
| Module | bridge: `mm:product` + `qm:inspection_lot` |
| Batch | 1 |
| Layer | link (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | #CUBE |
| Data source | `ZQMV_I_InspectionLot` |
| Source file | `src/zbrg_i_insplotwithproduct.ddls.asddls` |

## Purpose

Inspection lot cube enriched with product type and group from the MM product.

## Keys

- `InspectionLot`

## Associations defined here

- `_Product` → `ZMMV_B_Product` [0..1]

## Access control

Role inherits the conditions of `ZQMV_I_InspectionLot`.

## Example use case

Rejection rate per product group and plant.

## Open verification items

none
