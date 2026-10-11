# ZFIV_C_GLBalanceAccountQ

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | G/L Balance by Account Group |
| Module | link: `gl_account` + `gl_line_item` |
| Batch | 1 |
| Layer | link (`@VDM.viewType: #CONSUMPTION`) |
| Kind | transient view entity |
| Data category | analytical query |
| Data source | `ZFIV_I_GLItemWithAccount` |
| Source file | `src/zfiv_c_glbalanceaccountq.ddls.asddls` |

## Purpose

Analytical query on ZFIV_I_GLItemWithAccount: balances per company code and account group.

## Keys

- none (transient / aggregated)

## Associations defined here

- none

## Access control

No DCL by design: Transient analytical query (link); authorization is enforced by the DCL of its provider ZFIV_I_GLItemWithAccount (see GEN-Q01).

## Example use case

Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.

## Open verification items

`GEN-Q01` - see `BATCH_REPORT.md`.
