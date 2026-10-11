# ZEMX_I_FuncLoc

> Version **1.0.0**

| | |
|---|---|
| Description | Functional location |
| Module | `functional_location` |
| Batch | 2 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | #DIMENSION |
| Data source | `ZEMX_B_FuncLocHeader` |
| Source file | `src/zemx_i_funcloc.ddls.asddls` |

## Purpose

Functional location with hierarchy, category, planning data, location / account assignment and deletion flag: the master record; repeating child records are separate.

## Keys

- `FunctionalLocation`

## Associations defined here

- `_Address` → `ZEMX_B_Address` [0..1]

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Read the hierarchy of plant 1000 top-down: filter MaintenancePlanningPlant = '1000'.
