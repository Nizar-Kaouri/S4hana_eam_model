# ZCOV_I_CostCenterVH

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Cost Center - Value Help |
| Module | `cost_center` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | #VALUE_HELP |
| Data source | `ZCOV_I_CostCenter` |
| Source file | `src/zcov_i_costcentervh.ddls.asddls` |

## Purpose

Searchable value help for cost centers valid today, with the name in the logon language.

## Keys

- `ControllingArea`
- `CostCenter`

## Associations defined here

- none

## Access control

Role inherits the conditions of `ZCOV_I_CostCenter`.

## Example use case

Value help for CostCenter in all products of the library.

## Open verification items

none
