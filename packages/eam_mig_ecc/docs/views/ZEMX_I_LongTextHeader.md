# ZEMX_I_LongTextHeader

> Version **1.0.0**

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

- `TextObject`
- `TextName`
- `TextID`
- `Language`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Count the equipment long texts: filter TextObject = 'EQUI'.
