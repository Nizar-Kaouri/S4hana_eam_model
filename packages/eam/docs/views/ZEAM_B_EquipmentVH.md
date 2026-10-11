# ZEAM_B_EquipmentVH

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Equipment - Value Help |
| Module | `equipment` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | #VALUE_HELP |
| Data source | `ZEAM_B_Equipment` |
| Source file | `src/zeam_b_equipmentvh.ddls.asddls` |

## Purpose

Searchable value help for equipment with the description in the logon language.

## Keys

- `Equipment`

## Associations defined here

- none

## Access control

Role inherits the conditions of `ZEAM_B_Equipment`.

## Example use case

@Consumption.valueHelpDefinition: [{ entity: { name: 'ZEAM_B_EquipmentVH', element: 'Equipment' } }] on an Equipment element.

## Open verification items

`EQ-V01`, `EQ-V02`, `GEN-D02` - see `BATCH_REPORT.md`.
