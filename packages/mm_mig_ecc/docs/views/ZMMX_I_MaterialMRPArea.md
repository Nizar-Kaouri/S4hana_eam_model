# ZMMX_I_MaterialMRPArea

> Version **1.0.0**

| | |
|---|---|
| Description | MaterialMRPArea |
| Module | `product` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZMMX_B_MaterialMRPAreaData`, join `ZMMX_I_Material` |
| Source file | `src/zmmx_i_materialmrparea.ddls.asddls` |

## Purpose

Preserve the business key and selected parent population without flattening repeating records.

## Keys

- `Product`
- `MRPArea`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
