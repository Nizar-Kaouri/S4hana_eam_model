# ZFIX_C_AccountingHeadMigCount

> Version **1.0.0**

| | |
|---|---|
| Description | AccountingHeadMigCount |
| Module | `gl_line_item` |
| Batch | 1 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZFIX_C_AccountingHeadMig` |
| Source file | `src/zfix_c_accountingheadmigcount.ddls.asddls` |

## Purpose

Read AccountingHeadMigCount as source records; approve the key-date population before posting.

## Keys

- `CompanyCode`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
