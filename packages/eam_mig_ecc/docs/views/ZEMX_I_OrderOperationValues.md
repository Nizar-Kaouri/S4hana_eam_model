# ZEMX_I_OrderOperationValues

> Version **1.0.0**

| | |
|---|---|
| Description | Order operation quantities |
| Module | `maintenance_order` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #FACT |
| Data source | `afvv` |
| Source file | `src/zemx_i_orderoperationvalues.ddls.asddls` |

## Purpose

Quantities and durations of order operations (AFVV).

## Keys

- `OrderRoutingNumber`
- `OrderOperationInternalID`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Read the planned work of routing number 1000001.
