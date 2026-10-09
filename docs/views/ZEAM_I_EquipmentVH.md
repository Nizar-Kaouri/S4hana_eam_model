# ZEAM_I_EquipmentVH

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Module | `equipment` |
| Layer | Basic (value help, `@ObjectModel.dataCategory: #VALUE_HELP`) |
| Data source | `ZEAM_I_Equipment` |
| Source file | `src/zeam_i_equipmentvh.ddls.asddls` |

## Purpose

Searchable value help for equipment with the description in the logon language. Fuzzy search on number and name, low-ranked search on functional location and serial number.

## Keys

- `Equipment`

## Associations

- none

## Access control

Inherits from `ZEAM_I_Equipment` (GEN-D02).

## Example use case

`@Consumption.valueHelpDefinition: [{ entity: { name: 'ZEAM_I_EquipmentVH', element: 'Equipment' } }]` on any `Equipment` element of a consumption view or RAP projection.

## Open verification items

`EQ-V01`, `EQ-V02`, `GEN-D02` - see `BATCH_REPORT.md`.
