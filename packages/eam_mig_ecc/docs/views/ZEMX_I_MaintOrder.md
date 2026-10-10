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
| Data source | `ZEMX_I_OrderMasterData`, join `ZEMX_I_OrderMaintData`, join `ZEMX_I_OrderHeaderPlanning` |
| Source file | `src/zemx_i_maintorder.ddls.asddls` |

## Purpose

Maintenance order with planning data, reference object, account assignment, main work center (business key) and the status flags that decide the migration scope.

## Keys

- `MaintenanceOrder`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Read the open orders: filter IsTechnicallyCompleted = '', IsClosed = '' and IsMarkedForDeletion = ''.

## Open verification items

none
