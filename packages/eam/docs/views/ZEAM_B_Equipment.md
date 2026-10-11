# ZEAM_B_Equipment

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Equipment |
| Module | `equipment` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | #DIMENSION |
| Data source | `I_Equipment` |
| Source file | `src/zeam_b_equipment.ddls.asddls` |

## Purpose

One row per equipment (current time segment) with installation location, organizational assignment, manufacturer data and acquisition value; dimension for every cube that references an equipment.

## Keys

- `Equipment`

## Associations defined here

- `_Text` → `ZEAM_B_EquipmentText` [0..*]
- `_SuperordinateEquipment` → `ZEAM_B_Equipment` [0..1]
- `_MaintenancePlant` → `I_Plant` [0..1]
- `_MaintenancePlanningPlant` → `I_Plant` [0..1]
- `_CompanyCode` → `I_CompanyCode` [0..1]
- `_EquipmentCategory` → `I_EquipmentCategory` [0..1]
- `_TechnicalObjectType` → `I_TechnicalObjectType` [0..1]

## Access control

Role inherits the conditions of `I_Equipment`.

## Example use case

Read equipment attributes such as plant section or ABC indicator without touching SAP tables.

## Open verification items

`EQ-001`, `EQ-002`, `EQ-003`, `EQ-004`, `EQ-010`, `EQ-011`, `EQ-012`, `EQ-013`, `EQ-014`, `EQ-015`, `EQ-016`, `EQ-017`, `EQ-018`, `EQ-019`, `EQ-D01` - see `BATCH_REPORT.md`.
