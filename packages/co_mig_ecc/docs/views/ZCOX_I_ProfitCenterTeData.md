# ZCOX_I_ProfitCenterTeData

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | ProfitCenterTeData |
| Module | `profit_center` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `cepct` |
| Source file | `src/zcox_i_profitcentertedata.ddls.asddls` |

## Purpose

Read ProfitCenterTeData as source candidates; approve the key-date population before posting.

## Keys

- `Language`
- `ProfitCenter`
- `ValidityEndDate`
- `ControllingArea`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.

## Open verification items

`COX-004` - see `BATCH_REPORT.md`.
