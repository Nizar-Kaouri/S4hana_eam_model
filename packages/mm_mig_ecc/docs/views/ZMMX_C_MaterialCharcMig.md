# ZMMX_C_MaterialCharcMig

> Version **1.0.0**

| | |
|---|---|
| Description | MaterialCharcMig |
| Module | `product` |
| Batch | 1 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZMMX_I_MaterialCharc` |
| Source file | `src/zmmx_c_materialcharcmig.ddls.asddls` |

## Purpose

Preserve the business key and selected parent population without flattening repeating records.

## Keys

- `ClassifiedObject`
- `ClassType`
- `Characteristic`
- `CharcValuePositionNumber`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
