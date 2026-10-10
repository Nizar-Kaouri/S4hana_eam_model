# ZEHT_I_SpecificationCompare

> Status: **draft-unverified** · tested release: none (draft, S/4HANA 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | SpecificationCompare |
| Module | `specification` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `zeht_eht005` |
| Source file | `src/zeht_i_specificationcompare.ddls.asddls` |

## Purpose

Read SpecificationCompare as target comparison candidates.

## Keys

- `SourceSystem`
- `SourceClient`
- `ExportBatch`
- `SpecificationID`
- `Version`

## Associations defined here

- none

## Access control

No DCL by design: Administrative staging only. No DCL supplied: restrict table and CDS access to authorized migration users in an isolated client. These views do not inherit native EWM/TM/FSCM/EHS business authorizations. Never expose sensitive staging data through an unrestricted service.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.

## Open verification items

`EHT-005` - see `BATCH_REPORT.md`.
