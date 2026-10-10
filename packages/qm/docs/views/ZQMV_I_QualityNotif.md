# ZQMV_I_QualityNotif

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Quality Notification |
| Module | `quality_notification` |
| Batch | 3 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | #DIMENSION |
| Data source | `I_QualityNotification` |
| Source file | `src/zqmv_i_qualitynotif.ddls.asddls` |

## Purpose

One row per quality notification: type (supplier, internal, customer complaint), text, priority, processing phase, material, plant, batch, supplier, customer, inspection lot and dates; derived open flag.

## Keys

- `QualityNotification`

## Associations defined here

- `_Plant` → `I_Plant` [0..1]

## Access control

Role inherits the conditions of `I_QualityNotification`.

## Example use case

Open supplier complaints per plant; customer complaints per material.

## Open verification items

`QM-020`, `QM-021`, `QM-022`, `QM-D03` - see `BATCH_REPORT.md`.
