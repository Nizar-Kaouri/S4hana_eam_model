# ZEMX_C_WorkCenterCapacityMig

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | WorkCenterCapacity migration extract |
| Module | `work_center` |
| Batch | 2 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_I_WorkCenterCapacity` |
| Source file | `src/zemx_c_workcentercapacitymig.ddls.asddls` |

## Purpose

WorkCenterCapacity migration extract

## Keys

- `ObjectType`
- `WorkCenterInternalID`
- `CapacityAssignment`

## Associations defined here

- `_Parent` → `ZEMX_I_WorkCenterHeader` [0..1]

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Export the selected migration scope; validate keys and row counts before loading.

## Open verification items

none
