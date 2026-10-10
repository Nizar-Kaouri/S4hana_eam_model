# ZEMX_I_ObjectPartner

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Object partner (migration extract) |
| Module | `object_partner` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #FACT |
| Data source | `ihpa` |
| Source file | `src/zemx_i_objectpartner.ddls.asddls` |

## Purpose

Partners of technical objects, notifications and orders (partner function and partner number).

## Keys

- `objnr`
- `parvw`
- `counter`

## Associations defined here

- none

## Access control

No DCL by design: Migration extraction/reconciliation view on ECC: it must return every record of the object. Access is controlled by the extraction channel (ODP/RFC user, S_TABU_NAM / S_TABU_DIS), not by CDS access control (decision XGEN-D01).

## Example use case

Extract the partners of equipment: filter PartnerObjectType = 'IE'.

## Open verification items

`XPA-001`, `XPA-002` - see `BATCH_REPORT.md`.
