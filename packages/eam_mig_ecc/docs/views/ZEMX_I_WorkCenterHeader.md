# ZEMX_I_WorkCenterHeader

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Work center header |
| Module | `work_center` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #DIMENSION |
| Data source | `crhd` |
| Source file | `src/zemx_i_workcenterheader.ddls.asddls` |

## Purpose

Work centers of object type 'A' (CRHD) with plant, category, responsible person, validity and deletion flag.

## Keys

- `objid`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Read the work centers of plant 1000: filter Plant = '1000'.

## Open verification items

`XWC-001`, `XWC-002`, `XWC-003` - see `BATCH_REPORT.md`.
