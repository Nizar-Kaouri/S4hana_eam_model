# ZFIX_I_GLAccount

> Version **1.0.0**

| | |
|---|---|
| Description | GLAccount |
| Module | `gl_account` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZFIX_B_GLAccountData` |
| Source file | `src/zfix_i_glaccount.ddls.asddls` |

## Purpose

Read GLAccount as source records; approve the key-date population before posting.

## Keys

- `ChartOfAccounts`
- `GLAccount`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
