# ZPSV_B_ProjectWithWBSElement

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Project with WBS Elements |
| Module | link: `project` + `wbs_element` |
| Batch | 1 |
| Layer | link (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `ZPSV_B_Project` |
| Source file | `src/zpsv_b_projectwithwbselement.ddls.asddls` |

## Purpose

Project with a to-many association to its WBS elements.

## Keys

- `ProjectInternalID`

## Associations defined here

- `_WBSElement` → `ZPSV_B_WBSElement` [0..*]

## Access control

Role inherits the conditions of `ZPSV_B_Project`.

## Example use case

Project structure in a project object page.

## Open verification items

none
