# ZEAM_B_WorkCenterVH

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Work Center - Value Help |
| Module | `work_center` |
| Batch | 5 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | #VALUE_HELP |
| Data source | `ZEAM_B_WorkCenter` |
| Source file | `src/zeam_b_workcentervh.ddls.asddls` |

## Purpose

Searchable value help for maintenance work centers (external ID, plant, description).

## Keys

- `WorkCenterInternalID`

## Associations defined here

- none

## Access control

Role inherits the conditions of `ZEAM_B_WorkCenter`.

## Example use case

Value help for WorkCenterInternalID / WorkCenter in backlog and operation analyses.

## Open verification items

`EQ-V01`, `WC-V01` - see `BATCH_REPORT.md`.
