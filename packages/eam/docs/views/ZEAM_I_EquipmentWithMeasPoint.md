# ZEAM_I_EquipmentWithMeasPoint

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Equipment with Measuring Points |
| Module | link: `equipment` + `measuring_point` |
| Batch | 1 |
| Layer | link (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `ZEAM_I_Equipment` |
| Source file | `src/zeam_i_equipmentwithmeaspoint.ddls.asddls` |

## Purpose

Equipment with a to-many association to the measuring points / counters defined for it.

## Keys

- `Equipment`

## Associations defined here

- `_MeasuringPoint` → `ZEAM_I_MeasPoint` [0..*]

## Access control

Role inherits the conditions of `ZEAM_I_Equipment`.

## Example use case

Show all counters of an equipment with their latest readings (via the measurement document module).

## Open verification items

none
