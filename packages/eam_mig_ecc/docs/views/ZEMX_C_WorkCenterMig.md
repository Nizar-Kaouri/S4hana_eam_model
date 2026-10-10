# ZEMX_C_WorkCenterMig

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Work center (migration) |
| Module | `work_center` |
| Batch | 2 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_I_WorkCenterHeader` |
| Source file | `src/zemx_c_workcentermig.ddls.asddls` |

## Purpose

Work centers to migrate (not flagged for deletion) with plant, category and responsible person.

## Keys

- `WorkCenter`
- `Plant`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

The load program reads all rows and creates one work center per row; WorkCenter / Plant identify the record.

## Open verification items

none
