# ZMMX_B_Characteristic

> Version **1.0.0**

| | |
|---|---|
| Description | Characteristic |
| Module | `product` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #DIMENSION |
| Data source | `cabn` |
| Source file | `src/zmmx_b_characteristic.ddls.asddls` |

## Purpose

Characteristic names by internal number (current version): the name is the key used on S/4HANA, the internal number differs.

## Keys

- `CharcInternalID`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Find the name of characteristic 0000000815.
