# ZSDT_I_SalesOrderCount

> Version **1.0.0**

| | |
|---|---|
| Description | SalesOrderCount |
| Module | `sales_order` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | - |
| Data source | `ZSDT_I_SalesOrderCompare` |
| Source file | `src/zsdt_i_salesordercount.ddls.asddls` |

## Purpose

Read SalesOrderCount as target comparison records.

## Keys

- `SalesDocument`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
