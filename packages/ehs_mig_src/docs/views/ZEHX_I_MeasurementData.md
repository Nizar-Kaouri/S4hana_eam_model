# ZEHX_I_MeasurementData

> Status: **draft-unverified** · tested release: none (draft, customer staging on NetWeaver 7.40 SP08+ assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | MeasurementData |
| Module | `environmental_data` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `zehx_ehs018` |
| Source file | `src/zehx_i_measurementdata.ddls.asddls` |

## Purpose

Read MeasurementData as source candidates; approve the key-date population before posting.

## Keys

- `SourceSystem`
- `SourceClient`
- `ExportBatch`
- `CollectionID`
- `MeasurementID`

## Associations defined here

- none

## Access control

No DCL by design: Administrative staging only. No DCL supplied: restrict table and CDS access to authorized migration users in an isolated client. These views do not inherit native EWM/TM/FSCM/EHS business authorizations. Never expose sensitive staging data through an unrestricted service.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.

## Open verification items

`EHX-018` - see `BATCH_REPORT.md`.
