# ZEMX_I_FuncLocLabelData

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | FuncLocLabel source data |
| Module | `functional_location` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `iflos` |
| Source file | `src/zemx_i_funcloclabeldata.ddls.asddls` |

## Purpose

FuncLocLabel source data

## Keys

- `tplnr`
- `altnr`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Export the selected migration scope; validate keys and row counts before loading.

## Open verification items

`XADD-50` - see `BATCH_REPORT.md`.
