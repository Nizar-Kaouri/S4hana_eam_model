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
| Data source | `ZEMX_I_EquipmentHeader`, join `ZEMX_I_EquipmentTimeSegment` |
| Source file | `src/zemx_i_equipment.ddls.asddls` |

## Purpose

Equipment in its current time segment with installation location, superordinate equipment, main work center (business key), location / account assignment, manufacturer data and deletion flag: the complete business object.

## Keys

- `Equipment`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Read the equipment of plant 1000 in installation order: filter MaintenancePlanningPlant = '1000'.
