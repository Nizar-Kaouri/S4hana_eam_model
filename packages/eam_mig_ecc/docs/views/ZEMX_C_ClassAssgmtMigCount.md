# ZEMX_C_ClassAssgmtMigCount

> Version **1.0.0**

| | |
|---|---|
| Description | Class assignment count (migration) |
| Module | `classification` |
| Batch | 2 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_C_ClassAssignmentMig` |
| Source file | `src/zemx_c_classassgmtmigcount.ddls.asddls` |

## Purpose

Record count of the class assignments delivered by ZEMX_C_ClassAssignmentMig per ClassType, Class; compared with the same count on S/4HANA by tools/mig_reconcile.py.

## Keys

- `ClassType`
- `Class`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Export this view before the load and the S/4HANA count view after it; the reconcile tool lists every ClassType / Class combination whose counts differ.
