# ZTMX_I_FreightScaleData

> Status: **draft-unverified** · tested release: none (draft, customer staging on NetWeaver 7.40 SP08+ assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | FreightScaleData |
| Module | `freight_agreement` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `ztmx_tms010` |
| Source file | `src/ztmx_i_freightscaledata.ddls.asddls` |

## Purpose

Read FreightScaleData as source candidates; approve the key-date population before posting.

## Keys

- `SourceSystem`
- `SourceClient`
- `ExportBatch`
- `AgreementID`
- `Version`
- `RateID`
- `ScaleLine`

## Associations defined here

- none

## Access control

No DCL by design: Administrative staging only. No DCL supplied: restrict table and CDS access to authorized migration users in an isolated client. These views do not inherit native EWM/TM/FSCM/EHS business authorizations. Never expose sensitive staging data through an unrestricted service.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.

## Open verification items

`TMX-010` - see `BATCH_REPORT.md`.
