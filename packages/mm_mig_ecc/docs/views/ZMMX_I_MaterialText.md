# ZMMX_I_MaterialText

> Version **1.0.0**

| | |
|---|---|
| Description | MaterialText |
| Module | `product` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZMMX_B_MaterialTextData` |
| Source file | `src/zmmx_i_materialtext.ddls.asddls` |

## Purpose

Read MaterialText as source records; approve the key-date population before posting.

## Keys

- `Product`
- `Language`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
