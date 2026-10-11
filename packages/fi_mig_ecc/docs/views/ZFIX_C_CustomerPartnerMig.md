# ZFIX_C_CustomerPartnerMig

> Version **1.0.0**

| | |
|---|---|
| Description | CustomerPartnerMig |
| Module | `customer` |
| Batch | 1 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZFIX_I_CustomerPartner` |
| Source file | `src/zfix_c_customerpartnermig.ddls.asddls` |

## Purpose

Preserve the business key and selected parent population without flattening repeating records.

## Keys

- `Customer`
- `SalesOrganization`
- `DistributionChannel`
- `Division`
- `PartnerFunction`
- `PartnerCounter`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
