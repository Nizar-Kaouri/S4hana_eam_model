# ZEMX_C_ObjectPartnerMigCount

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

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

Record count of the partner assignments delivered by ZEMX_C_ObjectPartnerMig per PartnerObjectType, PartnerFunction; compared with the same count on S/4HANA by tools/mig_reconcile.py.

## Keys

- `PartnerObjectType`
- `PartnerFunction`

## Associations defined here

- none

## Access control

No DCL by design: Migration view on ECC: it must return every record of the object. Access is controlled by the user / RFC user of the load program and the extraction channel (S_TABU_NAM), not by CDS access control (decision XGEN-D01; CDS access control also needs a newer release than the 7.40 SP08 baseline).

## Example use case

Export this view before the load and the S/4HANA count view after it; the reconcile tool lists every PartnerObjectType / PartnerFunction combination whose counts differ.

## Open verification items

none
