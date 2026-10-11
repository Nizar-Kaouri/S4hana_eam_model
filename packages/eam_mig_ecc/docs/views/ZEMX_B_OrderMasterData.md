# ZEMX_B_OrderMasterData

> Version **1.0.0**

| | |
|---|---|
| Description | Order master data |
| Module | `maintenance_order` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #FACT |
| Data source | `aufk` |
| Source file | `src/zemx_b_ordermasterdata.ddls.asddls` |

## Purpose

Order master data (AUFK) of maintenance orders (order category 30).

## Keys

- `MaintenanceOrder`

## Associations defined here

- `_TechCompletedFlag` → `ZEMX_B_StatusTechCompleted` [0..1]
- `_ClosedFlag` → `ZEMX_B_StatusClosed` [0..1]
- `_DeletionFlag` → `ZEMX_B_StatusDeletionFlag` [0..1]

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Read the maintenance orders of company code 1000.
