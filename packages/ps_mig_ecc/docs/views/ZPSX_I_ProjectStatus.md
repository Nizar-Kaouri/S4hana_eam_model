# ZPSX_I_ProjectStatus

> Version **1.0.0**

| | |
|---|---|
| Description | ProjectStatus |
| Module | `project` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZPSX_B_ProjectStatusData`, join `ZPSX_I_Project` |
| Source file | `src/zpsx_i_projectstatus.ddls.asddls` |

## Purpose

Preserve the business key and selected parent population without flattening repeating records.

## Keys

- `ProjectInternalID`
- `StatusCode`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
