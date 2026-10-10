# ZEHX_I_DangerousGoods

> Status: **draft-unverified** · tested release: none (draft, customer staging on NetWeaver 7.40 SP08+ assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | DangerousGoods |
| Module | `dangerous_goods` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZEHX_I_DangerousGoodsData` |
| Source file | `src/zehx_i_dangerousgoods.ddls.asddls` |

## Purpose

Read DangerousGoods as source candidates; approve the key-date population before posting.

## Keys

- `SourceSystem`
- `SourceClient`
- `ExportBatch`
- `Product`
- `RegulationID`
- `Version`

## Associations defined here

- none

## Access control

No DCL by design: Administrative staging only. No DCL supplied: restrict table and CDS access to authorized migration users in an isolated client. These views do not inherit native EWM/TM/FSCM/EHS business authorizations. Never expose sensitive staging data through an unrestricted service.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.

## Open verification items

none
