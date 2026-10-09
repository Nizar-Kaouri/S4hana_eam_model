# ZEAM_I_Equipment

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Module | `equipment` |
| Layer | Basic (analytical dimension, `@Analytics.dataCategory: #DIMENSION`) |
| Data source | `I_Equipment` filtered to `ValidityEndDate = '99991231'` |
| Source file | `src/zeam_i_equipment.ddls.asddls` |

## Purpose

One row per equipment, current time segment only. Carries installation location, organizational assignment, manufacturer data and acquisition value. Serves as dimension for every cube that references an equipment.

## Keys

- `Equipment`

## Associations

- `_Text` → `ZEAM_I_EquipmentText` [0..*]
- `_SuperordinateEquipment` → `ZEAM_I_Equipment` [0..1]
- `_MaintenancePlant` → `I_Plant` [0..1]
- `_MaintenancePlanningPlant` → `I_Plant` [0..1]
- `_CompanyCode` → `I_CompanyCode` [0..1]
- `_EquipmentCategory` → `I_EquipmentCategory` [0..1]
- `_TechnicalObjectType` → `I_TechnicalObjectType` [0..1]

## Access control

Inherits the conditions of SAP's `I_Equipment` role (EQ-D01).

## Example use case

Join maintenance orders (Batch 2) to equipment attributes such as plant section or ABC indicator without touching SAP tables.

## Open verification items

`EQ-001`, `EQ-002`, `EQ-003`, `EQ-004`, `EQ-010…EQ-018`, `EQ-D01` - see `BATCH_REPORT.md`.
