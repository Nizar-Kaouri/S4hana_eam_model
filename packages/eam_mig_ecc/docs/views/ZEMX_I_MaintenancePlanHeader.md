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

- `warpl`

## Associations defined here

- none

## Access control

No DCL by design: Migration view on ECC: it must return every record of the object. Access is controlled by the user / RFC user of the load program and the extraction channel (S_TABU_NAM), not by CDS access control (decision XGEN-D01; CDS access control also needs a newer release than the 7.40 SP08 baseline).

## Example use case

Read the strategy plans: filter MaintenanceStrategy <> ''.

## Open verification items

`XPL-001`, `XPL-002` - see `BATCH_REPORT.md`.
