# ZPSV_I_Project

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Project |
| Module | `project` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | #DIMENSION |
| Data source | `I_EnterpriseProject` |
| Source file | `src/zpsv_i_project.ddls.asddls` |

## Purpose

One row per project definition: external project number, description, project profile, processing status, company code, controlling area, profit center, responsible cost center, plant, currency and planned dates.

## Keys

- `ProjectInternalID`

## Associations defined here

- `_CompanyCode` → `I_CompanyCode` [0..1]

## Access control

Role inherits the conditions of `I_EnterpriseProject`.

## Example use case

Projects per profile and status; shutdown projects of a plant.

## Open verification items

`PS-001`, `PS-002`, `PS-003`, `PS-D01` - see `BATCH_REPORT.md`.
