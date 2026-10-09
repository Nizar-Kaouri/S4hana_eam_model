# ZEAM_I_EquipmentWithFuncLoc

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Module | `link: equipment + functional_location` |
| Layer | Basic (link view) |
| Data source | `ZEAM_I_Equipment` |
| Source file | `src/zeam_i_equipmentwithfuncloc.ddls.asddls` |

## Purpose

**Link view** - ships only if both modules are selected. One row per current equipment installed at a functional location, with location attributes via path expressions and an association to the location.

## Keys

- `Equipment`

## Associations

- `_Equipment` → `ZEAM_I_Equipment` [1..1]
- `_FunctionalLocation` → `ZEAM_I_FuncLoc` [0..1]

## Access control

Inherits from `ZEAM_I_Equipment`. Functional-location authorizations are not combined into this role (documented risk).

## Example use case

List all installed equipment with the external label of their functional location.

## Open verification items

`LNK-002`, `GEN-D02` - see `BATCH_REPORT.md`.
