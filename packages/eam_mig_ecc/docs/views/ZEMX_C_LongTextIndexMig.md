# ZEMX_C_LongTextIndexMig

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Long text index (migration) |
| Module | `long_text` |
| Batch | 2 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_I_LongTextHeader` |
| Source file | `src/zemx_c_longtextindexmig.ddls.asddls` |

## Purpose

Long texts of EAM objects to migrate: the work list for the load program, which reads the content with READ_TEXT.

## Keys

- `TextObject`
- `TextName`
- `TextID`
- `Language`

## Associations defined here

- none

## Access control

No DCL by design: Migration view on ECC: it must return every record of the object. Access is controlled by the user / RFC user of the load program and the extraction channel (S_TABU_NAM), not by CDS access control (decision XGEN-D01; CDS access control also needs a newer release than the 7.40 SP08 baseline).

## Example use case

The load program loops over the rows of one TextObject and copies each text to the migrated object.

## Open verification items

none
