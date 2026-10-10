# ZEAM_I_MaintOrderOperation

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Maintenance Order Operation |
| Module | `maintenance_order` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `I_MaintenanceOrderOperation` |
| Source file | `src/zeam_i_maintorderoperation.ddls.asddls` |

## Purpose

One row per maintenance order operation / sub-operation with work center, control key, planned and actual work.

## Keys

- `MaintenanceOrder`
- `MaintenanceOrderOperation`
- `MaintenanceOrderSubOperation`

## Associations defined here

- `_MaintenanceOrder` → `ZEAM_I_MaintOrder` [1..1]

## Access control

Role inherits the conditions of `I_MaintenanceOrderOperation`.

## Example use case

Planned vs. actual work per work center; remaining work of open orders (backlog report).

## Open verification items

`MO-D02`, `MO-O01`, `MO-O02`, `MO-O03`, `MO-O04` - see `BATCH_REPORT.md`.
