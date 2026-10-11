# ZEMX_B_MaintenanceItemHeader

> Version **1.0.0**

| | |
|---|---|
| Description | Maintenance item header |
| Module | `maintenance_plan` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #DIMENSION |
| Data source | `mpos` |
| Source file | `src/zemx_b_maintenanceitemheader.ddls.asddls` |

## Purpose

Maintenance items (MPOS) with reference object, planning data, order / notification type and task list.

## Keys

- `MaintenanceItem`

## Associations defined here

- `_LocAcctAssignment` → `ZEMX_B_LocAcctAssignment` [0..1]
- `_MainWorkCenter` → `ZEMX_B_WorkCenterHeader` [0..1]

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Read the items of maintenance plan 100.
