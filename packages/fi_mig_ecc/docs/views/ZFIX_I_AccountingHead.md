# ZFIX_I_AccountingHead

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | AccountingHead |
| Module | `gl_line_item` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZFIX_I_AccountingHeadData` |
| Source file | `src/zfix_i_accountinghead.ddls.asddls` |

## Purpose

Read AccountingHead as source candidates; approve the key-date population before posting.

## Keys

- `CompanyCode`
- `AccountingDocument`
- `FiscalYear`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.

## Open verification items

none
