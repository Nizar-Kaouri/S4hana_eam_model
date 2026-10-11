# ZFCX_I_DisputeCase

> Status: **draft-unverified** · tested release: none (native DDIC and SAP activation pending). Nothing below has been activated on a system.

| | |
|---|---|
| Description | DisputeCase |
| Module | `dispute_case` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZFCX_B_DisputeCaseData` |
| Source file | `src/zfcx_i_disputecase.ddls.asddls` |

## Purpose

Read DisputeCase as source candidates; approve the key-date population before posting.

## Keys

- `CaseUUID`

## Associations defined here

- none

## Access control

No DCL by design: Read-only native migration extraction without DCL. Restrict the CDS extraction channel to authorized migration users; native table display authorization alone does not protect every CDS consumer. Verify business authorization and current-client isolation on SAP.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.

## Open verification items

none
