# ZEMX_C_EquipSerialStockMig

> Version **1.0.0**

| | |
|---|---|
| Description | EquipSerialStock migration extract |
| Module | `equipment` |
| Batch | 2 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_I_EquipSerialStock` |
| Source file | `src/zemx_c_equipserialstockmig.ddls.asddls` |

## Purpose

EquipSerialStock migration extract

## Keys

- `Equipment`

## Associations defined here

- `_Parent` → `ZEMX_I_Equipment` [0..1]

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Export the selected migration scope; validate keys and row counts before loading.
