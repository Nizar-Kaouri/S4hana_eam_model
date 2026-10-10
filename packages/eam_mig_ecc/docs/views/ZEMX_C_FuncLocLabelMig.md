# ZEMX_C_FuncLocLabelMig

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | FuncLocLabel migration extract |
| Module | `functional_location` |
| Batch | 2 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_I_FuncLocLabel` |
| Source file | `src/zemx_c_funcloclabelmig.ddls.asddls` |

## Purpose

FuncLocLabel migration extract

## Keys

- `FunctionalLocation`
- `LabelingSystem`

## Associations defined here

- `_Parent` → `ZEMX_I_FuncLoc` [0..1]

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Export the selected migration scope; validate keys and row counts before loading.

## Open verification items

none
