# ZEAM_B_FuncLocWithEquipment

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Functional Location with Equipment |
| Module | link: `equipment` + `functional_location` |
| Batch | 1 |
| Layer | link (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `ZEAM_B_FuncLoc` |
| Source file | `src/zeam_b_funclocwithequipment.ddls.asddls` |

## Purpose

Functional location with a to-many association to the equipment installed at it.

## Keys

- `FunctionalLocation`

## Associations defined here

- `_FunctionalLocation` → `ZEAM_B_FuncLoc` [1..1]
- `_InstalledEquipment` → `ZEAM_B_Equipment` [0..*]

## Access control

Role inherits the conditions of `ZEAM_B_FuncLoc`.

## Example use case

From a functional location navigate to all currently installed equipment (e.g. in an object page).

## Open verification items

`LNK-001` - see `BATCH_REPORT.md`.
