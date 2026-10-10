# ZFIX_I_ClassicBalanceData

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | ClassicBalanceData |
| Module | `gl_opening_balance` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `glt0` |
| Source file | `src/zfix_i_classicbalancedata.ddls.asddls` |

## Purpose

Read ClassicBalanceData as source candidates; approve the key-date population before posting.

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

## Open verification items

`FIX-019` - see `BATCH_REPORT.md`.
