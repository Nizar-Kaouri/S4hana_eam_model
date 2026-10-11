# ZEMX_I_EquipBOMAssignData

> Version **1.0.0**

| | |
|---|---|
| Description | EquipBOMAssign source data |
| Module | `equipment_bom` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `eqst` |
| Source file | `src/zemx_i_equipbomassigndata.ddls.asddls` |

## Purpose

EquipBOMAssign source data

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
