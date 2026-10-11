# ZEAM_C_EquipReliabilityQ

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Fleet Reliability Analysis (MTBF / MTTR) |
| Module | link: `equipment` + `rpt_reliability` |
| Batch | 1 |
| Layer | link (`@VDM.viewType: #CONSUMPTION`) |
| Kind | transient view entity |
| Data category | analytical query |
| Data source | `ZEAM_I_EquipmentReliability` |
| Source file | `src/zeam_c_equipreliabilityq.ddls.asddls` |

## Purpose

Fleet MTBF / MTTR query over the whole equipment population for a reporting period.

## Parameters

- `P_StartDate` : `abap.dats`
- `P_EndDate` : `abap.dats`

## Keys

- none (transient / aggregated)

## Associations defined here

- none

## Access control

No DCL by design: Transient analytical query (link); authorization is enforced by the DCL of its provider cube (see GEN-Q01).

## Example use case

MTBF per equipment category and plant, including equipment that never broke down.

## Open verification items

`GEN-Q01`, `RPT-Q01` - see `BATCH_REPORT.md`.
