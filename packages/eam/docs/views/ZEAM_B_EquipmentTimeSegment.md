# ZEAM_B_EquipmentTimeSegment

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Equipment Time Segment |
| Module | `equipment_history` |
| Batch | 5 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `I_Equipment` |
| Source file | `src/zeam_b_equipmenttimesegment.ddls.asddls` |

## Purpose

All time segments of an equipment (usage history): validity period, installation location (functional location / superordinate equipment) and organizational assignment per segment.

## Keys

- `Equipment`
- `ValidityEndDate`

## Associations defined here

- `_Equipment` → `ZEAM_B_Equipment` [1..1]

## Access control

Role inherits the conditions of `I_Equipment`.

## Example use case

Where was pump P-100 installed in 2025, and for how long? Installation history per functional location.

## Open verification items

`EQ-001`, `EQ-010`, `EQ-019` - see `BATCH_REPORT.md`.
