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

- `objnr`
- `parvw`
- `counter`

## Associations defined here

- none

## Access control

No DCL by design: Migration view on ECC: it must return every record of the object. Access is controlled by the user / RFC user of the load program and the extraction channel (S_TABU_NAM), not by CDS access control (decision XGEN-D01; CDS access control also needs a newer release than the 7.40 SP08 baseline).

## Example use case

Read the partners of equipment: filter PartnerObjectType = 'IE'.

## Open verification items

`XPA-001`, `XPA-002` - see `BATCH_REPORT.md`.
