# ZEMX_I_WorkCenterDesc

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Work center description |
| Module | `work_center` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #TEXT |
| Data source | `crtx` |
| Source file | `src/zemx_i_workcenterdesc.ddls.asddls` |

## Purpose

Work center descriptions (CRTX) per language for object type 'A'.

## Keys

- `WorkCenterInternalID`
- `Language`

## Associations defined here

- `_WorkCenter` → `ZEMX_I_WorkCenterHeader` [0..1]

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Read the English description of work center object 10000001.

## Open verification items

none
