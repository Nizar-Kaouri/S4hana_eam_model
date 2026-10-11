# ZEMX_I_ReservationItem

> Version **1.0.0**

| | |
|---|---|
| Description | Reservation item |
| Module | `maintenance_order` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #FACT |
| Data source | `resb` |
| Source file | `src/zemx_i_reservationitem.ddls.asddls` |

## Purpose

Reservation / dependent requirement items (RESB) with order and operation link, material, quantities and flags.

## Keys

- `Reservation`
- `ReservationItem`
- `ReservationRecordType`

## Associations defined here

- `_Operation` → `ZEMX_I_OrderOperationData` [0..1]

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Read the components of order 4000001.
