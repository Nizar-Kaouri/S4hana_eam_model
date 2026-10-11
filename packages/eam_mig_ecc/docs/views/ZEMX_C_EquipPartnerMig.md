# ZEMX_C_EquipPartnerMig

> Version **1.0.0**

| | |
|---|---|
| Description | EquipPartnerMig |
| Module | `equipment` |
| Batch | 2 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_I_EquipPartner` |
| Source file | `src/zemx_c_equippartnermig.ddls.asddls` |

## Purpose

Equipment child records in the same master scope; preserve their full keys.

## Keys

- `Equipment`
- `PartnerFunction`
- `PartnerCounter`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Export the selected equipment population and retain Equipment as the parent key.
