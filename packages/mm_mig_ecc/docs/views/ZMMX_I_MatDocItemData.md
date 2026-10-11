# ZMMX_I_MatDocItemData

> Version **1.0.0**

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

Read MatDocItemData as source records; approve the key-date population before posting.

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
