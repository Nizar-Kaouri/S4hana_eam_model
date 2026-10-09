# ZEAM_I_EquipmentText

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Module | `equipment` |
| Layer | Basic (text, `@ObjectModel.dataCategory: #TEXT`) |
| Data source | `I_EquipmentText` |
| Source file | `src/zeam_i_equipmenttext.ddls.asddls` |

## Purpose

Language-dependent equipment description. Text provider for `ZEAM_I_Equipment`.

## Keys

- `Equipment`
- `Language`

## Associations

- none

## Access control

Unrestricted read (texts are not authorization-relevant, see GEN-D01).

## Example use case

Show the equipment description in the user's logon language in any list or analytical report.

## Open verification items

`EQ-T01`, `EQ-T02`, `GEN-D01` - see `BATCH_REPORT.md`.
