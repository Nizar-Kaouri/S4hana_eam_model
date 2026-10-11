# ZPSX_C_ProjectSettleMig

> Version **1.0.0**

| | |
|---|---|
| Description | ProjectSettleMig |
| Module | `project` |
| Batch | 1 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZPSX_I_ProjectSettle` |
| Source file | `src/zpsx_c_projectsettlemig.ddls.asddls` |

## Purpose

Preserve the business key and selected parent population without flattening repeating records.

## Keys

- `ObjectNumber`
- `DistributionRuleGroup`
- `DistributionRule`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
