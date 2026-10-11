# ZWMT_B_WarehouseTaskCompare

> Status: **draft-unverified** · tested release: none (native DDIC and SAP activation pending). Nothing below has been activated on a system.

| | |
|---|---|
| Description | WarehouseTaskCompare |
| Module | `warehouse_task` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `/scwm/ordim_o` |
| Source file | `src/zwmt_b_warehousetaskcompare.ddls.asddls` |

## Purpose

Read WarehouseTaskCompare as target comparison candidates.

## Keys

- `Warehouse`
- `WarehouseTask`

## Associations defined here

- none

## Access control

No DCL by design: Read-only native extraction without DCL. Restrict and test authorized CDS extraction channels and current-client isolation. Table display authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.

## Open verification items

`WMT-009` - see `BATCH_REPORT.md`.
