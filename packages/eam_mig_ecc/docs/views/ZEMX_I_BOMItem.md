# ZEMX_I_BOMItem

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | BOMItem versioned business data |
| Module | `equipment_bom` |
| Batch | 2 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_I_BOMItemData` |
| Source file | `src/zemx_i_bomitem.ddls.asddls` |

## Purpose

BOMItem versioned business data

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

## Open verification items

none
