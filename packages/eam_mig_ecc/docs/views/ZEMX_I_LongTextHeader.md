# ZEMX_I_LongTextHeader

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Long text header |
| Module | `long_text` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `stxh` |
| Source file | `src/zemx_i_longtextheader.ddls.asddls` |

## Purpose

Index of the SAPscript long texts of EAM objects (STXH): which texts exist, in which language, when changed.

## Keys

- `tdobject`
- `tdname`
- `tdid`
- `tdspras`

## Associations defined here

- none

## Access control

No DCL by design: Migration view on ECC: it must return every record of the object. Access is controlled by the user / RFC user of the load program and the extraction channel (S_TABU_NAM), not by CDS access control (decision XGEN-D01; CDS access control also needs a newer release than the 7.40 SP08 baseline).

## Example use case

Count the equipment long texts: filter TextObject = 'EQUI'.

## Open verification items

`XLT-001`, `XLT-G01` - see `BATCH_REPORT.md`.
