# ZEMT_I_MaintOrderCompare

> Version **1.0.0**

| | |
|---|---|
| Description | Maintenance order compare (reconciliation) |
| Module | `maintenance_order` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | #DIMENSION |
| Data source | `I_MaintenanceOrder` |
| Source file | `src/zemt_i_maintordercompare.ddls.asddls` |

## Purpose

Maintenance order on S/4HANA with the business key and the fields compared after the load; element names equal the ECC extract so that tools/mig_reconcile.py compares them by name.

## Keys

- `MaintenanceOrder`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Export this view after the load and compare it with the ECC extract: python3 tools/mig_reconcile.py fields --module maintenance_order ...
