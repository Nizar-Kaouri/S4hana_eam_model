# ZEMX_C_ObjectPartnerMigCount

> Version **1.0.0**

| | |
|---|---|
| Description | Object partner count (migration) |
| Module | `object_partner` |
| Batch | 2 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_C_ObjectPartnerMig` |
| Source file | `src/zemx_c_objectpartnermigcount.ddls.asddls` |

## Purpose

Record count of the partner assignments delivered by ZEMX_C_ObjectPartnerMig per PartnerObjectType, PartnerFunction.

## Keys

- `PartnerObjectType`
- `PartnerFunction`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Export this source count view to record the selected extraction population by its dimensions.
