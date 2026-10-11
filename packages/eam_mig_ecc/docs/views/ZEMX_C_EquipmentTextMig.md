# ZEMX_C_EquipmentTextMig

> Version **1.0.0**

| | |
|---|---|
| Description | Equipment text (migration) |
| Module | `equipment` |
| Batch | 2 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_B_EquipmentDesc` |
| Source file | `src/zemx_c_equipmenttextmig.ddls.asddls` |

## Purpose

Descriptions of the equipment in scope per language.

## Keys

- `Equipment`
- `Language`

## Associations defined here

- `_Equipment` → `ZEMX_I_Equipment` [0..1]

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Read the texts of equipment 10000001: filter Equipment = '000000000010000001'.
