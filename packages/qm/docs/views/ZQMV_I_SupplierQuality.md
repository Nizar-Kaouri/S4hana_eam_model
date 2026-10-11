# ZQMV_I_SupplierQuality

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Supplier Quality |
| Module | `rpt_supplier_quality` |
| Batch | 4 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | #CUBE |
| Data source | `ZQMV_B_InspectionLot` |
| Source file | `src/zqmv_i_supplierquality.ddls.asddls` |

## Purpose

Supplier quality cube: goods-receipt lots with usage decision per supplier, material and month, split into accepted and rejected lots and rejected quantity.

## Keys

- `InspectionLot`

## Associations defined here

- `_InspectionLot` → `ZQMV_B_InspectionLot` [1..1]

## Access control

Role inherits the conditions of `ZQMV_B_InspectionLot`.

## Example use case

Supplier ranking by rejection rate for the last 12 months.

## Open verification items

`QM-R01` - see `BATCH_REPORT.md`.
