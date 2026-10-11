# ZMMX_C_RequisitionMigCount

> Version **1.0.0**

| | |
|---|---|
| Description | RequisitionMigCount |
| Module | `purchase_requisition` |
| Batch | 1 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZMMX_C_RequisitionMig` |
| Source file | `src/zmmx_c_requisitionmigcount.ddls.asddls` |

## Purpose

Read RequisitionMigCount as source records; approve the key-date population before posting.

## Keys

- `PurchaseRequisition`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
