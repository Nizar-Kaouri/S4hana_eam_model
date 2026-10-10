# ZEAM_I_FuncLocWithNotif

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Functional Location with Notifications |
| Module | link: `functional_location` + `maintenance_notification` |
| Batch | 1 |
| Layer | link (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `ZEAM_I_FuncLoc` |
| Source file | `src/zeam_i_funclocwithnotif.ddls.asddls` |

## Purpose

Functional location with a to-many association to the maintenance notifications that reference it.

## Keys

- `FunctionalLocation`

## Associations defined here

- `_MaintenanceNotification` → `ZEAM_I_MaintNotif` [0..*]

## Access control

Role inherits the conditions of `ZEAM_I_FuncLoc`.

## Example use case

Notification history of a functional location (e.g. a production line).

## Open verification items

none
