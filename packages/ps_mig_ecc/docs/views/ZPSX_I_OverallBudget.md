# ZPSX_I_OverallBudget

> Version **1.0.0**

| | |
|---|---|
| Description | OverallBudget |
| Module | `budget` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZPSX_I_OverallBudgetData` |
| Source file | `src/zpsx_i_overallbudget.ddls.asddls` |

## Purpose

Read OverallBudget as source records; approve the key-date population before posting.

## Keys

- `Ledger`
- `ObjectNumber`
- `BudgetItem`
- `TransactionIndicator`
- `ValueType`
- `Version`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
