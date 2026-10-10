# ZEMX_C_WorkCenterTextMig

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Work center text (migration) |
| Module | `work_center` |
| Batch | 2 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_I_WorkCenterText`, join `ZEMX_I_MigrationMap`, join `ZEMX_I_MigrationMap` |
| Source file | `src/zemx_c_workcentertextmig.ddls.asddls` |

## Purpose

Work center descriptions per language for the work centers in scope, business key translated.

## Keys

- `WorkCenter`
- `Plant`
- `Language`

## Associations defined here

- none

## Access control

No DCL by design: Migration view on ECC: it must return every record of the object. Access is controlled by the user / RFC user of the load program and the extraction channel (S_TABU_NAM), not by CDS access control (decision XGEN-D01; CDS access control also needs a newer release than the 7.40 SP08 baseline).

## Example use case

Read the texts of work center MECH-01: filter LegacyWorkCenter = 'MECH-01'.

## Open verification items

`MECH-01` - see `BATCH_REPORT.md`.
