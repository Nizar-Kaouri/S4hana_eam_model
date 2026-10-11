# ZPPX_I_OrderStatus

> Version **1.0.0**

| | |
|---|---|
| Description | OrderStatus |
| Module | `production_order` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZPPX_B_OrderStatusData`, join `ZPPX_I_ProductionOrde` |
| Source file | `src/zppx_i_orderstatus.ddls.asddls` |

## Purpose

Preserve the business key and selected parent population without flattening repeating records.

## Keys

- `ManufacturingOrder`
- `StatusCode`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
