# ZFIT_I_GLAccountCompare

> Version **1.0.0**

| | |
|---|---|
| Description | GLAccountCompare |
| Module | `gl_account` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `I_GLAccountInChartOfAccounts` |
| Source file | `src/zfit_i_glaccountcompare.ddls.asddls` |

## Purpose

Read GLAccountCompare as target comparison records.

## Keys

- `ChartOfAccounts`
- `GLAccount`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
