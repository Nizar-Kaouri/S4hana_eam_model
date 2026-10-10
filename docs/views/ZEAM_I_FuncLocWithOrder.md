# ZEAM_I_FuncLocWithOrder

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Functional Location with Maintenance Orders |
| Module | link: `functional_location` + `maintenance_order` |
| Batch | 1 |
| Layer | link (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `ZEAM_I_FuncLoc` |
| Source file | `src/zeam_i_funclocwithorder.ddls.asddls` |

## Purpose

Functional location with a to-many association to the maintenance orders that reference it.

## Keys

- `FunctionalLocation`

## Associations defined here

- `_MaintenanceOrder` → `ZEAM_I_MaintOrder` [0..*]

## Access control

Role inherits the conditions of `ZEAM_I_FuncLoc`.

## Example use case

Order history of a functional location.

## Open verification items

none
