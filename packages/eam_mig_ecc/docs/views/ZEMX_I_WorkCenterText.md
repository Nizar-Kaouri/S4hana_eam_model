# ZEMX_I_WorkCenterText

> Version **1.0.0**

| | |
|---|---|
| Description | Work center text |
| Module | `work_center` |
| Batch | 2 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_B_WorkCenterDesc` |
| Source file | `src/zemx_i_workcentertext.ddls.asddls` |

## Purpose

Work center descriptions with the business key (work center + plant) instead of the internal object ID.

## Keys

- `WorkCenterInternalID`
- `Language`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Read all texts of work center MECH-01 in plant 1000.
