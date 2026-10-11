# ZEAM_I_NotifDowntime

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Downtime and Breakdown - Cube |
| Module | `rpt_downtime` |
| Batch | 4 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | #CUBE |
| Data source | `ZEAM_B_NotifDowntime` |
| Source file | `src/zeam_i_notifdowntime.ddls.asddls` |

## Purpose

Downtime cube: number of malfunctions and breakdowns, total and breakdown downtime in hours, by plant, technical object, notification type and malfunction month.

## Keys

- `MaintenanceNotification`

## Associations defined here

- `_MaintenanceNotification` → `ZEAM_B_MaintNotif` [1..1]

## Access control

Role inherits the conditions of `ZEAM_B_NotifDowntime`.

## Example use case

Top 10 equipment by breakdown hours in the last quarter; downtime trend per month and plant.

## Open verification items

none
