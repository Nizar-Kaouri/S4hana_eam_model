# ZEMX_C_FuncLocTextMig

> Version **1.0.0**

| | |
|---|---|
| Description | Functional location text (migration) |
| Module | `functional_location` |
| Batch | 2 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_I_FuncLocText` |
| Source file | `src/zemx_c_funcloctextmig.ddls.asddls` |

## Purpose

Descriptions of the functional locations in scope per language.

## Keys

- `FunctionalLocation`
- `Language`

## Associations defined here

- `_FuncLoc` → `ZEMX_I_FuncLoc` [0..1]

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Read the texts of FL 1000-PUMP-01: filter FunctionalLocation = '1000-PUMP-01'.
