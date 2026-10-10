# ZCOX_I_SecondaryPlanData

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | SecondaryPlanData |
| Module | `planning` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `coss` |
| Source file | `src/zcox_i_secondaryplandata.ddls.asddls` |

## Purpose

Read SecondaryPlanData as source candidates; approve the key-date population before posting.

## Keys

- `Ledger`
- `ObjectNumber`
- `FiscalYear`
- `ValueType`
- `PlanVersion`
- `CostElement`
- `OriginGroup`
- `BusinessTransaction`
- `TradingPartner`
- `PartnerBusinessArea`
- `DebitCreditCode`
- `PeriodBlock`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.

## Open verification items

`COX-011` - see `BATCH_REPORT.md`.
