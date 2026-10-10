# ZEMX_I_MaintOrder

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Maintenance order |
| Module | `maintenance_order` |
| Batch | 2 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | #FACT |
| Data source | `ZEMX_I_OrderMasterData`, join `ZEMX_I_OrderMaintData`, join `ZEMX_I_OrderHeaderPlanning`, join `ZEMX_I_LocAcctAssignment`, join `ZEMX_I_WorkCenterHeader`, join `ZEMX_I_StatusTechCompleted`, join `ZEMX_I_StatusClosed`, join `ZEMX_I_StatusDeletionFlag` |
| Source file | `src/zemx_i_maintorder.ddls.asddls` |

## Purpose

Maintenance order with planning data, reference object, account assignment, main work center (business key) and the status flags that decide the migration scope.

## Keys

- `MaintenanceOrder`

## Associations defined here

- none

## Access control

No DCL by design: Migration view on ECC: it must return every record of the object. Access is controlled by the user / RFC user of the load program and the extraction channel (S_TABU_NAM), not by CDS access control (decision XGEN-D01; CDS access control also needs a newer release than the 7.40 SP08 baseline).

## Example use case

Read the open orders: filter IsTechnicallyCompleted = '', IsClosed = '' and IsMarkedForDeletion = ''.

## Open verification items

none
