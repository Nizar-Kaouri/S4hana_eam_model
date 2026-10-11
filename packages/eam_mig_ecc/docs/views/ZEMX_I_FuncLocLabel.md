# ZEMX_I_FuncLocLabel

> Version **1.0.0**

| | |
|---|---|
| Description | FuncLocLabel migration business data |
| Module | `functional_location` |
| Batch | 2 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_I_FuncLocLabelData` |
| Source file | `src/zemx_i_funcloclabel.ddls.asddls` |

## Purpose

FuncLocLabel migration business data

## Keys

- `FunctionalLocation`
- `LabelingSystem`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Export the selected migration scope; validate keys and row counts before loading.
