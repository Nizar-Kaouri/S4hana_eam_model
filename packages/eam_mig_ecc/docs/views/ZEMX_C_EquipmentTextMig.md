# ZEMX_C_EquipmentTextMig

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Equipment text (migration) |
| Module | `equipment` |
| Batch | 2 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_I_EquipmentDesc`, join `ZEMX_I_Equipment` |
| Source file | `src/zemx_c_equipmenttextmig.ddls.asddls` |

## Purpose

Descriptions of the equipment in scope per language.

## Keys

- `Equipment`
- `Language`

## Associations defined here

- none

## Access control

No DCL by design: Migration view on ECC: it must return every record of the object. Access is controlled by the user / RFC user of the load program and the extraction channel (S_TABU_NAM), not by CDS access control (decision XGEN-D01; CDS access control also needs a newer release than the 7.40 SP08 baseline).

## Example use case

Read the texts of equipment 10000001: filter Equipment = '000000000010000001'.

## Open verification items

none
