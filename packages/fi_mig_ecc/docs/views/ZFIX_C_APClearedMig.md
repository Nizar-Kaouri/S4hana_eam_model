# ZFIX_C_APClearedMig

> Version **1.0.0**

| | |
|---|---|
| Description | APClearedMig |
| Module | `open_items` |
| Batch | 1 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZFIX_I_APCleared` |
| Source file | `src/zfix_c_apclearedmig.ddls.asddls` |

## Purpose

Read APClearedMig as source records; approve the key-date population before posting.

## Keys

- `CompanyCode`
- `Supplier`
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
