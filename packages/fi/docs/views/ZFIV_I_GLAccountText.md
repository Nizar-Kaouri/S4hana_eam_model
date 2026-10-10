# ZFIV_I_GLAccountText

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | G/L Account - Text |
| Module | `gl_account` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | #TEXT |
| Data source | `I_GLAccountText` |
| Source file | `src/zfiv_i_glaccounttext.ddls.asddls` |

## Purpose

Language-dependent G/L account short and long text; text provider for ZFIV_I_GLAccount.

## Keys

- `ChartOfAccounts`
- `GLAccount`
- `Language`

## Associations defined here

- none

## Access control

Role grants unrestricted read access (explicit `grant select on ...;`).

## Example use case

Account names in balance and line item reports.

## Open verification items

`FI-T01` - see `BATCH_REPORT.md`.
