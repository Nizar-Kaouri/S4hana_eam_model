# ZPSX_B_AnnualBudgetData

> Version **1.0.0**

| | |
|---|---|
| Description | AnnualBudgetData |
| Module | `budget` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `bpja` |
| Source file | `src/zpsx_b_annualbudgetdata.ddls.asddls` |

## Purpose

Read AnnualBudgetData as source records; approve the key-date population before posting.

## Keys

- `Ledger`
- `ObjectNumber`
- `BudgetItem`
- `TransactionIndicator`
- `ValueType`
- `Version`
- `FiscalYear`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
