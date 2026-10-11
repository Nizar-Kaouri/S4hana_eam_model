# ZEMX_I_FuncLocHeader

> Version **1.0.0**

| | |
|---|---|
| Description | Functional location header |
| Module | `functional_location` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #DIMENSION |
| Data source | `iflot` |
| Source file | `src/zemx_i_funclocheader.ddls.asddls` |

## Purpose

Functional location master records (IFLOT) with category, hierarchy, planning data and general data.

## Keys

- `FunctionalLocation`

## Associations defined here

- `_LocAcctAssignment` → `ZEMX_I_LocAcctAssignment` [0..1]
- `_DeletionFlag` → `ZEMX_I_StatusDeletionFlag` [0..1]

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Read the superior location of FL 1000-PUMP-01.
