# ZMMV_I_ProductText

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Product - Text |
| Module | `product` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | #TEXT |
| Data source | `I_ProductDescription` |
| Source file | `src/zmmv_i_producttext.ddls.asddls` |

## Purpose

Language-dependent product (material) description; text provider for ZMMV_I_Product.

## Keys

- `Product`
- `Language`

## Associations defined here

- none

## Access control

Role grants unrestricted read access (explicit `grant select on ...;`).

## Example use case

Show material descriptions in the logon language in stock and purchasing reports.

## Open verification items

`MM-T01` - see `BATCH_REPORT.md`.
