# ZWMX_I_PackSpecData

> Status: **draft-unverified** · tested release: none (draft, customer staging on NetWeaver 7.40 SP08+ assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | PackSpecData |
| Module | `pack_specification` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `zwmx_wms014` |
| Source file | `src/zwmx_i_packspecdata.ddls.asddls` |

## Purpose

Read PackSpecData as source candidates; approve the key-date population before posting.

## Keys

- `SourceSystem`
- `SourceClient`
- `ExportBatch`
- `PackSpecification`
- `Version`

## Associations defined here

- none

## Access control

No DCL by design: Administrative staging only. No DCL supplied: restrict table and CDS access to authorized migration users in an isolated client. These views do not inherit native EWM/TM/FSCM/EHS business authorizations. Never expose sensitive staging data through an unrestricted service.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.

## Open verification items

`WMX-014` - see `BATCH_REPORT.md`.
