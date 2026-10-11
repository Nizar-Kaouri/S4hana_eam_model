# ZFIX_I_GLOpen

> Version **1.0.0**

| | |
|---|---|
| Description | GLOpen |
| Module | `open_items` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZFIX_B_GLOpenData` |
| Source file | `src/zfix_i_glopen.ddls.asddls` |

## Purpose

Read GLOpen as source records; approve the key-date population before posting.

## Keys

- `CompanyCode`
- `GLAccount`
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
