# ZPPX_B_ProductionItemData

> Version **1.0.0**

| | |
|---|---|
| Description | ProductionItemData |
| Module | `production_order` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `afpo` |
| Source file | `src/zppx_b_productionitemdata.ddls.asddls` |

## Purpose

Read ProductionItemData as source records; approve the key-date population before posting.

## Keys

- `ManufacturingOrder`
- `ManufacturingOrderItem`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
