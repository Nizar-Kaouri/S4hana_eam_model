# ZEMX_I_OrderSettlement

> Version **1.0.0**

| | |
|---|---|
| Description | OrderSettlement migration business data |
| Module | `maintenance_order` |
| Batch | 2 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_B_OrderSettlementData` |
| Source file | `src/zemx_i_ordersettlement.ddls.asddls` |

## Purpose

OrderSettlement migration business data

## Keys

- `ObjectNumber`
- `DistributionRuleNumber`
- `DistributionRuleGroup`

## Associations defined here

- `_Order` → `ZEMX_I_MaintOrder` [0..1]

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Export the selected migration scope; validate keys and row counts before loading.
