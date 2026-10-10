# ZFCX_I_CreditExposureData

> Status: **draft-unverified** · tested release: none (draft, customer staging on NetWeaver 7.40 SP08+ assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | CreditExposureData |
| Module | `credit_exposure` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `zfcx_fcs004` |
| Source file | `src/zfcx_i_creditexposuredata.ddls.asddls` |

## Purpose

Read CreditExposureData as source candidates; approve the key-date population before posting.

## Keys

- `SourceSystem`
- `SourceClient`
- `ExportBatch`
- `BusinessPartner`
- `CreditSegment`
- `ExposureCategory`
- `SourceDocument`
- `SourceItem`

## Associations defined here

- none

## Access control

No DCL by design: Administrative staging only. No DCL supplied: restrict table and CDS access to authorized migration users in an isolated client. These views do not inherit native EWM/TM/FSCM/EHS business authorizations. Never expose sensitive staging data through an unrestricted service.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.

## Open verification items

`FCX-004` - see `BATCH_REPORT.md`.
