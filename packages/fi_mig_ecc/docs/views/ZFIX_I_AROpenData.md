# ZFIX_I_AROpenData

> Version **1.0.0**

| | |
|---|---|
| Description | AROpenData |
| Module | `open_items` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `bsid` |
| Source file | `src/zfix_i_aropendata.ddls.asddls` |

## Purpose

Read AROpenData as source records; approve the key-date population before posting.

## Keys

- `CompanyCode`
- `Customer`
- `SpecialGLTransactionType`
- `SpecialGLCode`
- `ClearingDate`
- `ClearingDocument`
- `AssignmentReference`
- `FiscalYear`
- `AccountingDocument`
- `AccountingDocumentItem`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
