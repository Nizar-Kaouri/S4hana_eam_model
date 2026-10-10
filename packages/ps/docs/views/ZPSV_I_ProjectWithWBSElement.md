# ZPSV_I_ProjectWithWBSElement

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Project with WBS Elements |
| Module | link: `project` + `wbs_element` |
| Batch | 1 |
| Layer | link (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `ZPSV_I_Project` |
| Source file | `src/zpsv_i_projectwithwbselement.ddls.asddls` |

## Purpose

Project with a to-many association to its WBS elements.

## Keys

- `ProjectInternalID`

## Associations defined here

- `_WBSElement` → `ZPSV_I_WBSElement` [0..*]

## Access control

Role inherits the conditions of `ZPSV_I_Project`.

## Example use case

Project structure in a project object page.

## Open verification items

none
