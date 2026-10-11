# ZFIX_B_GLCompanyData

> Version **1.0.0**

| | |
|---|---|
| Description | GLCompanyData |
| Module | `gl_account` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `skb1` |
| Source file | `src/zfix_b_glcompanydata.ddls.asddls` |

## Purpose

Read GLCompanyData as source records; approve the key-date population before posting.

## Keys

- `CompanyCode`
- `GLAccount`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
