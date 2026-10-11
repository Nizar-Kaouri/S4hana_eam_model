# Migration interface: gl_account

> Version **1.0.0**

- **Read by:** customer-selected supported posting interface; reference data is not posted
- **Load after:** - (first level)
- **Business key:** `ChartOfAccounts`, `GLAccount` · numbering **keep**
- **Key rule:** Preserve source identifiers in an audit ledger; map regenerated internal IDs and target numbering. Never assume internal IDs survive migration.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZFIX_C_GLAccountMig`

- Source: `ZFIX_I_GLAccount`
- Keys: `ChartOfAccounts`, `GLAccount`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Customers and suppliers require Business Partner/CVI mapping, roles and numbering. FI BSEG may be a cluster table in ECC and therefore cannot be assumed readable by CDS; use the full-row ABAP helper or a verified extraction interface when necessary. Open-at-cutover means posted by cutover and not cleared by cutover, including subsequently cleared items. Separate currencies, debit/credit signs, ledgers and fiscal periods; prevent double-counting subledger openings in G/L balances.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `ChartOfAccounts` | SKA1-KTOPL | customer interface field: ChartOfAccounts (unconfirmed) | copy | yes |
| `GLAccount` | SKA1-SAKNR | customer interface field: GLAccount (unconfirmed) | copy | yes |
| `AccountGroup` | SKA1-KTOKS | customer interface field: AccountGroup (unconfirmed) | copy | yes |
| `BalanceSheetAccount` | SKA1-XBILK | customer interface field: BalanceSheetAccount (unconfirmed) | copy | yes |
| `DeletionFlag` | SKA1-XLOEV | customer interface field: DeletionFlag (unconfirmed) | copy | yes |

## `ZFIX_C_GLAccountTextMig`

- Source: `ZFIX_I_GLAccountText`
- Keys: `Language`, `ChartOfAccounts`, `GLAccount`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Customers and suppliers require Business Partner/CVI mapping, roles and numbering. FI BSEG may be a cluster table in ECC and therefore cannot be assumed readable by CDS; use the full-row ABAP helper or a verified extraction interface when necessary. Open-at-cutover means posted by cutover and not cleared by cutover, including subsequently cleared items. Separate currencies, debit/credit signs, ledgers and fiscal periods; prevent double-counting subledger openings in G/L balances.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Language` | SKAT-SPRAS | customer interface field: Language (unconfirmed) | copy | yes |
| `ChartOfAccounts` | SKAT-KTOPL | customer interface field: ChartOfAccounts (unconfirmed) | copy | yes |
| `GLAccount` | SKAT-SAKNR | customer interface field: GLAccount (unconfirmed) | copy | yes |
| `GLAccountName` | SKAT-TXT20 | customer interface field: GLAccountName (unconfirmed) | copy | yes |
| `GLAccountDescription` | SKAT-TXT50 | customer interface field: GLAccountDescription (unconfirmed) | copy | yes |

## `ZFIX_C_GLCompanyMig`

- Source: `ZFIX_I_GLCompany`
- Keys: `CompanyCode`, `GLAccount`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Customers and suppliers require Business Partner/CVI mapping, roles and numbering. FI BSEG may be a cluster table in ECC and therefore cannot be assumed readable by CDS; use the full-row ABAP helper or a verified extraction interface when necessary. Open-at-cutover means posted by cutover and not cleared by cutover, including subsequently cleared items. Separate currencies, debit/credit signs, ledgers and fiscal periods; prevent double-counting subledger openings in G/L balances.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `CompanyCode` | SKB1-BUKRS | customer interface field: CompanyCode (unconfirmed) | copy | yes |
| `GLAccount` | SKB1-SAKNR | customer interface field: GLAccount (unconfirmed) | copy | yes |
| `AccountCurrency` | SKB1-WAERS | customer interface field: AccountCurrency (unconfirmed) | copy | yes |
| `OpenItemManagement` | SKB1-XOPVW | customer interface field: OpenItemManagement (unconfirmed) | copy | yes |
| `DeletionFlag` | SKB1-XLOEB | customer interface field: DeletionFlag (unconfirmed) | copy | yes |

## Reconciliation

- Counts: `ZFIX_C_GLAccountMigCount` (ECC) vs `ZFIT_I_GLAccountCount` (S/4HANA) per `ChartOfAccounts`
- Records and fields: `ZFIX_C_GLAccountMig` vs `ZFIT_I_GLAccountCompare` on `ChartOfAccounts`, `GLAccount`; compared: -

```bash
python3 tools/mig_reconcile.py counts --product fi_mig_ecc --module gl_account --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --product fi_mig_ecc --module gl_account --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- Customers and suppliers require Business Partner/CVI mapping, roles and numbering. FI BSEG may be a cluster table in ECC and therefore cannot be assumed readable by CDS; use the full-row ABAP helper or a verified extraction interface when necessary. Open-at-cutover means posted by cutover and not cleared by cutover, including subsequently cleared items. Separate currencies, debit/credit signs, ledgers and fiscal periods; prevent double-counting subledger openings in G/L balances.
