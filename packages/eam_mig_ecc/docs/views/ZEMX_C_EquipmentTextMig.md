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
| Data source | `ZEMX_I_EquipText` |
| Source file | `src/zemx_c_equipmenttextmig.ddls.asddls` |

## Purpose

Equipment descriptions by language in the equipment master scope.

## Keys

- `Equipment`
- `Language`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Export the selected equipment population and retain Equipment as the parent key.
