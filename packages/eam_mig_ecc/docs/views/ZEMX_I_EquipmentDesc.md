# ZEMX_I_EquipmentDesc

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Equipment description |
| Module | `equipment` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #TEXT |
| Data source | `eqkt` |
| Source file | `src/zemx_i_equipmentdesc.ddls.asddls` |

## Purpose

Equipment descriptions (EQKT) per language with the long-text indicator.

## Keys

- `equnr`
- `spras`

## Associations defined here

- none

## Access control

No DCL by design: Migration view on ECC: it must return every record of the object. Access is controlled by the user / RFC user of the load program and the extraction channel (S_TABU_NAM), not by CDS access control (decision XGEN-D01; CDS access control also needs a newer release than the 7.40 SP08 baseline).

## Example use case

Read the English description of equipment 10000001.

## Open verification items

none
