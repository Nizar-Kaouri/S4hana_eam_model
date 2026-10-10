# ZEAM_R_ReliabilityKPI

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Reliability KPI Base (MTBF / MTTR) |
| Module | `rpt_reliability` |
| Batch | 4 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | #CUBE, #CUBE |
| Data source | `ZEAM_I_NotifDowntime` |
| Source file | `src/zeam_r_reliabilitykpi.ddls.asddls` |

## Purpose

Reliability base per planning plant and technical object for a reporting period (parameters): number of closed breakdowns, total breakdown downtime and observation time.

## Parameters

- `P_StartDate` : `abap.dats`
- `P_EndDate` : `abap.dats`

## Keys

- `MaintenancePlanningPlant`
- `MaintenancePlant`
- `Equipment`
- `FunctionalLocation`

## Associations defined here

- none

## Access control

Role inherits the conditions of `ZEAM_I_NotifDowntime`.

## Example use case

MTBF / MTTR per equipment for the last 12 months; fleet MTBF per plant.

## Open verification items

`LNK-010`, `RPT-D03`, `RPT-R01`, `RPT-R02`, `RPT-R03` - see `BATCH_REPORT.md`.
