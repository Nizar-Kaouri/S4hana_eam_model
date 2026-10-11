# ZCOX_I_CostElementText

> Version **1.0.0**

| | |
|---|---|
| Description | CostElementText |
| Module | `cost_element` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZCOX_B_CostElementTextData`, join `ZCOX_I_CostElement` |
| Source file | `src/zcox_i_costelementtext.ddls.asddls` |

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
