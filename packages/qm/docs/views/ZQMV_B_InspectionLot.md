# ZQMV_B_InspectionLot

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Inspection Lot |
| Module | `inspection_lot` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | #DIMENSION |
| Data source | `I_InspectionLot` |
| Source file | `src/zqmv_b_inspectionlot.ddls.asddls` |

## Purpose

One row per inspection lot: lot type and origin (goods receipt, production, ...), material, plant, batch, supplier, quantities, dates and the usage decision with its valuation (accepted / rejected).

## Keys

- `InspectionLot`

## Associations defined here

- `_Plant` → `I_Plant` [0..1]

## Access control

Role inherits the conditions of `I_InspectionLot`.

## Example use case

Rejected goods-receipt lots per supplier; lots without usage decision older than 14 days.

## Open verification items

`QM-001`, `QM-002`, `QM-003`, `QM-004`, `QM-D01` - see `BATCH_REPORT.md`.
