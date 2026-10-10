# ZPPT_I_ProductionOrdeCompare

> Status: **draft-unverified** · tested release: none (draft, S/4HANA 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | ProductionOrdeCompare |
| Module | `production_order` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `I_ManufacturingOrder` |
| Source file | `src/zppt_i_productionordecompare.ddls.asddls` |

## Purpose

Read ProductionOrdeCompare as target comparison candidates.

## Keys

- `ManufacturingOrder`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.

## Open verification items

`PPT-001` - see `BATCH_REPORT.md`.
