# ZEMX_I_MaintenanceItemHeader

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Maintenance item header |
| Module | `maintenance_plan` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #DIMENSION |
| Data source | `mpos` |
| Source file | `src/zemx_i_maintenanceitemheader.ddls.asddls` |

## Purpose

Maintenance items (MPOS) with reference object, planning data, order / notification type and task list.

## Keys

- `MaintenanceItem`

## Associations defined here

- `_LocAcctAssignment` → `ZEMX_I_LocAcctAssignment` [0..1]
- `_MainWorkCenter` → `ZEMX_I_WorkCenterHeader` [0..1]

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Read the items of maintenance plan 100.

## Open verification items

`XPL-003`, `XPL-004` - see `BATCH_REPORT.md`.
