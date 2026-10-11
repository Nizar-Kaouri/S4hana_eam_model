# ZEMX_B_OrderOperationData

> Version **1.0.0**

| | |
|---|---|
| Description | Order operation |
| Module | `maintenance_order` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #FACT |
| Data source | `afvc` |
| Source file | `src/zemx_b_orderoperationdata.ddls.asddls` |

## Purpose

Order operations (AFVC): number, control key, text, work center, plant, activity type.

## Keys

- `OrderRoutingNumber`
- `OrderOperationInternalID`

## Associations defined here

- `_WorkCenter` → `ZEMX_B_WorkCenterHeader` [0..1]

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Read the operations of routing number 1000001.
