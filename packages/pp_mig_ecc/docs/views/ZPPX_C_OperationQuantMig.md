# ZPPX_C_OperationQuantMig

> Version **1.0.0**

| | |
|---|---|
| Description | OperationQuantMig |
| Module | `production_order_operation` |
| Batch | 1 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZPPX_I_OperationQuant` |
| Source file | `src/zppx_c_operationquantmig.ddls.asddls` |

## Purpose

Read OperationQuantMig as source records; approve the key-date population before posting.

## Keys

- `OperationRoutingNumber`
- `OperationInternalID`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
