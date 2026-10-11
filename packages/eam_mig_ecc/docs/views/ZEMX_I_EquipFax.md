# ZEMX_I_EquipFax

> Version **1.0.0**

| | |
|---|---|
| Description | EquipFax |
| Module | `equipment` |
| Batch | 2 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_B_EquipFaxData`, join `ZEMX_I_Equipment` |
| Source file | `src/zemx_i_equipfax.ddls.asddls` |

## Purpose

Preserve the business key and selected parent population without flattening repeating records.

## Keys

- `Equipment`
- `AddressNumber`
- `PersonNumber`
- `CommunicationValidFrom`
- `CommunicationCounter`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
