# ZEMX_I_MaintenanceItem

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Maintenance item (migration extract) |
| Module | `maintenance_plan` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #DIMENSION |
| Data source | `mpos`, join `iloa`, join `crhd` |
| Source file | `src/zemx_i_maintenanceitem.ddls.asddls` |

## Purpose

Maintenance items with reference object, planning data, order / notification type and the assigned task list.

## Keys

- `wapos`

## Associations defined here

- none

## Access control

No DCL by design: Migration extraction/reconciliation view on ECC: it must return every record of the object. Access is controlled by the extraction channel (ODP/RFC user, S_TABU_NAM / S_TABU_DIS), not by CDS access control (decision XGEN-D01).

## Example use case

Extract the items of the plans in scope: join on MaintenancePlan with ZEMX_I_MaintenancePlan.

## Open verification items

`XPL-003`, `XPL-004` - see `BATCH_REPORT.md`.
