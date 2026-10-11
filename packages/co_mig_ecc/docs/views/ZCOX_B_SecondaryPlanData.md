# ZCOX_B_SecondaryPlanData

> Version **1.0.0**

| | |
|---|---|
| Description | SecondaryPlanData |
| Module | `planning` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `coss` |
| Source file | `src/zcox_b_secondaryplandata.ddls.asddls` |

## Purpose

Read SecondaryPlanData as source records; approve the key-date population before posting.

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
