# ZEMX_I_Equipment

> Version **1.0.0**

| | |
|---|---|
| Description | Equipment |
| Module | `equipment` |
| Batch | 2 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | #DIMENSION |
| Data source | `ZEMX_B_EquipmentHeader`, join `ZEMX_B_EquipmentTimeSegment` |
| Source file | `src/zemx_i_equipment.ddls.asddls` |

## Purpose

Equipment in its current time segment with installation location, superordinate equipment, main work center (business key), location / account assignment, manufacturer data and deletion flag: the equipment master record; repeating child data is exported separately.

## Keys

- `Equipment`

## Associations defined here

- `_Address` → `ZEMX_B_Address` [0..1]

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Read the equipment of plant 1000 in installation order: filter MaintenancePlanningPlant = '1000'.
