# ZFIV_B_GLAccountVH

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | G/L Account - Value Help |
| Module | `gl_account` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | #VALUE_HELP |
| Data source | `ZFIV_B_GLAccount` |
| Source file | `src/zfiv_b_glaccountvh.ddls.asddls` |

## Purpose

Searchable value help for G/L accounts with the name in the logon language.

## Keys

- `ChartOfAccounts`
- `GLAccount`

## Associations defined here

- none

## Access control

Role inherits the conditions of `ZFIV_B_GLAccount`.

## Example use case

Value help for GLAccount in all finance queries.

## Open verification items

none
