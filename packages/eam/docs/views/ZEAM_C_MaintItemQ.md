# ZEAM_C_MaintItemQ

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Maintenance Item Analysis |
| Module | `maintenance_plan` |
| Batch | 3 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | transient view entity |
| Data category | analytical query |
| Data source | `ZEAM_R_MaintItem` |
| Source file | `src/zeam_c_maintitemq.ddls.asddls` |

## Purpose

Analytical query on ZEAM_R_MaintItem. Preventive maintenance coverage per planning plant and plan category.

## Keys

- none (transient / aggregated)

## Associations defined here

- none

## Access control

No DCL by design: Transient analytical query; authorization is enforced by the DCL of the provider ZEAM_R_MaintItem (see GEN-Q01).

## Example use case

Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.

## Open verification items

`GEN-Q01` - see `BATCH_REPORT.md`.
