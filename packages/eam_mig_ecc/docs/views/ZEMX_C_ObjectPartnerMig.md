# ZEMX_C_ObjectPartnerMig

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Object partner (migration) |
| Module | `object_partner` |
| Batch | 2 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_I_ObjectPartner` |
| Source file | `src/zemx_c_objectpartnermig.ddls.asddls` |

## Purpose

Partner assignments (not deleted) with object key, partner function and partner.

## Keys

- `PartnerObjectKey`
- `PartnerFunction`
- `PartnerCounter`
- `PartnerObjectType`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

The load program adds the partners to the migrated objects (filter PartnerObjectType per object).

## Open verification items

none
