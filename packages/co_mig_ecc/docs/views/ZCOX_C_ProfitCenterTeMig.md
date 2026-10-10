# ZCOX_C_ProfitCenterTeMig

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | ProfitCenterTeMig |
| Module | `profit_center` |
| Batch | 1 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZCOX_I_ProfitCenterTe` |
| Source file | `src/zcox_c_profitcentertemig.ddls.asddls` |

## Purpose

Read ProfitCenterTeMig as source candidates; approve the key-date population before posting.

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

none
