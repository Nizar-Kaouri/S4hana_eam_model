# ZEMX_I_EquipmentHeader

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Equipment header |
| Module | `equipment` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #DIMENSION |
| Data source | `equi` |
| Source file | `src/zemx_i_equipmentheader.ddls.asddls` |

## Purpose

Equipment master records (EQUI): category, object type, manufacturer, acquisition and serial data.

## Keys

- `Equipment`

## Associations defined here

- `_DeletionFlag` → `ZEMX_I_StatusDeletionFlag` [0..1]

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Read the manufacturer data of equipment 10000001.

## Open verification items

`XEQ-004`, `XEQ-005` - see `BATCH_REPORT.md`.
