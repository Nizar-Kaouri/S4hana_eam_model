# ZEMX_I_MaintPlanCycle

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Maintenance plan cycle (migration extract) |
| Module | `maintenance_plan` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #DIMENSION |
| Data source | `mmpt` |
| Source file | `src/zemx_i_maintplancycle.ddls.asddls` |

## Purpose

Cycles of single-cycle and multiple-counter plans and packages of strategy plans: cycle value, unit, text and counter (measuring point) for performance-based cycles.

## Keys

- `warpl`
- `nummer`

## Associations defined here

- none

## Access control

No DCL by design: Migration extraction/reconciliation view on ECC: it must return every record of the object. Access is controlled by the extraction channel (ODP/RFC user, S_TABU_NAM / S_TABU_DIS), not by CDS access control (decision XGEN-D01).

## Example use case

Extract the performance-based cycles: filter MeasuringPoint <> ''.

## Open verification items

`XPL-005` - see `BATCH_REPORT.md`.
