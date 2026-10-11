# ZEMX_B_FuncLocBOMData

> Version **1.0.0**

| | |
|---|---|
| Description | FuncLocBOMData |
| Module | `functional_location` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `tpst` |
| Source file | `src/zemx_b_funclocbomdata.ddls.asddls` |

## Purpose

Preserve the business key and selected parent population without flattening repeating records.

## Keys

- `FunctionalLocation`
- `Plant`
- `BOMUsage`
- `BillOfMaterial`
- `BOMAlternative`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
