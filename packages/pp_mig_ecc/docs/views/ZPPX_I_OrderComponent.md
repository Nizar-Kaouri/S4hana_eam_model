# ZPPX_I_OrderComponent

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

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

Read OrderComponent as source candidates; approve the key-date population before posting.

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

## Open verification items

none
