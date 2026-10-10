# ZEMT_I_MeasPointCount

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Measuring point count (reconciliation) |
| Module | `measuring_point` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | - |
| Data source | `I_MeasuringPoint` |
| Source file | `src/zemt_i_measpointcount.ddls.asddls` |

## Purpose

Record count of measuring points on S/4HANA per MeasuringPointCategory, MeasuringPointIsCounter; same structure as the ECC count view.

## Keys

- `MeasuringPointCategory`
- `MeasuringPointIsCounter`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Export after the load: python3 tools/mig_reconcile.py counts --module measuring_point --source <ECC export> --target <this export>.

## Open verification items

none
