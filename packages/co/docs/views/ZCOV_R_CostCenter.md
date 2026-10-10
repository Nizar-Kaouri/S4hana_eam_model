# ZCOV_R_CostCenter

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Cost Center - Cube |
| Module | `cost_center` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | #CUBE |
| Data source | `ZCOV_I_CostCenter` |
| Source file | `src/zcov_r_costcenter.ddls.asddls` |

## Purpose

Cost center cube: number of cost centers per company code, category and profit center.

## Keys

- `ControllingArea`
- `CostCenter`

## Associations defined here

- `_CostCenter` → `ZCOV_I_CostCenter` [1..1]

## Access control

Role inherits the conditions of `ZCOV_I_CostCenter`.

## Example use case

Organizational overview of cost centers per company code.

## Open verification items

none
