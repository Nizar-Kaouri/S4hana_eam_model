# ZEMX_I_FuncLocDesc

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Functional location description |
| Module | `functional_location` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #TEXT |
| Data source | `iflotx` |
| Source file | `src/zemx_i_funclocdesc.ddls.asddls` |

## Purpose

Functional location descriptions (IFLOTX) per language with the long-text indicator.

## Keys

- `tplnr`
- `spras`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Read the German description of FL 1000-PUMP-01.

## Open verification items

`PUMP-01` - see `BATCH_REPORT.md`.
