# ZEMX_C_OrderPermitMig

> Version **1.0.0**

| | |
|---|---|
| Description | OrderPermit migration extract |
| Module | `maintenance_order` |
| Batch | 2 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_I_OrderPermit` |
| Source file | `src/zemx_c_orderpermitmig.ddls.asddls` |

## Purpose

OrderPermit migration extract

## Keys

- `ObjectNumber`
- `Permit`

## Associations defined here

- `_Parent` → `ZEMX_I_MaintOrder` [0..1]

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Export the selected migration scope; validate keys and row counts before loading.
