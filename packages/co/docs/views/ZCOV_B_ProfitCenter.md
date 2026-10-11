# ZCOV_B_ProfitCenter

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Profit Center |
| Module | `profit_center` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | #DIMENSION |
| Data source | `I_ProfitCenter` |
| Source file | `src/zcov_b_profitcenter.ddls.asddls` |

## Purpose

One row per profit center valid today: segment and person responsible; dimension for cost and margin cubes.

## Keys

- `ControllingArea`
- `ProfitCenter`

## Associations defined here

- `_Text` → `ZCOV_B_ProfitCenterText` [0..*]

## Access control

Role inherits the conditions of `I_ProfitCenter`.

## Example use case

Costs per profit center and segment.

## Open verification items

`CO-020`, `CO-D03` - see `BATCH_REPORT.md`.
