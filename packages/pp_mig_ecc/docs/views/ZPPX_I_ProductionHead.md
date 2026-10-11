# ZPPX_I_ProductionHead

> Version **1.0.0**

| | |
|---|---|
| Description | ProductionHead |
| Module | `production_order` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZPPX_I_ProductionHeadData` |
| Source file | `src/zppx_i_productionhead.ddls.asddls` |

## Purpose

Read ProductionHead as source records; approve the key-date population before posting.

## Keys

- `ManufacturingOrder`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
