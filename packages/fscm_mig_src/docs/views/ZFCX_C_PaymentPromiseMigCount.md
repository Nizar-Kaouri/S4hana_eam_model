# ZFCX_C_PaymentPromiseMigCount

> Status: **draft-unverified** · tested release: none (native DDIC and SAP activation pending). Nothing below has been activated on a system.

| | |
|---|---|
| Description | PaymentPromiseMigCount |
| Module | `promise_to_pay` |
| Batch | 1 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZFCX_C_PaymentPromiseMig` |
| Source file | `src/zfcx_c_paymentpromisemigcount.ddls.asddls` |

## Purpose

Read PaymentPromiseMigCount as source candidates; approve the key-date population before posting.

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
