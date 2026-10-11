# ZEMX_B_Address

> Version **1.0.0**

| | |
|---|---|
| Description | Technical object postal address |
| Module | `equipment` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `adrc` |
| Source file | `src/zemx_b_address.ddls.asddls` |

## Purpose

Postal address records with their complete non-client key; address numbers are source-system references.

## Keys

- `AddressNumber`
- `AddressValidFrom`
- `AddressVersion`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Export the selected equipment population and retain Equipment as the parent key.
