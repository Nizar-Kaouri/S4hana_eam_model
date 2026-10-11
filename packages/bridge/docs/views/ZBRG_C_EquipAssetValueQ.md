# ZBRG_C_EquipAssetValueQ

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Equipment Asset Value |
| Module | bridge: `eam:equipment` + `fi_aa:rpt_asset_balance` |
| Batch | 1 |
| Layer | link (`@VDM.viewType: #CONSUMPTION`) |
| Kind | transient view entity |
| Data category | analytical query |
| Data source | `ZBRG_I_EquipmentAssetValue` |
| Source file | `src/zbrg_c_equipassetvalueq.ddls.asddls` |

## Purpose

Analytical query on ZBRG_I_EquipmentAssetValue: asset values per planning plant and equipment category at a key date.

## Parameters

- `P_KeyDate` : `abap.dats`

## Keys

- none (transient / aggregated)

## Associations defined here

- none

## Access control

No DCL by design: Transient analytical query (link); authorization is enforced by the DCL of its provider ZBRG_I_EquipmentAssetValue (see GEN-Q01).

## Example use case

Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.

## Open verification items

`GEN-Q01` - see `BATCH_REPORT.md`.
