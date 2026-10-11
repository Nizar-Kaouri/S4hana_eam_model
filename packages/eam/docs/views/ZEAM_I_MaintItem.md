# ZEAM_I_MaintItem

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Maintenance Item - Cube |
| Module | `maintenance_plan` |
| Batch | 3 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | #CUBE |
| Data source | `ZEAM_B_MaintItem` |
| Source file | `src/zeam_i_maintitem.ddls.asddls` |

## Purpose

Maintenance item cube with plan characteristics (category, strategy, inactive flag) via path expressions and counters for items and items with a task list.

## Keys

- `MaintenanceItem`

## Associations defined here

- `_MaintenanceItem` → `ZEAM_B_MaintItem` [1..1]

## Access control

Role inherits the conditions of `ZEAM_B_MaintItem`.

## Example use case

Preventive maintenance coverage per planning plant; items without task list.

## Open verification items

none
