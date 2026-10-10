# ZEAM_R_Equipment

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Equipment - Cube |
| Module | `equipment` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | #CUBE |
| Data source | `ZEAM_I_Equipment` |
| Source file | `src/zeam_r_equipment.ddls.asddls` |

## Purpose

Cube over the equipment population with measures NumberOfEquipments and AcquisitionValue (per currency).

## Keys

- `Equipment`

## Associations defined here

- `_Equipment` → `ZEAM_I_Equipment` [1..1]

## Access control

Role inherits the conditions of `ZEAM_I_Equipment`.

## Example use case

Installed base per plant and equipment category; acquisition value by manufacturer.

## Open verification items

`EQ-017`, `EQ-R01`, `EQ-R02` - see `BATCH_REPORT.md`.
