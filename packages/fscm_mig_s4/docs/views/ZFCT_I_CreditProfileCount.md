# ZFCT_I_CreditProfileCount

> Status: **draft-unverified** · tested release: none (native DDIC and SAP activation pending). Nothing below has been activated on a system.

| | |
|---|---|
| Description | CreditProfileCount |
| Module | `credit_profile` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | - |
| Data source | `ZFCT_B_CreditProfileCompare` |
| Source file | `src/zfct_i_creditprofilecount.ddls.asddls` |

## Purpose

Read CreditProfileCount as target comparison candidates.

## Keys

- none (transient / aggregated)

## Associations defined here

- none

## Access control

No DCL by design: Read-only native migration extraction without DCL. Restrict the CDS extraction channel to authorized migration users; native table display authorization alone does not protect every CDS consumer. Verify business authorization and current-client isolation on SAP.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.

## Open verification items

none
