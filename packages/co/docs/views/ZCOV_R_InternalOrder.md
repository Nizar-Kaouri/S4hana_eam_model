# ZCOV_R_InternalOrder

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Internal Order - Cube |
| Module | `internal_order` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | #CUBE |
| Data source | `ZCOV_I_InternalOrder` |
| Source file | `src/zcov_r_internalorder.ddls.asddls` |

## Purpose

Internal order cube: number of (open) internal orders per order type, company code and responsible cost center.

## Keys

- `InternalOrder`

## Associations defined here

- `_InternalOrder` → `ZCOV_I_InternalOrder` [1..1]

## Access control

Role inherits the conditions of `ZCOV_I_InternalOrder`.

## Example use case

Open internal orders per order type.

## Open verification items

none
