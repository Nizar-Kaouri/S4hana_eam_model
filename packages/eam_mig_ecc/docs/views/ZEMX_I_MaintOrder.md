# ZEMX_I_MaintOrder

> Version **1.0.0**

| | |
|---|---|
| Description | Maintenance order |
| Module | `maintenance_order` |
| Batch | 2 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | #FACT |
| Data source | `ZEMX_B_OrderMasterData`, join `ZEMX_B_OrderMaintData`, join `ZEMX_B_OrderHeaderPlanning` |
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
