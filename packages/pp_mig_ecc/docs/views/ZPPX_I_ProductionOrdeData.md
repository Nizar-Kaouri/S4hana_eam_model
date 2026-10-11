# ZPPX_I_ProductionOrdeData

> Version **1.0.0**

| | |
|---|---|
| Description | ProductionOrdeData |
| Module | `production_order` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `aufk` |
| Source file | `src/zppx_i_productionordedata.ddls.asddls` |

## Purpose

Read ProductionOrdeData as source records; approve the key-date population before posting.

## Keys

- `ManufacturingOrder`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
