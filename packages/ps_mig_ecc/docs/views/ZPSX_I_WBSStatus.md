# ZPSX_I_WBSStatus

> Version **1.0.0**

| | |
|---|---|
| Description | WBSStatus |
| Module | `wbs_element` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZPSX_B_WBSStatusData`, join `ZPSX_I_WBS` |
| Source file | `src/zpsx_i_wbsstatus.ddls.asddls` |

## Purpose

Preserve the business key and selected parent population without flattening repeating records.

## Keys

- `WBSElementInternalID`
- `StatusCode`

## Associations defined here

- `_Profile` → `ZPSX_B_StatusProfileData` [0..1]

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
