# ZMMX_B_ContractPartnerData

> Version **1.0.0**

| | |
|---|---|
| Description | ContractPartnerData |
| Module | `purchasing_contract` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `ekpa` |
| Source file | `src/zmmx_b_contractpartnerdata.ddls.asddls` |

## Purpose

Preserve the business key and selected parent population without flattening repeating records.

## Keys

- `PurchasingContract`
- `PurchasingOrganization`
- `SupplierSubrange`
- `Plant`
- `PartnerFunction`
- `PartnerCounter`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
