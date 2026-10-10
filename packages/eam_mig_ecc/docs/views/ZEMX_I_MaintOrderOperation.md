# ZEMX_I_MaintOrderOperation

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Maintenance order operation |
| Module | `maintenance_order` |
| Batch | 2 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | #FACT |
| Data source | `ZEMX_I_OrderOperationData`, join `ZEMX_I_OrderOperationValues`, join `ZEMX_I_OrderHeaderPlanning` |
| Source file | `src/zemx_i_maintorderoperation.ddls.asddls` |

## Purpose

Operations of maintenance orders with quantities and the work center as business key.

## Keys

- `MaintenanceOrder`
- `OrderOperationInternalID`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Read the operations of order 4000001.

## Open verification items

none
