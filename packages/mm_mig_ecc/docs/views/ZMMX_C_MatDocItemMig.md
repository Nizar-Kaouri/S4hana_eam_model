# ZMMX_C_MatDocItemMig

> Version **1.0.0**

| | |
|---|---|
| Description | MatDocItemMig |
| Module | `goods_movement` |
| Batch | 1 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZMMX_I_MatDocItem` |
| Source file | `src/zmmx_c_matdocitemmig.ddls.asddls` |

## Purpose

Read MatDocItemMig as source records; approve the key-date population before posting.

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
