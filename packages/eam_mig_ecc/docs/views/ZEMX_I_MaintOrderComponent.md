# ZEMX_I_MaintOrderComponent

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Maintenance order component |
| Module | `maintenance_order` |
| Batch | 2 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | #FACT |
| Data source | `ZEMX_I_ReservationItem`, join `ZEMX_I_OrderMaintData` |
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

No DCL by design: Migration view on ECC: it must return every record of the object. Access is controlled by the user / RFC user of the load program and the extraction channel (S_TABU_NAM), not by CDS access control (decision XGEN-D01; CDS access control also needs a newer release than the 7.40 SP08 baseline).

## Example use case

Read the open components of order 4000001.

## Open verification items

none
