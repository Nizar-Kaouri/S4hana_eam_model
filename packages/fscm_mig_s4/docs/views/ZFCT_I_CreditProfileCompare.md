# ZFCT_I_CreditProfileCompare

> Status: **draft-unverified** · tested release: none (native DDIC and SAP activation pending). Nothing below has been activated on a system.

| | |
|---|---|
| Description | CreditProfileCompare |
| Module | `credit_profile` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `ukmbp_cms` |
| Source file | `src/zfct_i_creditprofilecompare.ddls.asddls` |

## Purpose

Read CreditProfileCompare as target comparison candidates.

## Keys

- `BusinessPartner`

## Associations defined here

- none

## Access control

No DCL by design: Read-only native migration extraction without DCL. Restrict the CDS extraction channel to authorized migration users; native table display authorization alone does not protect every CDS consumer. Verify business authorization and current-client isolation on SAP.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.

## Open verification items

`FCT-001` - see `BATCH_REPORT.md`.
