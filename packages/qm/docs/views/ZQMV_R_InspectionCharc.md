# ZQMV_R_InspectionCharc

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Inspection Result - Cube |
| Module | `inspection_result` |
| Batch | 2 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | #CUBE |
| Data source | `ZQMV_I_InspectionCharc` |
| Source file | `src/zqmv_r_inspectioncharc.ddls.asddls` |

## Purpose

Result cube: number of inspected and rejected characteristics and defects per characteristic, with material, plant, supplier and lot origin from the lot.

## Keys

- `InspectionLot`
- `InspPlanOperationInternalID`
- `InspectionCharacteristic`

## Associations defined here

- none

## Access control

Role inherits the conditions of `ZQMV_I_InspectionCharc`.

## Example use case

Which characteristics fail most often for a supplier's materials.

## Open verification items

none
