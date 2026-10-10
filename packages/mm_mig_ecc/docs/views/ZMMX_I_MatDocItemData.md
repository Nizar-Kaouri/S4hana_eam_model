# ZMMX_I_MatDocItemData

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | MatDocItemData |
| Module | `goods_movement` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `mseg` |
| Source file | `src/zmmx_i_matdocitemdata.ddls.asddls` |

## Purpose

Read MatDocItemData as source candidates; approve the key-date population before posting.

## Keys

- `MaterialDocument`
- `MaterialDocumentYear`
- `MaterialDocumentItem`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.

## Open verification items

`MMX-014` - see `BATCH_REPORT.md`.
