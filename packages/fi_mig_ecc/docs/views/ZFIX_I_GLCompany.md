# ZFIX_I_GLCompany

> Version **1.0.0**

| | |
|---|---|
| Description | GLCompany |
| Module | `gl_account` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZFIX_B_GLCompanyData` |
| Source file | `src/zfix_i_glcompany.ddls.asddls` |

## Purpose

Read GLCompany as source records; approve the key-date population before posting.

## Keys

- `CompanyCode`
- `GLAccount`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
