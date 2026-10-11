# ZEMX_C_EquipBOMMigCount

> Version **1.0.0**

| | |
|---|---|
| Description | Equipment BOM assignment count |
| Module | `equipment_bom` |
| Batch | 2 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_C_EquipBOMAssignMig` |
| Source file | `src/zemx_c_equipbommigcount.ddls.asddls` |

## Purpose

Equipment BOM assignment count

## Keys

- `Plant`
- `BOMUsage`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Export the selected migration scope; validate keys and row counts before loading.
