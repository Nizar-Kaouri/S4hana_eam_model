# ZPSV_R_WBSElement

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | WBS Element - Cube |
| Module | `wbs_element` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | #CUBE |
| Data source | `ZPSV_I_WBSElement` |
| Source file | `src/zpsv_r_wbselement.ddls.asddls` |

## Purpose

WBS element cube: number of (account-assignable) WBS elements per project, company code and cost center.

## Keys

- `WBSElementInternalID`

## Associations defined here

- `_WBSElement` → `ZPSV_I_WBSElement` [1..1]

## Access control

Role inherits the conditions of `ZPSV_I_WBSElement`.

## Example use case

Project structure size per company code.

## Open verification items

none
