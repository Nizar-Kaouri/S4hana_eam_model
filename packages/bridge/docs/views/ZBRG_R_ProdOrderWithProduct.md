# ZBRG_R_ProdOrderWithProduct

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Production Order with Product |
| Module | bridge: `mm:product` + `pp:production_order` |
| Batch | 1 |
| Layer | link (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | #CUBE |
| Data source | `ZPPV_R_ProductionOrder` |
| Source file | `src/zbrg_r_prodorderwithproduct.ddls.asddls` |

## Purpose

Production order cube enriched with product type and group from the MM product.

## Keys

- `ManufacturingOrder`

## Associations defined here

- `_Product` → `ZMMV_I_Product` [0..1]

## Access control

Role inherits the conditions of `ZPPV_R_ProductionOrder`.

## Example use case

Yield vs. plan per product group and plant.

## Open verification items

none
