# ZEAM_B_EquipmentWithMaintItem

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Equipment with Maintenance Items |
| Module | link: `equipment` + `maintenance_plan` |
| Batch | 1 |
| Layer | link (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `ZEAM_B_Equipment` |
| Source file | `src/zeam_b_equipmentwithmaintitem.ddls.asddls` |

## Purpose

Equipment with a to-many association to the maintenance items that cover it.

## Keys

- `Equipment`

## Associations defined here

- `_MaintenanceItem` → `ZEAM_B_MaintItem` [0..*]

## Access control

Role inherits the conditions of `ZEAM_B_Equipment`.

## Example use case

Find equipment without preventive maintenance (no item) per equipment category.

## Open verification items

none
