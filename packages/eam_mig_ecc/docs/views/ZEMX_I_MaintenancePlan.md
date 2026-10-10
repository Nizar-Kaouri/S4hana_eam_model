# ZEMX_I_MaintenancePlan

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Maintenance plan (migration extract) |
| Module | `maintenance_plan` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #DIMENSION |
| Data source | `mpla`, join `jest` |
| Source file | `src/zemx_i_maintenanceplan.ddls.asddls` |

## Purpose

One row per maintenance plan with category, strategy and the scheduling parameters needed to continue the schedule on S/4HANA.

## Keys

- `warpl`

## Associations defined here

- none

## Access control

No DCL by design: Migration extraction/reconciliation view on ECC: it must return every record of the object. Access is controlled by the extraction channel (ODP/RFC user, S_TABU_NAM / S_TABU_DIS), not by CDS access control (decision XGEN-D01).

## Example use case

Extract all strategy plans: filter MaintenanceStrategy <> ''.

## Open verification items

`XPL-001`, `XPL-002` - see `BATCH_REPORT.md`.
