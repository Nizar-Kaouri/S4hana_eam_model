# ZEAM_C_MaintNotifCauseQ

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Root Cause Analysis |
| Module | `notification_item` |
| Batch | 5 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | transient view entity |
| Data category | analytical query |
| Data source | `ZEAM_R_MaintNotifCause` |
| Source file | `src/zeam_c_maintnotifcauseq.ddls.asddls` |

## Purpose

Analytical query on ZEAM_R_MaintNotifCause. Cause codes per planning plant (Pareto).

## Keys

- none (transient / aggregated)

## Associations defined here

- none

## Access control

No DCL by design: Transient analytical query; authorization is enforced by the DCL of the provider ZEAM_R_MaintNotifCause (see GEN-Q01).

## Example use case

Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.

## Open verification items

`GEN-Q01` - see `BATCH_REPORT.md`.
