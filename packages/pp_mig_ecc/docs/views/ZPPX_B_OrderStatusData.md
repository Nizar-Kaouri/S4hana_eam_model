# ZPPX_B_OrderStatusData

> Version **1.0.0**

| | |
|---|---|
| Description | OrderStatusData |
| Module | `production_order` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `jest` |
| Source file | `src/zppx_b_orderstatusdata.ddls.asddls` |

## Purpose

Preserve the business key and selected parent population without flattening repeating records.

## Keys

- `ObjectNumber`
- `StatusCode`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
