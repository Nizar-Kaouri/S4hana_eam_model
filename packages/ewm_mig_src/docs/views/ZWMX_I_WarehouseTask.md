# ZWMX_I_WarehouseTask

> Status: **draft-unverified** · tested release: none (native DDIC and SAP activation pending). Nothing below has been activated on a system.

| | |
|---|---|
| Description | WarehouseTask |
| Module | `warehouse_task` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZWMX_B_WarehouseTaskData` |
| Source file | `src/zwmx_i_warehousetask.ddls.asddls` |

## Purpose

Read WarehouseTask as source candidates; approve the key-date population before posting.

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

none
