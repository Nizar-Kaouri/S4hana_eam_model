# ZWMT_I_HandlingUnitCompare

> Status: **draft-unverified** · tested release: none (draft, S/4HANA 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | HandlingUnitCompare |
| Module | `handling_unit` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `zwmt_wmt007` |
| Source file | `src/zwmt_i_handlingunitcompare.ddls.asddls` |

## Purpose

Read HandlingUnitCompare as target comparison candidates.

## Keys

- `SourceSystem`
- `SourceClient`
- `ExportBatch`
- `Warehouse`
- `HandlingUnit`

## Associations defined here

- none

## Access control

No DCL by design: Administrative staging only. No DCL supplied: restrict table and CDS access to authorized migration users in an isolated client. These views do not inherit native EWM/TM/FSCM/EHS business authorizations. Never expose sensitive staging data through an unrestricted service.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.

## Open verification items

`WMT-007` - see `BATCH_REPORT.md`.
