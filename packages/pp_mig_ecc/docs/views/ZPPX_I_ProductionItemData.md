# ZPPX_I_ProductionItemData

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | ProductionItemData |
| Module | `production_order` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `afpo` |
| Source file | `src/zppx_i_productionitemdata.ddls.asddls` |

## Purpose

Read ProductionItemData as source candidates; approve the key-date population before posting.

## Keys

- `ManufacturingOrder`
- `ManufacturingOrderItem`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.

## Open verification items

`PPX-003` - see `BATCH_REPORT.md`.
