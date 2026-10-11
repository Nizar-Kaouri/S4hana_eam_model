# ZEMX_C_MaintOrderMig

> Version **1.0.0**

| | |
|---|---|
| Description | Maintenance order (migration) |
| Module | `maintenance_order` |
| Batch | 2 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_I_MaintOrder` |
| Source file | `src/zemx_c_maintordermig.ddls.asddls` |

## Purpose

Open maintenance orders (not technically completed, not closed, not deleted).

## Keys

- `MaintenanceOrder`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

The load program creates one order per row.
