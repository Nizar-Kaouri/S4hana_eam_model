# ZEMT_B_MaintPlanCompare

> Version **1.0.0**

| | |
|---|---|
| Description | Maintenance plan compare (reconciliation) |
| Module | `maintenance_plan` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | #DIMENSION |
| Data source | `I_MaintenancePlan` |
| Source file | `src/zemt_b_maintplancompare.ddls.asddls` |

## Purpose

Maintenance plan on S/4HANA with the business key and the fields compared after the load; element names equal the ECC extract so that tools/mig_reconcile.py compares them by name.

## Keys

- `MaintenancePlan`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Export this view after the load and compare it with the ECC extract: python3 tools/mig_reconcile.py fields --module maintenance_plan ...
