# ZEMX_I_OrderHeaderPlanning

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Order header planning data |
| Module | `maintenance_order` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #FACT |
| Data source | `afko` |
| Source file | `src/zemx_i_orderheaderplanning.ddls.asddls` |

## Purpose

Order header planning data (AFKO): basic dates, routing number and the task list used.

## Keys

- `aufnr`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Read the basic dates of order 4000001.

## Open verification items

none
