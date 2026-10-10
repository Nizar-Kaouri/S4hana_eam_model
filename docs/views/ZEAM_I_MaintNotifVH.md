# ZEAM_I_MaintNotifVH

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Maintenance Notification - Value Help |
| Module | `maintenance_notification` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | #VALUE_HELP |
| Data source | `ZEAM_I_MaintNotif` |
| Source file | `src/zeam_i_maintnotifvh.ddls.asddls` |

## Purpose

Searchable value help for maintenance notifications (number and short text).

## Keys

- `MaintenanceNotification`

## Associations defined here

- none

## Access control

Role inherits the conditions of `ZEAM_I_MaintNotif`.

## Example use case

@Consumption.valueHelpDefinition on a MaintenanceNotification element of a consumption view.

## Open verification items

none
