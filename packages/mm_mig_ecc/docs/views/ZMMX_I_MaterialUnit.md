# ZMMX_I_MaterialUnit

> Version **1.0.0**

| | |
|---|---|
| Description | MaterialUnit |
| Module | `product` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZMMX_B_MaterialUnitData` |
| Source file | `src/zmmx_i_materialunit.ddls.asddls` |

## Purpose

Read MaterialUnit as source records; approve the key-date population before posting.

## Keys

- `Product`
- `AlternativeUnit`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
