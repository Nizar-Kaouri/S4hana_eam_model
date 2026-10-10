# ZEAM_I_EquipmentWithFuncLoc

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Equipment with Functional Location |
| Module | link: `equipment` + `functional_location` |
| Batch | 1 |
| Layer | link (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `ZEAM_I_Equipment` |
| Source file | `src/zeam_i_equipmentwithfuncloc.ddls.asddls` |

## Purpose

Installed equipment with attributes and association of its functional location.

## Keys

- `Equipment`

## Associations defined here

- `_Equipment` → `ZEAM_I_Equipment` [1..1]
- `_FunctionalLocation` → `ZEAM_I_FuncLoc` [0..1]

## Access control

Role inherits the conditions of `ZEAM_I_Equipment`.

## Example use case

List all installed equipment with the external label of their functional location.

## Open verification items

`LNK-002` - see `BATCH_REPORT.md`.
