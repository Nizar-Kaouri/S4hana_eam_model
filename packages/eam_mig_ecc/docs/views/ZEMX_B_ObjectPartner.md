# ZEMX_B_ObjectPartner

> Version **1.0.0**

| | |
|---|---|
| Description | Object partner |
| Module | `object_partner` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #FACT |
| Data source | `ihpa` |
| Source file | `src/zemx_b_objectpartner.ddls.asddls` |

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
