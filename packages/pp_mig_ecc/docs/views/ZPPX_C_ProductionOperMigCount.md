# ZPPX_C_ProductionOperMigCount

> Version **1.0.0**

| | |
|---|---|
| Description | ProductionOperMigCount |
| Module | `production_order_operation` |
| Batch | 1 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZPPX_C_ProductionOperMig` |
| Source file | `src/zppx_c_productionopermigcount.ddls.asddls` |

## Purpose

Read ProductionOperMigCount as source records; approve the key-date population before posting.

## Keys

- `OperationRoutingNumber`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
