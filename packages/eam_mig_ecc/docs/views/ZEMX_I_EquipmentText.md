# ZEMX_I_EquipmentText

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Equipment text (migration extract) |
| Module | `equipment` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #TEXT |
| Data source | `eqkt` |
| Source file | `src/zemx_i_equipmenttext.ddls.asddls` |

## Purpose

Equipment descriptions in every maintained language and the long-text indicator.

## Keys

- `equnr`
- `spras`

## Associations defined here

- none

## Access control

No DCL by design: Migration extraction/reconciliation view on ECC: it must return every record of the object. Access is controlled by the extraction channel (ODP/RFC user, S_TABU_NAM / S_TABU_DIS), not by CDS access control (decision XGEN-D01).

## Example use case

Extract the texts of the equipment in scope: join on Equipment with ZEMX_I_Equipment.

## Open verification items

none
