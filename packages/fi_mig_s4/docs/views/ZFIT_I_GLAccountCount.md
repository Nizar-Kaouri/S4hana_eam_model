# ZFIT_I_GLAccountCount

> Version **1.0.0**

| | |
|---|---|
| Description | GLAccountCount |
| Module | `gl_account` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | - |
| Data source | `ZFIT_B_GLAccountCompare` |
| Source file | `src/zfit_i_glaccountcount.ddls.asddls` |

## Purpose

Read GLAccountCount as target comparison records.

## Keys

- `ChartOfAccounts`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
