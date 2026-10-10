# ZEAM_I_EquipmentWithOrder

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Equipment with Maintenance Orders |
| Module | link: `equipment` + `maintenance_order` |
| Batch | 1 |
| Layer | link (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `ZEAM_I_Equipment` |
| Source file | `src/zeam_i_equipmentwithorder.ddls.asddls` |

## Purpose

Equipment with a to-many association to the maintenance orders that reference it (order header reference object).

## Keys

- `Equipment`

## Associations defined here

- `_MaintenanceOrder` → `ZEAM_I_MaintOrder` [0..*]

## Access control

Role inherits the conditions of `ZEAM_I_Equipment`.

## Example use case

Order history of an equipment; open orders per equipment in an object page.

## Open verification items

none
