# ZEAM_I_FuncLocWithMeasPoint

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Functional Location with Measuring Points |
| Module | link: `functional_location` + `measuring_point` |
| Batch | 1 |
| Layer | link (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `ZEAM_I_FuncLoc` |
| Source file | `src/zeam_i_funclocwithmeaspoint.ddls.asddls` |

## Purpose

Functional location with a to-many association to its measuring points.

## Keys

- `FunctionalLocation`

## Associations defined here

- `_MeasuringPoint` → `ZEAM_I_MeasPoint` [0..*]

## Access control

Role inherits the conditions of `ZEAM_I_FuncLoc`.

## Example use case

Condition monitoring overview of a production line.

## Open verification items

none
