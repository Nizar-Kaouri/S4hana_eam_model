# ZEAM_C_DowntimeQ

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Downtime and Breakdown Analysis |
| Module | `rpt_downtime` |
| Batch | 4 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | transient view entity |
| Data category | analytical query |
| Data source | `ZEAM_I_NotifDowntime` |
| Source file | `src/zeam_c_downtimeq.ddls.asddls` |

## Purpose

Analytical query on ZEAM_I_NotifDowntime: malfunctions, breakdowns and downtime hours per planning plant and malfunction month, with average downtime per breakdown as a formula.

## Keys

- none (transient / aggregated)

## Associations defined here

- none

## Access control

No DCL by design: Transient analytical query; authorization is enforced by the DCL of the provider ZEAM_I_NotifDowntime (see GEN-Q01).

## Example use case

Monthly downtime dashboard per plant; drill down to equipment and notification.

## Open verification items

`GEN-Q01`, `RPT-Q01` - see `BATCH_REPORT.md`.
