# ZEMX_B_TaskListLTIndexData

> Version **1.0.0**

| | |
|---|---|
| Description | TaskListTextData |
| Module | `task_list` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `stxh` |
| Source file | `src/zemx_b_tasklistltindexdata.ddls.asddls` |

## Purpose

Preserve the business key and selected parent population without flattening repeating records.

## Keys

- `TextObject`
- `TextName`
- `TextID`
- `Language`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
