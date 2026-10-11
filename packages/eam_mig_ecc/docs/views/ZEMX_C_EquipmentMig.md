# ZEMX_C_EquipmentMig

> Version **1.0.0**

| | |
|---|---|
| Description | Equipment (migration) |
| Module | `equipment` |
| Batch | 2 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_I_Equipment` |
| Source file | `src/zemx_c_equipmentmig.ddls.asddls` |

## Purpose

Equipment to migrate (not flagged for deletion) with all fields as stored in ECC.

## Keys

- `Equipment`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

The load program creates the equipment (superordinate equipment first) and installs it at FunctionalLocation.
