# ZMMX_I_MaterialData

> Version **1.0.0**

| | |
|---|---|
| Description | MaterialData |
| Module | `product` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `mara` |
| Source file | `src/zmmx_i_materialdata.ddls.asddls` |

## Purpose

Read MaterialData as source records; approve the key-date population before posting.

## Keys

- `Product`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
