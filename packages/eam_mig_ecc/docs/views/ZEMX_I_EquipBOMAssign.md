# ZEMX_I_EquipBOMAssign

> Version **1.0.0**

| | |
|---|---|
| Description | EquipBOMAssign migration business data |
| Module | `equipment_bom` |
| Batch | 2 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_B_EquipBOMAssignData` |
| Source file | `src/zemx_i_equipbomassign.ddls.asddls` |

## Purpose

EquipBOMAssign migration business data

## Keys

- `Equipment`
- `Plant`
- `BOMUsage`
- `BOMAlternative`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Export the selected migration scope; validate keys and row counts before loading.
