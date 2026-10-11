# ZMMX_C_BatchClassMig

> Version **1.0.0**

| | |
|---|---|
| Description | BatchClassMig |
| Module | `product` |
| Batch | 1 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZMMX_I_BatchClass` |
| Source file | `src/zmmx_c_batchclassmig.ddls.asddls` |

## Purpose

Preserve the business key and selected parent population without flattening repeating records.

## Keys

- `ClassifiedObject`
- `ClassType`
- `Class`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
