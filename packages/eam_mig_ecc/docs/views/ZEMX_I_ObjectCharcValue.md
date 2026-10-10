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

No DCL by design: Migration view on ECC: it must return every record of the object. Access is controlled by the user / RFC user of the load program and the extraction channel (S_TABU_NAM), not by CDS access control (decision XGEN-D01; CDS access control also needs a newer release than the 7.40 SP08 baseline).

## Example use case

Read the values of equipment 10000001.

## Open verification items

`XCL-004` - see `BATCH_REPORT.md`.
