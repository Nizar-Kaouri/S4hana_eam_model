# ZCOV_B_CostCenter

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Cost Center |
| Module | `cost_center` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | #DIMENSION |
| Data source | `I_CostCenter` |
| Source file | `src/zcov_b_costcenter.ddls.asddls` |

## Purpose

One row per cost center valid today: company code, category, profit center, business area, functional area and person responsible; dimension for cost cubes.

## Keys

- `ControllingArea`
- `CostCenter`

## Associations defined here

- `_Text` → `ZCOV_B_CostCenterText` [0..*]
- `_CompanyCode` → `I_CompanyCode` [0..1]

## Access control

Role inherits the conditions of `I_CostCenter`.

## Example use case

Costs per cost center category; cost centers per profit center.

## Open verification items

`CO-001`, `CO-002`, `CO-D01` - see `BATCH_REPORT.md`.
