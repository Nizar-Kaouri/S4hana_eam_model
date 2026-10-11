# ZPPV_B_ProductionOrder

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Production Order |
| Module | `production_order` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | #DIMENSION |
| Data source | `I_ManufacturingOrder` |
| Source file | `src/zppv_b_productionorder.ddls.asddls` |

## Purpose

One row per production order: type, category, material, plant, MRP controller, supervisor, version, planned / scrap / confirmed / delivered quantity, planned dates, release date and completion; derived open flag.

## Keys

- `ManufacturingOrder`

## Associations defined here

- `_ProductionPlant` → `I_Plant` [0..1]

## Access control

Role inherits the conditions of `I_ManufacturingOrder`.

## Example use case

Open production orders per plant and MRP controller; yield vs. planned quantity per material.

## Open verification items

`PP-001`, `PP-002`, `PP-003`, `PP-004`, `PP-D01` - see `BATCH_REPORT.md`.
