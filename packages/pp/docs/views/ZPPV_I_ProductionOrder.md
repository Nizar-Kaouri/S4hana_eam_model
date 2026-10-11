# ZPPV_I_ProductionOrder

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Production Order - Cube |
| Module | `production_order` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | #CUBE |
| Data source | `ZPPV_B_ProductionOrder` |
| Source file | `src/zppv_i_productionorder.ddls.asddls` |

## Purpose

Production order cube: number of (open) orders and planned, confirmed, scrap and delivered quantity per plant, material, MRP controller and month.

## Keys

- `ManufacturingOrder`

## Associations defined here

- `_ProductionOrder` → `ZPPV_B_ProductionOrder` [1..1]

## Access control

Role inherits the conditions of `ZPPV_B_ProductionOrder`.

## Example use case

Yield vs. plan per material and month; open orders per MRP controller.

## Open verification items

none
