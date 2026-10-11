# ZEAM_B_WorkCenter

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Work Center |
| Module | `work_center` |
| Batch | 5 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | #DIMENSION |
| Data source | `I_WorkCenter` |
| Source file | `src/zeam_b_workcenter.ddls.asddls` |

## Purpose

One row per work center of type 'A' (production resources / maintenance work centers) with external ID, plant, category, person responsible and validity; dimension for operation and backlog analyses (which reference WorkCenterInternalID).

## Keys

- `WorkCenterInternalID`

## Associations defined here

- `_Text` → `ZEAM_B_WorkCenterText` [0..*]
- `_Plant` → `I_Plant` [0..1]

## Access control

Role inherits the conditions of `I_WorkCenter`.

## Example use case

Remaining backlog hours per work center with the work center description.

## Open verification items

`WC-001`, `WC-002`, `WC-D01` - see `BATCH_REPORT.md`.
