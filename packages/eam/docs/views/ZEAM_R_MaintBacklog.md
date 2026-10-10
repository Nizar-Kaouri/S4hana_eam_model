# ZEAM_R_MaintBacklog

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Maintenance Backlog - Cube |
| Module | `rpt_backlog` |
| Batch | 4 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | #CUBE |
| Data source | `ZEAM_I_MaintOrderOperation` |
| Source file | `src/zeam_r_maintbacklog.ddls.asddls` |

## Purpose

Backlog cube over the operations of open maintenance orders: planned and remaining work, number of open orders (distinct), order age in days and an age bucket, by work center, plant, order type and priority.

## Keys

- `MaintenanceOrder`
- `MaintenanceOrderOperation`
- `MaintenanceOrderSubOperation`

## Associations defined here

- none

## Access control

Role inherits the conditions of `ZEAM_I_MaintOrderOperation`.

## Example use case

Backlog in weeks per work center (remaining hours / weekly capacity); orders older than 90 days.

## Open verification items

`RPT-B01`, `RPT-B02` - see `BATCH_REPORT.md`.
