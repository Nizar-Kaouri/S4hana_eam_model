# ZPSX_I_NetworkStatus

> Version **1.0.0**

| | |
|---|---|
| Description | NetworkStatus |
| Module | `network` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZPSX_B_NetworkStatusData`, join `ZPSX_I_NetworkHeader` |
| Source file | `src/zpsx_i_networkstatus.ddls.asddls` |

## Purpose

Preserve the business key and selected parent population without flattening repeating records.

## Keys

- `Network`
- `StatusCode`

## Associations defined here

- `_Profile` → `ZPSX_B_StatusProfileData` [0..1]

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
