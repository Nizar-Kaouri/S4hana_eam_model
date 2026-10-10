# ZPPT_I_ProductionOrdeCount

> Status: **draft-unverified** · tested release: none (draft, S/4HANA 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | ProductionOrdeCount |
| Module | `production_order` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | - |
| Data source | `ZPPT_I_ProductionOrdeCompare` |
| Source file | `src/zppt_i_productionordecount.ddls.asddls` |

## Purpose

Read ProductionOrdeCount as target comparison candidates.

## Keys

- `ManufacturingOrder`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.

## Open verification items

none
