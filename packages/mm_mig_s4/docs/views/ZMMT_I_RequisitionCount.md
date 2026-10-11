# ZMMT_I_RequisitionCount

> Version **1.0.0**

| | |
|---|---|
| Description | RequisitionCount |
| Module | `purchase_requisition` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | - |
| Data source | `ZMMT_B_RequisitionCompare` |
| Source file | `src/zmmt_i_requisitioncount.ddls.asddls` |

## Purpose

Read RequisitionCount as target comparison records.

## Keys

- `PurchaseRequisition`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
