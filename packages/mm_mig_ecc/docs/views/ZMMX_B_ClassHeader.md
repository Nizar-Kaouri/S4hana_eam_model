# ZMMX_B_ClassHeader

> Version **1.0.0**

| | |
|---|---|
| Description | Class header |
| Module | `product` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #DIMENSION |
| Data source | `klah` |
| Source file | `src/zmmx_b_classheader.ddls.asddls` |

## Purpose

Classes (KLAH) by internal number.

## Keys

- `ClassInternalID`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Find the name of class 0000004711.
