# ZPPX_C_BOMHeaderMig

> Version **1.0.0**

| | |
|---|---|
| Description | BOMHeaderMig |
| Module | `bill_of_material` |
| Batch | 1 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZPPX_I_BOMHeader` |
| Source file | `src/zppx_c_bomheadermig.ddls.asddls` |

## Purpose

Read BOMHeaderMig as source records; approve the key-date population before posting.

## Keys

- `BOMCategory`
- `BillOfMaterial`
- `BillOfMaterialVariant`
- `InternalCounter`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
