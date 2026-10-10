# ZEAM_R_MaintOrderWithTechObj

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Maintenance Order with Technical Object |
| Module | link: `equipment` + `functional_location` + `maintenance_order` |
| Batch | 1 |
| Layer | link (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | #CUBE |
| Data source | `ZEAM_R_MaintOrder` |
| Source file | `src/zeam_r_maintorderwithtechobj.ddls.asddls` |

## Purpose

Maintenance order cube enriched with technical object master data: foreign keys to the equipment and functional location dimensions (navigation attributes) and selected attributes as plain characteristics (equipment category, ABC indicator, manufacturer, location category).

## Keys

- `MaintenanceOrder`

## Associations defined here

- `_Equipment` → `ZEAM_I_Equipment` [0..1]
- `_FunctionalLocation` → `ZEAM_I_FuncLoc` [0..1]

## Access control

Role inherits the conditions of `ZEAM_R_MaintOrder`.

## Example use case

Number of corrective orders per equipment category and manufacturer; orders per ABC indicator.

## Open verification items

`LNK-011` - see `BATCH_REPORT.md`.
