# ZFIX_B_BankData

> Version **1.0.0**

| | |
|---|---|
| Description | BankData |
| Module | `bank` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `bnka` |
| Source file | `src/zfix_b_bankdata.ddls.asddls` |

## Purpose

Read BankData as source records; approve the key-date population before posting.

## Keys

- `BankCountry`
- `BankKey`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
