# ZEAM_B_MaintNotif

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Maintenance Notification |
| Module | `maintenance_notification` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | #DIMENSION |
| Data source | `I_MaintenanceNotification` |
| Source file | `src/zeam_b_maintnotif.ddls.asddls` |

## Purpose

One row per maintenance notification with type, priority, processing phase, malfunction period, breakdown indicator, reference objects (as plain fields) and planning data; analytical dimension for every cube that references a notification.

## Keys

- `MaintenanceNotification`

## Associations defined here

- `_MaintenancePlant` → `I_Plant` [0..1]
- `_MaintenancePlanningPlant` → `I_Plant` [0..1]

## Access control

Role inherits the conditions of `I_MaintenanceNotification`.

## Example use case

Feed the downtime / MTBF reports (Batch 4) or list open breakdown notifications per plant.

## Open verification items

`GEN-C01`, `NT-001`, `NT-002`, `NT-003`, `NT-004`, `NT-005`, `NT-006`, `NT-007`, `NT-008`, `NT-D01` - see `BATCH_REPORT.md`.
