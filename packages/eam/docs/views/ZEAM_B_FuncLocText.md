# ZEAM_B_FuncLocText

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Functional Location - Text |
| Module | `functional_location` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | #TEXT |
| Data source | `I_FunctionalLocationText` |
| Source file | `src/zeam_b_funcloctext.ddls.asddls` |

## Purpose

Language-dependent functional location description; text provider for ZEAM_B_FuncLoc.

## Keys

- `FunctionalLocation`
- `Language`

## Associations defined here

- none

## Access control

Role grants unrestricted read access (explicit `grant select on ...;`).

## Example use case

Show functional location descriptions in reports.

## Open verification items

`FL-T01`, `FL-T02` - see `BATCH_REPORT.md`.
