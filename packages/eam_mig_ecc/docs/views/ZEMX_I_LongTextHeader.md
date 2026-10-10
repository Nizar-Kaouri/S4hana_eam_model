# ZEMX_I_LongTextHeader

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Long text header (migration extract) |
| Module | `long_text` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `stxh` |
| Source file | `src/zemx_i_longtextheader.ddls.asddls` |

## Purpose

Index of the SAPscript long texts of EAM objects (equipment, functional location, notification, order, task list, maintenance plan / item): which texts exist, in which language, when changed.

## Keys

- `tdobject`
- `tdname`
- `tdid`
- `tdspras`

## Associations defined here

- none

## Access control

No DCL by design: Migration extraction/reconciliation view on ECC: it must return every record of the object. Access is controlled by the extraction channel (ODP/RFC user, S_TABU_NAM / S_TABU_DIS), not by CDS access control (decision XGEN-D01).

## Example use case

Count the equipment long texts to migrate: filter TextObject = 'EQUI'.

## Open verification items

`XLT-001`, `XLT-G01` - see `BATCH_REPORT.md`.
