# ZEMX_I_WorkCenterCapacityData

> Version **1.0.0**

| | |
|---|---|
| Description | WorkCenterCapacity source data |
| Module | `work_center` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `crca` |
| Source file | `src/zemx_i_workcentercapacitydata.ddls.asddls` |

## Purpose

WorkCenterCapacity source data

## Keys

- `ObjectType`
- `WorkCenterInternalID`
- `CapacityAssignment`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Export the selected migration scope; validate keys and row counts before loading.
