# ZPPX_I_OperationQuantData

> Version **1.0.0**

| | |
|---|---|
| Description | OperationQuantData |
| Module | `production_order_operation` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `afvv` |
| Source file | `src/zppx_i_operationquantdata.ddls.asddls` |

## Purpose

Read OperationQuantData as source records; approve the key-date population before posting.

## Keys

- `OperationRoutingNumber`
- `OperationInternalID`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
