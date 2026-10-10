# ZCOV_I_CostCenterText

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Cost Center - Text |
| Module | `cost_center` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | #TEXT |
| Data source | `I_CostCenterText` |
| Source file | `src/zcov_i_costcentertext.ddls.asddls` |

## Purpose

Language-dependent cost center name and description of the validity interval that is current or in the future; text provider for ZCOV_I_CostCenter.

## Keys

- `ControllingArea`
- `CostCenter`
- `Language`

## Associations defined here

- none

## Access control

Role grants unrestricted read access (explicit `grant select on ...;`).

## Example use case

Cost center names in cost reports.

## Open verification items

`CO-T01` - see `BATCH_REPORT.md`.
