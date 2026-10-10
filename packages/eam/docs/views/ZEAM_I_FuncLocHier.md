# ZEAM_I_FuncLocHier

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Functional Location Hierarchy |
| Module | `functional_location_hierarchy` |
| Batch | 5 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | hierarchy |
| Data category | - |
| Data source | `ZEAM_I_FuncLocHierNode` |
| Source file | `src/zeam_i_funclochier.ddls.asddls` |

## Purpose

CDS parent-child hierarchy of functional locations (roots = locations without superior location) with level, rank and tree size of every node.

## Keys

- none (transient / aggregated)

## Associations defined here

- none

## Access control

Role inherits the conditions of `ZEAM_I_FuncLocHierNode`.

## Example use case

SELECT FROM ZEAM_I_FuncLocHier to list a plant structure top-down; subtree size per location.

## Open verification items

`FH-001`, `FH-002`, `FH-003`, `FH-D01` - see `BATCH_REPORT.md`.
