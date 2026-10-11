# ZFCX_B_CollectContactData

> Status: **draft-unverified** · tested release: none (native DDIC and SAP activation pending). Nothing below has been activated on a system.

| | |
|---|---|
| Description | CollectContactData |
| Module | `collection_activity` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `udm_cct_attr` |
| Source file | `src/zfcx_b_collectcontactdata.ddls.asddls` |

## Purpose

Read CollectContactData as source candidates; approve the key-date population before posting.

## Keys

- `ContactUUID`

## Associations defined here

- none

## Access control

No DCL by design: Read-only native migration extraction without DCL. Restrict the CDS extraction channel to authorized migration users; native table display authorization alone does not protect every CDS consumer. Verify business authorization and current-client isolation on SAP.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.

## Open verification items

`FCX-007` - see `BATCH_REPORT.md`.
