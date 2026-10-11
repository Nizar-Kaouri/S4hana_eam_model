# ZFIX_B_ClassicBalanceData

> Version **1.0.0**

| | |
|---|---|
| Description | ClassicBalanceData |
| Module | `gl_opening_balance` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `glt0` |
| Source file | `src/zfix_b_classicbalancedata.ddls.asddls` |

## Purpose

Read ClassicBalanceData as source records; approve the key-date population before posting.

## Keys

- `Ledger`
- `RecordType`
- `Version`
- `CompanyCode`
- `FiscalYear`
- `GLAccount`
- `BusinessArea`
- `TransactionCurrency`
- `DebitCreditCode`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
