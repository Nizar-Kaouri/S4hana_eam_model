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

## Associations defined here

- none

## Access control

No DCL by design: Migration view on ECC: it must return every record of the object. Access is controlled by the user / RFC user of the load program and the extraction channel (S_TABU_NAM), not by CDS access control (decision XGEN-D01; CDS access control also needs a newer release than the 7.40 SP08 baseline).

## Example use case

The load program adds the partners to the migrated objects (filter PartnerObjectType per object).

## Open verification items

none
