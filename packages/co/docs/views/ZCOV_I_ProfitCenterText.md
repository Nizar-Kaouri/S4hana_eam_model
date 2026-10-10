# ZCOV_I_ProfitCenterText

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Profit Center - Text |
| Module | `profit_center` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | #TEXT |
| Data source | `I_ProfitCenterText` |
| Source file | `src/zcov_i_profitcentertext.ddls.asddls` |

## Purpose

Language-dependent profit center name of the current or future validity interval; text provider for ZCOV_I_ProfitCenter.

## Keys

- `ControllingArea`
- `ProfitCenter`
- `Language`

## Associations defined here

- none

## Access control

Role grants unrestricted read access (explicit `grant select on ...;`).

## Example use case

Profit center names in margin and cost reports.

## Open verification items

`CO-T01`, `CO-T02` - see `BATCH_REPORT.md`.
