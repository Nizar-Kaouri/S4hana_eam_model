# ZEAM_I_FuncLoc

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Module | `functional_location` |
| Layer | Basic (analytical dimension) |
| Data source | `I_FunctionalLocation` |
| Source file | `src/zeam_i_funcloc.ddls.asddls` |

## Purpose

One row per functional location with external label, category, structure indicator, superior location and organizational assignment. Dimension for any cube referencing a functional location.

## Keys

- `FunctionalLocation (internal key)`

## Associations

- `_Text` → `ZEAM_I_FuncLocText` [0..*]
- `_SuperiorFunctionalLocation` → `ZEAM_I_FuncLoc` [0..1]
- `_MaintenancePlant` → `I_Plant` [0..1]
- `_MaintenancePlanningPlant` → `I_Plant` [0..1]
- `_CompanyCode` → `I_CompanyCode` [0..1]
- `_FunctionalLocationCategory` → `I_FunctionalLocationCategory` [0..1]
- `_TechnicalObjectType` → `I_TechnicalObjectType` [0..1]

## Access control

Inherits the conditions of SAP's `I_FunctionalLocation` role (FL-D01).

## Example use case

Navigate up the structure via `_SuperiorFunctionalLocation`; report on locations per plant section.

## Open verification items

`FL-001…FL-009`, `FL-D01` - see `BATCH_REPORT.md`.
