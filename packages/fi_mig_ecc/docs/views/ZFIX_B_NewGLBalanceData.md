# ZFIX_B_NewGLBalanceData

> Version **1.0.0**

| | |
|---|---|
| Description | NewGLBalanceData |
| Module | `gl_opening_balance` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `faglflext` |
| Source file | `src/zfix_b_newglbalancedata.ddls.asddls` |

## Purpose

Read NewGLBalanceData as source records; approve the key-date population before posting.

## Keys

- `Ledger`
- `RecordType`
- `Version`
- `FiscalYear`
- `GLAccount`
- `CompanyCode`
- `CostCenter`
- `ProfitCenter`
- `FunctionalArea`
- `BusinessArea`
- `Segment`
- `PartnerCostCenter`
- `PartnerProfitCenter`
- `PartnerFunctionalArea`
- `PartnerBusinessArea`
- `TradingPartner`
- `PartnerSegment`
- `TransactionCurrency`
- `BaseUnit`
- `DebitCreditCode`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
