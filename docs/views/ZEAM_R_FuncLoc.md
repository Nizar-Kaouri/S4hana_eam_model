# ZEAM_R_FuncLoc

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Module | `functional_location` |
| Layer | Composite (analytical cube) |
| Data source | `ZEAM_I_FuncLoc` |
| Source file | `src/zeam_r_funcloc.ddls.asddls` |

## Purpose

Cube with measure `NumberOfFunctionalLocations`. Has a metadata extension (layer #PARTNER).

## Keys

- `FunctionalLocation`

## Associations

- `_FunctionalLocation` → `ZEAM_I_FuncLoc` [1..1]
- exposed from basic view: _SuperiorFunctionalLocation, _MaintenancePlant, _MaintenancePlanningPlant, _CompanyCode, _FunctionalLocationCategory, _TechnicalObjectType

## Access control

Inherits from `ZEAM_I_FuncLoc` (GEN-D02).

## Example use case

Number of functional locations per plant and category.

## Open verification items

`FL-R01`, `GEN-X01` - see `BATCH_REPORT.md`.
