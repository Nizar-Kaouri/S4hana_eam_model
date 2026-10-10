# ZEMX_I_ObjectCharcValue

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Object characteristic value |
| Module | `classification` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #FACT |
| Data source | `ausp` |
| Source file | `src/zemx_i_objectcharcvalue.ddls.asddls` |

## Purpose

Characteristic values of objects (AUSP, object indicator 'O').

## Keys

- `objek`
- `atinn`
- `atzhl`
- `klart`
- `adzhl`

## Associations defined here

- `_Characteristic` → `ZEMX_I_Characteristic` [0..1]

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Read the values of equipment 10000001.

## Open verification items

`XCL-004` - see `BATCH_REPORT.md`.
