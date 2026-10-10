# ZEMX_I_EquipmentTimeSegment

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Equipment time segment |
| Module | `equipment` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #DIMENSION |
| Data source | `equz` |
| Source file | `src/zemx_i_equipmenttimesegment.ddls.asddls` |

## Purpose

Time segments of equipment (EQUZ): planning plant, planner group, main work center, superordinate equipment and location record per validity period.

## Keys

- `Equipment`
- `ValidityEndDate`
- `TimeSegmentCounter`

## Associations defined here

- `_LocAcctAssignment` → `ZEMX_I_LocAcctAssignment` [0..1]
- `_MainWorkCenter` → `ZEMX_I_WorkCenterHeader` [0..1]

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Read the installation history of equipment 10000001 (all segments).

## Open verification items

`XEQ-002`, `XEQ-003`, `XEQ-006` - see `BATCH_REPORT.md`.
