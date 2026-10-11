# ZEMX_B_ClassHeader

> Version **1.0.0**

| | |
|---|---|
| Description | Class header |
| Module | `classification` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #DIMENSION |
| Data source | `klah` |
| Source file | `src/zemx_b_classheader.ddls.asddls` |

## Purpose

Classes (KLAH) by internal number.

## Keys

- `ClassInternalID`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Find the name of class 0000004711.
