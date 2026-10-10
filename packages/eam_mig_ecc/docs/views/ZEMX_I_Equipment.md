# ZEMX_I_Equipment

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Equipment |
| Module | `equipment` |
| Batch | 2 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | #DIMENSION |
| Data source | `ZEMX_I_EquipmentHeader`, join `ZEMX_I_EquipmentTimeSegment` |
| Source file | `src/zemx_i_equipment.ddls.asddls` |

## Purpose

Equipment in its current time segment with installation location, superordinate equipment, main work center (business key), location / account assignment, manufacturer data and deletion flag: the complete business object.

## Keys

- `Equipment`

## Associations defined here

- none

## Access control

No DCL by design: Migration view on ECC: it must return every record of the object. Access is controlled by the user / RFC user of the load program and the extraction channel (S_TABU_NAM), not by CDS access control (decision XGEN-D01; CDS access control also needs a newer release than the 7.40 SP08 baseline).

## Example use case

Read the equipment of plant 1000 in installation order: filter MaintenancePlanningPlant = '1000'.

## Open verification items

`XEQ-001` - see `BATCH_REPORT.md`.
