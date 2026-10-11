# ZEMX_I_MaintenanceItem

> Version **1.0.0**

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

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Read the items of the plans of plant 1000.
