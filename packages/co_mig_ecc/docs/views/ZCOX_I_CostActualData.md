# ZCOX_I_CostActualData

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | CostActualData |
| Module | `cost_actuals` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `coep` |
| Source file | `src/zcox_i_costactualdata.ddls.asddls` |

## Purpose

Read CostActualData as source candidates; approve the key-date population before posting.

## Keys

- `ControllingArea`
- `COAccountingDocument`
- `COAccountingDocumentItem`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.

## Open verification items

`COX-007` - see `BATCH_REPORT.md`.
