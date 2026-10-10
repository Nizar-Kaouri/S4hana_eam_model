# ZFIX_I_ARClearedData

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | ARClearedData |
| Module | `open_items` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `bsad` |
| Source file | `src/zfix_i_arcleareddata.ddls.asddls` |

## Purpose

Read ARClearedData as source candidates; approve the key-date population before posting.

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

## Open verification items

`FIX-017` - see `BATCH_REPORT.md`.
