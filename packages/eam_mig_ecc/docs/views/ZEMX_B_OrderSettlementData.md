# ZEMX_B_OrderSettlementData

> Version **1.0.0**

| | |
|---|---|
| Description | OrderSettlement source data |
| Module | `maintenance_order` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `cobrb` |
| Source file | `src/zemx_b_ordersettlementdata.ddls.asddls` |

## Purpose

OrderSettlement source data

## Keys

- `ObjectNumber`
- `DistributionRuleNumber`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Export the selected migration scope; validate keys and row counts before loading.
