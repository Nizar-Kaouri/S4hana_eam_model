# ZQMV_I_InspectionCharc

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Inspection Characteristic Result |
| Module | `inspection_result` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `I_InspectionCharacteristic` |
| Source file | `src/zqmv_i_inspectioncharc.ddls.asddls` |

## Purpose

One row per inspection characteristic of an inspection lot (per inspection operation) with characteristic text, status, valuation (accepted / rejected), mean value and number of defects.

## Keys

- `InspectionLot`
- `InspPlanOperationInternalID`
- `InspectionCharacteristic`

## Associations defined here

- `_InspectionLot` → `ZQMV_I_InspectionLot` [1..1]

## Access control

Role inherits the conditions of `I_InspectionCharacteristic`.

## Example use case

Characteristics rejected most often per material; defect counts per inspection specification.

## Open verification items

`QM-010`, `QM-011`, `QM-012`, `QM-D02` - see `BATCH_REPORT.md`.
