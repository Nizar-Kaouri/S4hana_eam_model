# ZEMX_I_MaintenanceItem

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Maintenance item |
| Module | `maintenance_plan` |
| Batch | 2 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | #DIMENSION |
| Data source | `ZEMX_I_MaintenanceItemHeader` |
| Source file | `src/zemx_i_maintenanceitem.ddls.asddls` |

## Purpose

Maintenance item with reference object, planning data, main work center (business key), order / notification type, task list and business area.

## Keys

- `MaintenanceItem`

## Associations defined here

- none

## Access control

No DCL by design: Migration view on ECC: it must return every record of the object. Access is controlled by the user / RFC user of the load program and the extraction channel (S_TABU_NAM), not by CDS access control (decision XGEN-D01; CDS access control also needs a newer release than the 7.40 SP08 baseline).

## Example use case

Read the items of the plans of plant 1000.

## Open verification items

none
