# ZEAM_B_FuncLoc

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Functional Location |
| Module | `functional_location` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | #DIMENSION |
| Data source | `I_FunctionalLocation` |
| Source file | `src/zeam_b_funcloc.ddls.asddls` |

## Purpose

One row per functional location with external label, category, structure indicator, superior location and organizational assignment; dimension for cubes referencing a functional location.

## Keys

- `FunctionalLocation`

## Associations defined here

- `_Text` → `ZEAM_B_FuncLocText` [0..*]
- `_SuperiorFunctionalLocation` → `ZEAM_B_FuncLoc` [0..1]
- `_MaintenancePlant` → `I_Plant` [0..1]
- `_MaintenancePlanningPlant` → `I_Plant` [0..1]
- `_CompanyCode` → `I_CompanyCode` [0..1]
- `_FunctionalLocationCategory` → `I_FunctionalLocationCategory` [0..1]
- `_TechnicalObjectType` → `I_TechnicalObjectType` [0..1]

## Access control

Role inherits the conditions of `I_FunctionalLocation`.

## Example use case

Navigate up the structure via _SuperiorFunctionalLocation; report on locations per plant section.

## Open verification items

`FL-001`, `FL-002`, `FL-003`, `FL-004`, `FL-005`, `FL-006`, `FL-007`, `FL-008`, `FL-009`, `FL-010`, `FL-D01` - see `BATCH_REPORT.md`.
