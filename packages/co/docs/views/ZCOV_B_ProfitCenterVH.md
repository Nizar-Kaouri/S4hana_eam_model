# ZCOV_B_ProfitCenterVH

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Profit Center - Value Help |
| Module | `profit_center` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | #VALUE_HELP |
| Data source | `ZCOV_B_ProfitCenter` |
| Source file | `src/zcov_b_profitcentervh.ddls.asddls` |

## Purpose

Searchable value help for profit centers valid today, with the name in the logon language.

## Keys

- `ControllingArea`
- `ProfitCenter`

## Associations defined here

- none

## Access control

Role inherits the conditions of `ZCOV_B_ProfitCenter`.

## Example use case

Value help for ProfitCenter in cost and margin queries.

## Open verification items

none
