# ZPSV_I_Project

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Project - Cube |
| Module | `project` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | #CUBE |
| Data source | `ZPSV_B_Project` |
| Source file | `src/zpsv_i_project.ddls.asddls` |

## Purpose

Project cube: number of projects per profile, status, company code and responsible cost center.

## Keys

- `ProjectInternalID`

## Associations defined here

- `_Project` → `ZPSV_B_Project` [1..1]

## Access control

Role inherits the conditions of `ZPSV_B_Project`.

## Example use case

Number of released projects per profile and plant.

## Open verification items

none
