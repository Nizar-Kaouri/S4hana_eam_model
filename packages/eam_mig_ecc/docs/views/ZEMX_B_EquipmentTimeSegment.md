# ZEMX_B_EquipmentTimeSegment

> Version **1.0.0**

| | |
|---|---|
| Description | Equipment time segment |
| Module | `equipment` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #DIMENSION |
| Data source | `equz` |
| Source file | `src/zemx_b_equipmenttimesegment.ddls.asddls` |

## Purpose

Time segments of equipment (EQUZ): planning plant, planner group, main work center, superordinate equipment and location record per validity period.

## Keys

- `Equipment`
- `ValidityEndDate`
- `TimeSegmentCounter`

## Associations defined here

- `_LocAcctAssignment` → `ZEMX_B_LocAcctAssignment` [0..1]
- `_MainWorkCenter` → `ZEMX_B_WorkCenterHeader` [0..1]

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Read the installation history of equipment 10000001 (all segments).
