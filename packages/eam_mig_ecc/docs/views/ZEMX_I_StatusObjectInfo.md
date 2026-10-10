# ZEMX_I_StatusObjectInfo

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Status object information |
| Module | `object_status` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #DIMENSION |
| Data source | `jsto` |
| Source file | `src/zemx_i_statusobjectinfo.ddls.asddls` |

## Purpose

Status profile per object number (JSTO).

## Keys

- `ObjectNumber`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Read the status profile of equipment object IE000000000010000001.

## Open verification items

`XST-001` - see `BATCH_REPORT.md`.
