# ZFIV_I_Supplier

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Supplier |
| Module | `supplier` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | #DIMENSION |
| Data source | `I_Supplier` |
| Source file | `src/zfiv_i_supplier.ddls.asddls` |

## Purpose

One row per supplier: name, account group, country, city, postal code, authorization group, posting block and creation date; dimension for payables and purchasing.

## Keys

- `Supplier`

## Associations defined here

- none

## Access control

Role inherits the conditions of `I_Supplier`.

## Example use case

Payables per supplier country; blocked suppliers.

## Open verification items

`FI-020`, `FI-D03` - see `BATCH_REPORT.md`.
