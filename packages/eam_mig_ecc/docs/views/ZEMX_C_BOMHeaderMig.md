# ZEMX_C_BOMHeaderMig

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | BOMHeader state ledger for customer resolver |
| Module | `equipment_bom` |
| Batch | 2 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_I_BOMHeader` |
| Source file | `src/zemx_c_bomheadermig.ddls.asddls` |

## Purpose

BOMHeader state ledger for customer resolver

## Keys

- `BOMCategory`
- `BillOfMaterial`
- `BOMAlternative`
- `HeaderCounter`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Export the selected migration scope; validate keys and row counts before loading.

## Open verification items

none
