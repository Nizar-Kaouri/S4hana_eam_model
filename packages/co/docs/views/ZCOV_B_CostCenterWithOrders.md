# ZCOV_B_CostCenterWithOrders

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Cost Center with Internal Orders |
| Module | link: `cost_center` + `internal_order` |
| Batch | 1 |
| Layer | link (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `ZCOV_B_CostCenter` |
| Source file | `src/zcov_b_costcenterwithorders.ddls.asddls` |

## Purpose

Cost center with a to-many association to the internal orders it is responsible for.

## Keys

- `ControllingArea`
- `CostCenter`

## Associations defined here

- `_InternalOrder` → `ZCOV_B_InternalOrder` [0..*]

## Access control

Role inherits the conditions of `ZCOV_B_CostCenter`.

## Example use case

Internal orders of a cost center manager.

## Open verification items

none
