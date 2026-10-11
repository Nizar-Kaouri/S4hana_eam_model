# ZEMX_C_FuncLocPartnerMig

> Version **1.0.0**

| | |
|---|---|
| Description | FuncLocPartnerMig |
| Module | `functional_location` |
| Batch | 2 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_I_FuncLocPartner` |
| Source file | `src/zemx_c_funclocpartnermig.ddls.asddls` |

## Purpose

Preserve the business key and selected parent population without flattening repeating records.

## Keys

- `FunctionalLocation`
- `PartnerFunction`
- `PartnerCounter`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
