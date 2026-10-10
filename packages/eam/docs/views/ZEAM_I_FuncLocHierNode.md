# ZEAM_I_FuncLocHierNode

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Functional Location Hierarchy Node |
| Module | `functional_location_hierarchy` |
| Batch | 5 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `ZEAM_I_FuncLoc` |
| Source file | `src/zeam_i_funclochiernode.ddls.asddls` |

## Purpose

Parent-child source for the functional location hierarchy: each functional location with its superior location and the self-association _SuperiorNode used by ZEAM_I_FuncLocHier.

## Keys

- `FunctionalLocation`

## Associations defined here

- `_SuperiorNode` → `ZEAM_I_FuncLocHierNode` [0..1]

## Access control

Role inherits the conditions of `ZEAM_I_FuncLoc`.

## Example use case

Source of the hierarchy; can also be used for one-level parent lookups.

## Open verification items

none
