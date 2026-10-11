# ZMMX_I_ContractPartner

> Version **1.0.0**

| | |
|---|---|
| Description | ContractPartner |
| Module | `purchasing_contract` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZMMX_B_ContractPartnerData`, join `ZMMX_I_ContractHeader` |
| Source file | `src/zmmx_i_contractpartner.ddls.asddls` |

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
