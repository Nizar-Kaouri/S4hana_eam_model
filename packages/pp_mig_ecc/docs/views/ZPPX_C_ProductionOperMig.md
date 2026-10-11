# ZPPX_C_ProductionOperMig

> Version **1.0.0**

| | |
|---|---|
| Description | ProductionOperMig |
| Module | `production_order_operation` |
| Batch | 1 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZPPX_I_ProductionOper` |
| Source file | `src/zppx_c_productionopermig.ddls.asddls` |

## Purpose

Read ProductionOperMig as source records; approve the key-date population before posting.

## Keys

- `OperationRoutingNumber`
- `OperationInternalID`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
