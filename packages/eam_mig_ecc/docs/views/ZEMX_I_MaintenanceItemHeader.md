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

- `wapos`

## Associations defined here

- none

## Access control

No DCL by design: Migration view on ECC: it must return every record of the object. Access is controlled by the user / RFC user of the load program and the extraction channel (S_TABU_NAM), not by CDS access control (decision XGEN-D01; CDS access control also needs a newer release than the 7.40 SP08 baseline).

## Example use case

Read the items of maintenance plan 100.

## Open verification items

`XPL-003`, `XPL-004` - see `BATCH_REPORT.md`.
