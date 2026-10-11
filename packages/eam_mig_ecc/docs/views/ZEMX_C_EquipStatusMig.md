# ZEMX_C_EquipStatusMig

> Version **1.0.0**

| | |
|---|---|
| Description | EquipStatusMig |
| Module | `equipment` |
| Batch | 2 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_I_EquipStatus` |
| Source file | `src/zemx_c_equipstatusmig.ddls.asddls` |

## Purpose

Reference export; system statuses are recreated by SAP business processing. Equipment child records in the same master scope; preserve their full keys.

## Keys

- `Equipment`
- `StatusCode`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Export the selected equipment population and retain Equipment as the parent key.
