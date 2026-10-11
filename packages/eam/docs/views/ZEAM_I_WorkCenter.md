# ZEAM_I_WorkCenter

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Work Center - Cube |
| Module | `work_center` |
| Batch | 5 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | #CUBE |
| Data source | `ZEAM_B_WorkCenter` |
| Source file | `src/zeam_i_workcenter.ddls.asddls` |

## Purpose

Work center cube with the number of maintenance work centers per plant and category.

## Keys

- `WorkCenterInternalID`

## Associations defined here

- `_WorkCenter` → `ZEAM_B_WorkCenter` [1..1]

## Access control

Role inherits the conditions of `ZEAM_B_WorkCenter`.

## Example use case

Organizational overview of maintenance work centers per plant.

## Open verification items

none
