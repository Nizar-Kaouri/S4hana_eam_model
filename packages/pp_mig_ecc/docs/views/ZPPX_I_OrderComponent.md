# ZPPX_I_OrderComponent

> Version **1.0.0**

| | |
|---|---|
| Description | OrderComponent |
| Module | `production_order_operation` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZPPX_I_OrderComponentData` |
| Source file | `src/zppx_i_ordercomponent.ddls.asddls` |

## Purpose

Read OrderComponent as source records; approve the key-date population before posting.

## Keys

- `Reservation`
- `ReservationItem`
- `RecordType`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
