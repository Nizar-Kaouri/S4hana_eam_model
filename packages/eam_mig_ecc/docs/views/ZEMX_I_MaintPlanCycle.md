# ZEMX_I_MaintPlanCycle

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Maintenance plan cycle |
| Module | `maintenance_plan` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #DIMENSION |
| Data source | `mmpt` |
| Source file | `src/zemx_i_maintplancycle.ddls.asddls` |

## Purpose

Cycles of single-cycle and multiple-counter plans and packages of strategy plans (MMPT).

## Keys

- `warpl`
- `nummer`

## Associations defined here

- none

## Access control

No DCL by design: Migration view on ECC: it must return every record of the object. Access is controlled by the user / RFC user of the load program and the extraction channel (S_TABU_NAM), not by CDS access control (decision XGEN-D01; CDS access control also needs a newer release than the 7.40 SP08 baseline).

## Example use case

Read the performance-based cycles: filter MeasuringPoint <> ''.

## Open verification items

`XPL-005` - see `BATCH_REPORT.md`.
