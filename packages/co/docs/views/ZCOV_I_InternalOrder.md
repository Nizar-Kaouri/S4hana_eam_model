# ZCOV_I_InternalOrder

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Internal Order |
| Module | `internal_order` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | #DIMENSION |
| Data source | `I_InternalOrder` |
| Source file | `src/zcov_i_internalorder.ddls.asddls` |

## Purpose

One row per internal order: description, order type, controlling area, company code, responsible cost center, profit center, released / closed flags and creation date.

## Keys

- `InternalOrder`

## Associations defined here

- `_CompanyCode` → `I_CompanyCode` [0..1]

## Access control

Role inherits the conditions of `I_InternalOrder`.

## Example use case

Open internal orders per order type; marketing orders per responsible cost center.

## Open verification items

`CO-010`, `CO-011`, `CO-D02` - see `BATCH_REPORT.md`.
