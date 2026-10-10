# ZEAM_I_EquipmentWithNotif

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Equipment with Notifications |
| Module | link: `equipment` + `maintenance_notification` |
| Batch | 1 |
| Layer | link (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `ZEAM_I_Equipment` |
| Source file | `src/zeam_i_equipmentwithnotif.ddls.asddls` |

## Purpose

Equipment with a to-many association to the maintenance notifications that reference it.

## Keys

- `Equipment`

## Associations defined here

- `_MaintenanceNotification` → `ZEAM_I_MaintNotif` [0..*]

## Access control

Role inherits the conditions of `ZEAM_I_Equipment`.

## Example use case

From an equipment object page navigate to its notification history.

## Open verification items

none
