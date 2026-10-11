# ZEAM_I_EquipmentReliability

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Equipment Fleet Reliability |
| Module | link: `equipment` + `rpt_reliability` |
| Batch | 1 |
| Layer | link (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | #CUBE |
| Data source | `ZEAM_B_Equipment`, join `ZEAM_I_ReliabilityKPI` |
| Source file | `src/zeam_i_equipmentreliability.ddls.asddls` |

## Purpose

Fleet reliability per equipment for a reporting period: the whole current equipment population (also equipment without any breakdown) with breakdowns, breakdown downtime and observation time, so that fleet MTBF / MTTR aggregate correctly. Fixes the limitation of

## Parameters

- `P_StartDate` : `abap.dats`
- `P_EndDate` : `abap.dats`

## Keys

- `Equipment`

## Associations defined here

- none

## Access control

Role inherits the conditions of `ZEAM_B_Equipment`.

## Example use case

Fleet MTBF per equipment category and plant for the last 12 months.

## Open verification items

`LNK-010`, `LNK-012`, `RPT-R01` - see `BATCH_REPORT.md`.
