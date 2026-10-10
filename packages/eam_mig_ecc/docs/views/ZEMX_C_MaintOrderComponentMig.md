# ZEMX_C_MaintOrderComponentMig

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Maintenance order component (migration) |
| Module | `maintenance_order` |
| Batch | 2 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_I_MaintOrderComponent`, join `ZEMX_I_MaintOrder` |
| Source file | `src/zemx_c_maintordercomponentmig.ddls.asddls` |

## Purpose

Open components (not deleted, not finally issued) of the open orders with material, plant and storage location.

## Keys

- `MaintenanceOrder`
- `ReservationItem`

## Associations defined here

- none

## Access control

No DCL by design: Migration view on ECC: it must return every record of the object. Access is controlled by the user / RFC user of the load program and the extraction channel (S_TABU_NAM), not by CDS access control (decision XGEN-D01; CDS access control also needs a newer release than the 7.40 SP08 baseline).

## Example use case

The load program adds the components to the operations of the migrated order.

## Open verification items

none
