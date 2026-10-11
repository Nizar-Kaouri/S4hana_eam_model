# ZMMX_B_MaterialPlantData

> Version **1.0.0**

| | |
|---|---|
| Description | MaterialPlantData |
| Module | `product` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `marc` |
| Source file | `src/zmmx_b_materialplantdata.ddls.asddls` |

## Purpose

Read MaterialPlantData as source records; approve the key-date population before posting.

## Keys

- `Product`
- `Plant`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
