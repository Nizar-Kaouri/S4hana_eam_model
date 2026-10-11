# ZEMX_I_WorkCenterCapacity

> Version **1.0.0**

| | |
|---|---|
| Description | WorkCenterCapacity migration business data |
| Module | `work_center` |
| Batch | 2 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_B_WorkCenterCapacityData` |
| Source file | `src/zemx_i_workcentercapacity.ddls.asddls` |

## Purpose

WorkCenterCapacity migration business data

## Keys

- `ObjectType`
- `WorkCenterInternalID`
- `CapacityAssignment`

## Associations defined here

- `_Business` → `ZEMX_B_WorkCenterHeader` [0..1]

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Export the selected migration scope; validate keys and row counts before loading.
