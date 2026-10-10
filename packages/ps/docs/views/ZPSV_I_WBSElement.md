# ZPSV_I_WBSElement

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | WBS Element |
| Module | `wbs_element` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | #DIMENSION |
| Data source | `I_WBSElement` |
| Source file | `src/zpsv_i_wbselement.ddls.asddls` |

## Purpose

One row per WBS element: external WBS number, description, project, organizational assignment, planning / account assignment / billing / statistical flags and planned dates; dimension for project cost cubes.

## Keys

- `WBSElementInternalID`

## Associations defined here

- `_CompanyCode` → `I_CompanyCode` [0..1]

## Access control

Role inherits the conditions of `I_WBSElement`.

## Example use case

Account-assignable WBS elements of a project; WBS elements per responsible cost center.

## Open verification items

`PS-010`, `PS-011`, `PS-012`, `PS-D02` - see `BATCH_REPORT.md`.
