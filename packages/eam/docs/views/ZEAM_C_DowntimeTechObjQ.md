# ZEAM_C_DowntimeTechObjQ

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Downtime Analysis by Technical Object |
| Module | link: `equipment` + `functional_location` + `rpt_downtime` |
| Batch | 1 |
| Layer | link (`@VDM.viewType: #CONSUMPTION`) |
| Kind | transient view entity |
| Data category | analytical query |
| Data source | `ZEAM_I_DowntimeWithTechObj` |
| Source file | `src/zeam_c_downtimetechobjq.ddls.asddls` |

## Purpose

Analytical query on ZEAM_I_DowntimeWithTechObj. Downtime and breakdowns per planning plant and equipment category.

## Keys

- none (transient / aggregated)

## Associations defined here

- none

## Access control

No DCL by design: Transient analytical query (link); authorization is enforced by the DCL of its provider cube (see GEN-Q01).

## Example use case

Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.

## Open verification items

`GEN-Q01` - see `BATCH_REPORT.md`.
