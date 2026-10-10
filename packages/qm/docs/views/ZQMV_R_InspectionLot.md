# ZQMV_R_InspectionLot

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Inspection Lot - Cube |
| Module | `inspection_lot` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | #CUBE |
| Data source | `ZQMV_I_InspectionLot` |
| Source file | `src/zqmv_r_inspectionlot.ddls.asddls` |

## Purpose

Inspection lot cube: number of lots, lots with usage decision, rejected lots and lot quantity per plant, origin, material, supplier and month.

## Keys

- `InspectionLot`

## Associations defined here

- `_InspectionLot` → `ZQMV_I_InspectionLot` [1..1]

## Access control

Role inherits the conditions of `ZQMV_I_InspectionLot`.

## Example use case

Rejection rate per supplier for goods-receipt inspections; open lots per plant.

## Open verification items

none
