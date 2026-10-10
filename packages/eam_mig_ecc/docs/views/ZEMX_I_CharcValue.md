# ZEMX_I_CharcValue

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Characteristic value (migration extract) |
| Module | `classification` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #FACT |
| Data source | `ausp`, join `cabn` |
| Source file | `src/zemx_i_charcvalue.ddls.asddls` |

## Purpose

Characteristic values of classified objects with the characteristic name instead of the internal number.

## Keys

- `objek`
- `atinn`
- `atzhl`
- `klart`
- `adzhl`

## Associations defined here

- none

## Access control

No DCL by design: Migration extraction/reconciliation view on ECC: it must return every record of the object. Access is controlled by the extraction channel (ODP/RFC user, S_TABU_NAM / S_TABU_DIS), not by CDS access control (decision XGEN-D01).

## Example use case

Extract the values of equipment 10000001: filter ClassType = '002' and ClassifiedObject = '000000000010000001'.

## Open verification items

`XCL-003`, `XCL-004` - see `BATCH_REPORT.md`.
