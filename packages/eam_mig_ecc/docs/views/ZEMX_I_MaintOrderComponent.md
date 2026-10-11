# ZEMX_I_MaintOrderComponent

> Version **1.0.0**

| | |
|---|---|
| Description | Maintenance order component |
| Module | `maintenance_order` |
| Batch | 2 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | #FACT |
| Data source | `ZEMX_B_ReservationItem`, join `ZEMX_B_OrderMaintData` |
| Source file | `src/zemx_i_maintordercomponent.ddls.asddls` |

## Purpose

Material components of maintenance orders with the operation number (instead of the internal operation counter).

## Keys

- `Reservation`
- `ReservationItem`
- `ReservationRecordType`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Read the open components of order 4000001.
