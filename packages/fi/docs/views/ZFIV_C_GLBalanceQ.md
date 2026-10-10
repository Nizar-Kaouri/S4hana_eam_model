# ZFIV_C_GLBalanceQ

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | G/L Balance Analysis |
| Module | `gl_line_item` |
| Batch | 2 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | transient view entity |
| Data category | analytical query |
| Data source | `ZFIV_R_GLJournalItem` |
| Source file | `src/zfiv_c_glbalanceq.ddls.asddls` |

## Purpose

Analytical query on ZFIV_R_GLJournalItem: debit, credit and balance per company code and G/L account (trial balance).

## Keys

- none (transient / aggregated)

## Associations defined here

- none

## Access control

No DCL by design: Transient analytical query; authorization is enforced by the DCL of the provider ZFIV_R_GLJournalItem (see GEN-Q01).

## Example use case

Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.

## Open verification items

`GEN-Q01` - see `BATCH_REPORT.md`.
