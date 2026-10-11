# ZFCT_B_CaseAttributeCompare

> Status: **draft-unverified** · tested release: none (native DDIC and SAP activation pending). Nothing below has been activated on a system.

| | |
|---|---|
| Description | CaseAttributeCompare |
| Module | `dispute_case` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `scmg_t_case_attr` |
| Source file | `src/zfct_b_caseattributecompare.ddls.asddls` |

## Purpose

Read CaseAttributeCompare as target comparison candidates.

## Keys

- `CaseUUID`

## Associations defined here

- none

## Access control

No DCL by design: Read-only native migration extraction without DCL. Restrict the CDS extraction channel to authorized migration users; native table display authorization alone does not protect every CDS consumer. Verify business authorization and current-client isolation on SAP.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.

## Open verification items

`FCT-013` - see `BATCH_REPORT.md`.
