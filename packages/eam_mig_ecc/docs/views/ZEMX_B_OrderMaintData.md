# ZEMX_B_OrderMaintData

> Version **1.0.0**

| | |
|---|---|
| Description | Order maintenance data |
| Module | `maintenance_order` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #FACT |
| Data source | `afih` |
| Source file | `src/zemx_b_ordermaintdata.ddls.asddls` |

## Purpose

Maintenance data of orders (AFIH): reference object, planning data, notification, maintenance plan.

## Keys

- `MaintenanceOrder`

## Associations defined here

- `_LocAcctAssignment` → `ZEMX_B_LocAcctAssignment` [0..1]
- `_MainWorkCenter` → `ZEMX_B_WorkCenterHeader` [0..1]

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Read the orders created from maintenance plan 100.
