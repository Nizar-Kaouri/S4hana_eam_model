# ZEMX_I_OrderMaintData

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Order maintenance data |
| Module | `maintenance_order` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #FACT |
| Data source | `afih` |
| Source file | `src/zemx_i_ordermaintdata.ddls.asddls` |

## Purpose

Maintenance data of orders (AFIH): reference object, planning data, notification, maintenance plan.

## Keys

- `aufnr`

## Associations defined here

- `_LocAcctAssignment` → `ZEMX_I_LocAcctAssignment` [0..1]
- `_MainWorkCenter` → `ZEMX_I_WorkCenterHeader` [0..1]

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Read the orders created from maintenance plan 100.

## Open verification items

`XOR-001`, `XOR-002` - see `BATCH_REPORT.md`.
