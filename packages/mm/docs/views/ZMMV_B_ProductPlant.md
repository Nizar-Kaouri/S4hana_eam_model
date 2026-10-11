# ZMMV_B_ProductPlant

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Product Plant Data |
| Module | `product` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `I_ProductPlantBasic` |
| Source file | `src/zmmv_b_productplant.ddls.asddls` |

## Purpose

Plant-specific material data: MRP type, MRP controller, procurement type, purchasing group and profit center.

## Keys

- `Product`
- `Plant`

## Associations defined here

- `_Product` → `ZMMV_B_Product` [1..1]
- `_Plant` → `I_Plant` [0..1]

## Access control

Role inherits the conditions of `I_ProductPlantBasic`.

## Example use case

Which spare parts are MRP-planned in a plant; external vs. in-house procurement per plant.

## Open verification items

`MM-004`, `MM-005`, `MM-D02` - see `BATCH_REPORT.md`.
