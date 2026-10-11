# ZEMX_C_WorkCenterTextMig

> Version **1.0.0**

| | |
|---|---|
| Description | Work center text (migration) |
| Module | `work_center` |
| Batch | 2 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_I_WorkCenterText` |
| Source file | `src/zemx_c_workcentertextmig.ddls.asddls` |

## Purpose

Work center descriptions per language for the work centers in scope with the business key (work center + plant).

## Keys

- `WorkCenter`
- `Plant`
- `Language`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Read the texts of work center MECH-01: filter WorkCenter = 'MECH-01'.
