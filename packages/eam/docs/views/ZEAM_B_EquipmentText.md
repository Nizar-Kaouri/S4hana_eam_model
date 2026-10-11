# ZEAM_B_EquipmentText

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Equipment - Text |
| Module | `equipment` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | #TEXT |
| Data source | `I_EquipmentText` |
| Source file | `src/zeam_b_equipmenttext.ddls.asddls` |

## Purpose

Language-dependent equipment description; text provider for ZEAM_B_Equipment.

## Keys

- `Equipment`
- `Language`

## Associations defined here

- none

## Access control

Role grants unrestricted read access (explicit `grant select on ...;`).

## Example use case

Show the equipment description in the logon language in any list or analytical report.

## Open verification items

`EQ-T01`, `EQ-T02`, `GEN-D01` - see `BATCH_REPORT.md`.
