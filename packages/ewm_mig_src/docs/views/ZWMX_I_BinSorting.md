# ZWMX_I_BinSorting

> Status: **draft-unverified** · tested release: none (native DDIC and SAP activation pending). Nothing below has been activated on a system.

| | |
|---|---|
| Description | BinSorting |
| Module | `storage_bin` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZWMX_I_BinSortingData` |
| Source file | `src/zwmx_i_binsorting.ddls.asddls` |

## Purpose

Read BinSorting as source candidates; approve the key-date population before posting.

## Keys

- `Warehouse`
- `StorageBin`
- `ActivityArea`
- `Activity`

## Associations defined here

- none

## Access control

No DCL by design: Read-only native migration extraction without DCL. Restrict the CDS extraction channel to authorized migration users; native table display authorization alone does not protect every CDS consumer. Verify business authorization and current-client isolation on SAP.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.

## Open verification items

none
