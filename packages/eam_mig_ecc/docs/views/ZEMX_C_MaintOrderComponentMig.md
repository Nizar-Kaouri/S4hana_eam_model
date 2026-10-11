# ZEMX_C_MaintOrderComponentMig

> Version **1.0.0**

| | |
|---|---|
| Description | Maintenance order component (migration) |
| Module | `maintenance_order` |
| Batch | 2 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_I_MaintOrderComponent` |
| Source file | `src/zemx_c_maintordercomponentmig.ddls.asddls` |

## Purpose

Open components (not deleted, not finally issued) of the open orders with material, plant and storage location.

## Keys

- `MaintenanceOrder`
- `ReservationItem`

## Associations defined here

- `_MaintOrder` → `ZEMX_I_MaintOrder` [0..1]

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

The load program adds the components to the operations of the migrated order.
