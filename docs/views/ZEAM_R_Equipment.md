# ZEAM_R_Equipment

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Module | `equipment` |
| Layer | Composite (analytical cube, `@Analytics.dataCategory: #CUBE`) |
| Data source | `ZEAM_I_Equipment` |
| Source file | `src/zeam_r_equipment.ddls.asddls` |

## Purpose

Cube over the equipment population. Measures: `NumberOfEquipments` (constant 1, SUM) and `AcquisitionValue` (SUM per currency). Has a metadata extension (`ZEAM_R_Equipment.ddlx`, layer #PARTNER) with list-report UI annotations.

## Keys

- `Equipment`

## Associations

- `_Equipment` → `ZEAM_I_Equipment` [1..1]
- exposed from basic view: _SuperordinateEquipment, _MaintenancePlant, _MaintenancePlanningPlant, _CompanyCode, _EquipmentCategory, _TechnicalObjectType

## Access control

Inherits from `ZEAM_I_Equipment` (GEN-D02).

## Example use case

Count of installed base per plant and equipment category; acquisition value by manufacturer.

## Open verification items

`EQ-R01`, `EQ-R02`, `GEN-X01` - see `BATCH_REPORT.md`.
