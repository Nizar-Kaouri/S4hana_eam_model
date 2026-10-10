# ZEHX_I_PhraseSet

> Status: **draft-unverified** · tested release: none (native DDIC and SAP activation pending). Nothing below has been activated on a system.

| | |
|---|---|
| Description | PhraseSet |
| Module | `phrase` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZEHX_I_PhraseSetData` |
| Source file | `src/zehx_i_phraseset.ddls.asddls` |

## Purpose

Read PhraseSet as source candidates; approve the key-date population before posting.

## Keys

- `RecordNumber`
- `ChangeState`

## Associations defined here

- none

## Access control

No DCL by design: Read-only native migration extraction without DCL. Restrict the CDS extraction channel to authorized migration users; native table display authorization alone does not protect every CDS consumer. Verify business authorization and current-client isolation on SAP.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.

## Open verification items

none
