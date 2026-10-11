# ZEMX_I_EquipmentHeader

> Version **1.0.0**

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
