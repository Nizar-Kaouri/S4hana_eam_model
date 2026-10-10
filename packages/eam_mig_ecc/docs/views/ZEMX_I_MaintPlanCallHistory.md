# ZEMX_I_MaintPlanCallHistory

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Maintenance plan call history |
| Module | `maintenance_plan` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #FACT |
| Data source | `mhis` |
| Source file | `src/zemx_i_maintplancallhistory.ddls.asddls` |

## Purpose

Scheduled and completed calls per maintenance plan (MHIS).

## Keys

- `warpl`
- `abnum`

## Associations defined here

- none

## Access control

No DCL by design: Migration view on ECC: it must return every record of the object. Access is controlled by the user / RFC user of the load program and the extraction channel (S_TABU_NAM), not by CDS access control (decision XGEN-D01; CDS access control also needs a newer release than the 7.40 SP08 baseline).

## Example use case

Read the calls of plan 100.

## Open verification items

`XPL-006` - see `BATCH_REPORT.md`.
