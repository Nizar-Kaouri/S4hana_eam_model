# ZCOX_C_PrimaryPlanMig

> Version **1.0.0**

| | |
|---|---|
| Description | PrimaryPlanMig |
| Module | `planning` |
| Batch | 1 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZCOX_I_PrimaryPlan` |
| Source file | `src/zcox_c_primaryplanmig.ddls.asddls` |

## Purpose

Read PrimaryPlanMig as source records; approve the key-date population before posting.

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
