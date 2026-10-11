# Migration interface: customer

> Version **1.0.0**

- **Read by:** customer-selected supported posting interface; reference data is not posted
- **Load after:** - (first level)
- **Business key:** `Customer` · numbering **keep**
- **Key rule:** Preserve source identifiers in an audit ledger; map regenerated internal IDs and target numbering. Never assume internal IDs survive migration.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZFIX_C_CustomerMig`

- Source: `ZFIX_I_Customer`
- Keys: `Customer`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Customers and suppliers require Business Partner/CVI mapping, roles and numbering. FI BSEG may be a cluster table in ECC and therefore cannot be assumed readable by CDS; use the full-row ABAP helper or a verified extraction interface when necessary. Open-at-cutover means posted by cutover and not cleared by cutover, including subsequently cleared items. Separate currencies, debit/credit signs, ledgers and fiscal periods; prevent double-counting subledger openings in G/L balances.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Customer` | KNA1-KUNNR | customer interface field: Customer (unconfirmed) | copy | yes |
| `CustomerName` | KNA1-NAME1 | customer interface field: CustomerName (unconfirmed) | copy | yes |
| `Country` | KNA1-LAND1 | customer interface field: Country (unconfirmed) | copy | yes |
| `Region` | KNA1-REGIO | customer interface field: Region (unconfirmed) | copy | yes |
| `AccountGroup` | KNA1-KTOKD | customer interface field: AccountGroup (unconfirmed) | copy | yes |
| `DeletionFlag` | KNA1-LOEVM | customer interface field: DeletionFlag (unconfirmed) | copy | yes |

## `ZFIX_C_CustomerCompanMig`

- Source: `ZFIX_I_CustomerCompan`
- Keys: `Customer`, `CompanyCode`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Customers and suppliers require Business Partner/CVI mapping, roles and numbering. FI BSEG may be a cluster table in ECC and therefore cannot be assumed readable by CDS; use the full-row ABAP helper or a verified extraction interface when necessary. Open-at-cutover means posted by cutover and not cleared by cutover, including subsequently cleared items. Separate currencies, debit/credit signs, ledgers and fiscal periods; prevent double-counting subledger openings in G/L balances.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Customer` | KNB1-KUNNR | customer interface field: Customer (unconfirmed) | copy | yes |
| `CompanyCode` | KNB1-BUKRS | customer interface field: CompanyCode (unconfirmed) | copy | yes |
| `ReconciliationAccount` | KNB1-AKONT | customer interface field: ReconciliationAccount (unconfirmed) | copy | yes |
| `PaymentTerms` | KNB1-ZTERM | customer interface field: PaymentTerms (unconfirmed) | copy | yes |
| `PaymentMethods` | KNB1-ZWELS | customer interface field: PaymentMethods (unconfirmed) | copy | yes |
| `DeletionFlag` | KNB1-LOEVM | customer interface field: DeletionFlag (unconfirmed) | copy | yes |

## `ZFIX_C_CustomerSalesMig`

- Source: `ZFIX_I_CustomerSales`
- Keys: `Customer`, `SalesOrganization`, `DistributionChannel`, `Division`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Customers and suppliers require Business Partner/CVI mapping, roles and numbering. FI BSEG may be a cluster table in ECC and therefore cannot be assumed readable by CDS; use the full-row ABAP helper or a verified extraction interface when necessary. Open-at-cutover means posted by cutover and not cleared by cutover, including subsequently cleared items. Separate currencies, debit/credit signs, ledgers and fiscal periods; prevent double-counting subledger openings in G/L balances.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Customer` | KNVV-KUNNR | customer interface field: Customer (unconfirmed) | copy | yes |
| `SalesOrganization` | KNVV-VKORG | customer interface field: SalesOrganization (unconfirmed) | copy | yes |
| `DistributionChannel` | KNVV-VTWEG | customer interface field: DistributionChannel (unconfirmed) | copy | yes |
| `Division` | KNVV-SPART | customer interface field: Division (unconfirmed) | copy | yes |
| `Currency` | KNVV-WAERS | customer interface field: Currency (unconfirmed) | copy | yes |
| `PaymentTerms` | KNVV-ZTERM | customer interface field: PaymentTerms (unconfirmed) | copy | yes |
| `DeletionFlag` | KNVV-LOEVM | customer interface field: DeletionFlag (unconfirmed) | copy | yes |

## Reconciliation

- Counts: `ZFIX_C_CustomerMigCount` (ECC) vs `ZFIT_I_CustomerCount` (S/4HANA) per `Customer`
- Records and fields: `ZFIX_C_CustomerMig` vs `ZFIT_I_CustomerCompare` on `Customer`; compared: `CustomerName`, `Country`, `Region`

```bash
python3 tools/mig_reconcile.py counts --product fi_mig_ecc --module customer --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --product fi_mig_ecc --module customer --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- Customers and suppliers require Business Partner/CVI mapping, roles and numbering. FI BSEG may be a cluster table in ECC and therefore cannot be assumed readable by CDS; use the full-row ABAP helper or a verified extraction interface when necessary. Open-at-cutover means posted by cutover and not cleared by cutover, including subsequently cleared items. Separate currencies, debit/credit signs, ledgers and fiscal periods; prevent double-counting subledger openings in G/L balances.
