# ZEAM_I_FuncLocWithEquipment

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Module | `link: equipment + functional_location` |
| Layer | Basic (link view) |
| Data source | `ZEAM_I_FuncLoc` |
| Source file | `src/zeam_i_funclocwithequipment.ddls.asddls` |

## Purpose

**Link view** - ships only if both modules are selected. Functional location with a to-many association `_InstalledEquipment`.

## Keys

- `FunctionalLocation`

## Associations

- `_FunctionalLocation` → `ZEAM_I_FuncLoc` [1..1]
- `_InstalledEquipment` → `ZEAM_I_Equipment` [0..*]

## Access control

Inherits from `ZEAM_I_FuncLoc`.

## Example use case

From a functional location, navigate to all currently installed equipment (e.g. in a RAP object page).

## Open verification items

`LNK-001`, `GEN-D02` - see `BATCH_REPORT.md`.
