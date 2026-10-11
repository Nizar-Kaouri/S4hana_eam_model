# ZPPT_I_ProductionOrdeCount

> Version **1.0.0**

| | |
|---|---|
| Description | ProductionOrdeCount |
| Module | `production_order` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | - |
| Data source | `ZPPT_B_ProductionOrdeCompare` |
| Source file | `src/zppt_i_productionordecount.ddls.asddls` |

## Purpose

Read ProductionOrdeCount as target comparison records.

## Keys

- `ManufacturingOrder`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
