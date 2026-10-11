# ZEMX_B_BOMItemData

> Version **1.0.0**

| | |
|---|---|
| Description | BOMItem equipment-category state ledger |
| Module | `equipment_bom` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `stpo` |
| Source file | `src/zemx_b_bomitemdata.ddls.asddls` |

## Purpose

BOMItem equipment-category state ledger

## Keys

- `BOMCategory`
- `BillOfMaterial`
- `BOMItemNode`
- `ItemCounter`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Export the selected migration scope; validate keys and row counts before loading.
