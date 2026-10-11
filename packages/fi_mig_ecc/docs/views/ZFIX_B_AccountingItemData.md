# ZFIX_B_AccountingItemData

> Version **1.0.0**

| | |
|---|---|
| Description | AccountingItemData |
| Module | `gl_line_item` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `bseg` |
| Source file | `src/zfix_b_accountingitemdata.ddls.asddls` |

## Purpose

Read AccountingItemData as source records; approve the key-date population before posting.

## Keys

- `CompanyCode`
- `AccountingDocument`
- `FiscalYear`
- `AccountingDocumentItem`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
