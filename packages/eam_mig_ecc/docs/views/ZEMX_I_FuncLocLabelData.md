# ZEMX_I_FuncLocLabelData

> Version **1.0.0**

| | |
|---|---|
| Description | FuncLocLabel source data |
| Module | `functional_location` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `iflos` |
| Source file | `src/zemx_i_funcloclabeldata.ddls.asddls` |

## Purpose

FuncLocLabel source data

## Keys

- `FunctionalLocation`
- `LabelingSystem`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Export the selected migration scope; validate keys and row counts before loading.
