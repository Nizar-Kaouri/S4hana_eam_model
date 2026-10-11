# ZEMX_B_FuncLocDesc

> Version **1.0.0**

| | |
|---|---|
| Description | Functional location description |
| Module | `functional_location` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #TEXT |
| Data source | `iflotx` |
| Source file | `src/zemx_b_funclocdesc.ddls.asddls` |

## Purpose

Functional location descriptions (IFLOTX) per language with the long-text indicator.

## Keys

- `FunctionalLocation`
- `Language`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Read the German description of FL 1000-PUMP-01.
