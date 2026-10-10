# ZFCX_I_PaymentPromise

> Status: **draft-unverified** · tested release: none (native DDIC and SAP activation pending). Nothing below has been activated on a system.

| | |
|---|---|
| Description | PaymentPromise |
| Module | `promise_to_pay` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZFCX_I_PaymentPromiseData` |
| Source file | `src/zfcx_i_paymentpromise.ddls.asddls` |

## Purpose

Read PaymentPromise as source candidates; approve the key-date population before posting.

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
