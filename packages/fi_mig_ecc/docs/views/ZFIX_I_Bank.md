# ZFIX_I_Bank

> Version **1.0.0**

| | |
|---|---|
| Description | Bank |
| Module | `bank` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZFIX_B_BankData` |
| Source file | `src/zfix_i_bank.ddls.asddls` |

## Purpose

Read Bank as source records; approve the key-date population before posting.

## Keys

- `BankCountry`
- `BankKey`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
