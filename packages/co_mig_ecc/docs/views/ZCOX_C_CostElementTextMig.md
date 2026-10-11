# ZCOX_C_CostElementTextMig

> Version **1.0.0**

| | |
|---|---|
| Description | CostElementTextMig |
| Module | `cost_element` |
| Batch | 1 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZCOX_I_CostElementText` |
| Source file | `src/zcox_c_costelementtextmig.ddls.asddls` |

## Purpose

Preserve the business key and selected parent population without flattening repeating records.

## Keys

- `Language`
- `ChartOfAccounts`
- `CostElement`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
