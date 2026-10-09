# ZEAM_I_FuncLocVH

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Module | `functional_location` |
| Layer | Basic (value help) |
| Data source | `ZEAM_I_FuncLoc` |
| Source file | `src/zeam_i_funclocvh.ddls.asddls` |

## Purpose

Searchable value help. The external label (`FunctionalLocationLabelName`) and description are the primary search elements; the internal key is still the value-help key.

## Keys

- `FunctionalLocation`

## Associations

- none

## Access control

Inherits from `ZEAM_I_FuncLoc` (GEN-D02).

## Example use case

Value help for `FunctionalLocation` elements in later order/notification projections.

## Open verification items

`FL-V01`, `GEN-D02` - see `BATCH_REPORT.md`.
