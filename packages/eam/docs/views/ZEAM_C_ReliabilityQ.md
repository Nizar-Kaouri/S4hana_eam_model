# ZEAM_C_ReliabilityQ

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Reliability Analysis (MTBF / MTTR) |
| Module | `rpt_reliability` |
| Batch | 4 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | transient view entity |
| Data category | analytical query |
| Data source | `ZEAM_R_ReliabilityKPI` |
| Source file | `src/zeam_c_reliabilityq.ddls.asddls` |

## Purpose

MTBF / MTTR query for a reporting period: breakdowns, downtime, observation time and the formulas MTTR = downtime / breakdowns and MTBF = (observation time - downtime) / breakdowns.

## Parameters

- `P_StartDate` : `abap.dats`
- `P_EndDate` : `abap.dats`

## Keys

- none (transient / aggregated)

## Associations defined here

- none

## Access control

No DCL by design: Transient analytical query; authorization is enforced by the DCL of the provider ZEAM_R_ReliabilityKPI (see GEN-Q01).

## Example use case

Reliability ranking of equipment in a plant for the last 12 months (enter start and end date).

## Open verification items

`GEN-Q01`, `RPT-Q01` - see `BATCH_REPORT.md`.
