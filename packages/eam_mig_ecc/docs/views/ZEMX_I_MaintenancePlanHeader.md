# ZEMX_I_MaintenancePlanHeader

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Maintenance plan header |
| Module | `maintenance_plan` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #DIMENSION |
| Data source | `mpla` |
| Source file | `src/zemx_i_maintenanceplanheader.ddls.asddls` |

## Purpose

Maintenance plans (MPLA) with category, strategy and scheduling parameters.

## Keys

- `MaintenancePlan`

## Associations defined here

- `_DeletionFlag` → `ZEMX_I_StatusDeletionFlag` [0..1]

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Read the strategy plans: filter MaintenanceStrategy <> ''.

## Open verification items

`XPL-001`, `XPL-002` - see `BATCH_REPORT.md`.
