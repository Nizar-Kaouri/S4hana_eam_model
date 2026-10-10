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

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Read the calls of plan 100.

## Open verification items

`XPL-006` - see `BATCH_REPORT.md`.
