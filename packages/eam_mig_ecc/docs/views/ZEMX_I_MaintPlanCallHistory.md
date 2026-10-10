# ZEMX_I_MaintPlanCallHistory

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Maintenance plan call history (migration extract) |
| Module | `maintenance_plan` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #FACT |
| Data source | `mhis` |
| Source file | `src/zemx_i_maintplancallhistory.ddls.asddls` |

## Purpose

Scheduled and completed calls per maintenance plan: needed to set the start / last completion date so that the schedule continues seamlessly after go-live.

## Keys

- `warpl`
- `abnum`

## Associations defined here

- none

## Access control

No DCL by design: Migration extraction/reconciliation view on ECC: it must return every record of the object. Access is controlled by the extraction channel (ODP/RFC user, S_TABU_NAM / S_TABU_DIS), not by CDS access control (decision XGEN-D01).

## Example use case

Find the last completed call of plan 100: filter MaintenancePlan = '000000000100', highest CallNumber with a CompletionDate.

## Open verification items

`XPL-006` - see `BATCH_REPORT.md`.
