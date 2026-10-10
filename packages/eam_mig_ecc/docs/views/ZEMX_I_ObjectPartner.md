# ZEMX_I_ObjectPartner

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Object partner |
| Module | `object_partner` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #FACT |
| Data source | `ihpa` |
| Source file | `src/zemx_i_objectpartner.ddls.asddls` |

## Purpose

Partners of technical objects, notifications and orders (IHPA) with the object type and key decoded.

## Keys

- `ObjectNumber`
- `PartnerFunction`
- `PartnerCounter`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Read the partners of equipment: filter PartnerObjectType = 'IE'.

## Open verification items

`XPA-001`, `XPA-002` - see `BATCH_REPORT.md`.
