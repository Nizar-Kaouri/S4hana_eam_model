# ZEMX_C_BOMSelectionMig

> Version **1.0.0**

| | |
|---|---|
| Description | BOMSelection state ledger for customer resolver |
| Module | `equipment_bom` |
| Batch | 2 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_I_BOMSelection` |
| Source file | `src/zemx_c_bomselectionmig.ddls.asddls` |

## Purpose

BOMSelection state ledger for customer resolver

## Keys

- `BOMCategory`
- `BillOfMaterial`
- `BOMAlternative`
- `BOMItemNode`
- `SelectionCounter`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Export the selected migration scope; validate keys and row counts before loading.
