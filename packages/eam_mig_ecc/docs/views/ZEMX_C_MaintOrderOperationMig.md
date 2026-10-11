# ZEMX_C_MaintOrderOperationMig

> Version **1.0.0**

| | |
|---|---|
| Description | Maintenance order operation (migration) |
| Module | `maintenance_order` |
| Batch | 2 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_I_MaintOrderOperation` |
| Source file | `src/zemx_c_maintorderoperationmig.ddls.asddls` |

## Purpose

Operations of the open orders with work center, control key, activity type and units.

## Keys

- `MaintenanceOrder`
- `MaintenanceOrderOperation`
- `MaintenanceOrderSubOperation`

## Associations defined here

- `_MaintOrder` → `ZEMX_I_MaintOrder` [0..1]

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

The load program adds the operations to the order created from ZEMX_C_MaintOrderMig.
