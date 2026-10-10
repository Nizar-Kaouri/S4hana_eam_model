# ZEAM_I_WorkCenterText

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Work Center - Text |
| Module | `work_center` |
| Batch | 5 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | #TEXT |
| Data source | `I_WorkCenterText` |
| Source file | `src/zeam_i_workcentertext.ddls.asddls` |

## Purpose

Language-dependent work center description (work center type 'A'); text provider for ZEAM_I_WorkCenter.

## Keys

- `WorkCenterInternalID`
- `Language`

## Associations defined here

- none

## Access control

Role grants unrestricted read access (explicit `grant select on ...;`).

## Example use case

Show work center descriptions in backlog and operation reports.

## Open verification items

`WC-T01` - see `BATCH_REPORT.md`.
