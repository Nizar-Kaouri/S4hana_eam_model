# ZEAM_I_MaintOrderVH

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Maintenance Order - Value Help |
| Module | `maintenance_order` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | #VALUE_HELP |
| Data source | `ZEAM_I_MaintOrder` |
| Source file | `src/zeam_i_maintordervh.ddls.asddls` |

## Purpose

Searchable value help for maintenance orders (number and description).

## Keys

- `MaintenanceOrder`

## Associations defined here

- none

## Access control

Role inherits the conditions of `ZEAM_I_MaintOrder`.

## Example use case

@Consumption.valueHelpDefinition on a MaintenanceOrder element of a consumption view.

## Open verification items

none
