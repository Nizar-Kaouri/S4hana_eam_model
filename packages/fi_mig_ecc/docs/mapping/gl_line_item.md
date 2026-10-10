# Migration interface: gl_line_item

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been run on a system.

- **Read by:** customer-selected supported posting interface; reference data is not posted
- **Load after:** `gl_account`
- **Business key:** `CompanyCode`, `AccountingDocument`, `FiscalYear` · numbering **keep**
- **Key rule:** Preserve source identifiers in an audit ledger; map regenerated internal IDs and target numbering. Never assume internal IDs survive migration.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZFIX_C_AccountingHeadMig`

- Source: `ZFIX_I_AccountingHead`
- Keys: `CompanyCode`, `AccountingDocument`, `FiscalYear`
- Scope: `all rows`
- Delivery mode: **reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Customers and suppliers require Business Partner/CVI mapping, roles and numbering. FI BSEG may be a cluster table in ECC and therefore cannot be assumed readable by CDS; use the full-row ABAP helper or a verified extraction interface when necessary. Open-at-cutover means posted by cutover and not cleared by cutover, including subsequently cleared items. Separate currencies, debit/credit signs, ledgers and fiscal periods; prevent double-counting subledger openings in G/L balances.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `CompanyCode` | BKPF-BUKRS | customer interface field: CompanyCode (unconfirmed) | information only | yes |
| `AccountingDocument` | BKPF-BELNR | customer interface field: AccountingDocument (unconfirmed) | information only | yes |
| `FiscalYear` | BKPF-GJAHR | customer interface field: FiscalYear (unconfirmed) | information only | yes |
| `AccountingDocumentType` | BKPF-BLART | customer interface field: AccountingDocumentType (unconfirmed) | information only | yes |
| `DocumentDate` | BKPF-BLDAT | customer interface field: DocumentDate (unconfirmed) | information only | yes |
| `PostingDate` | BKPF-BUDAT | customer interface field: PostingDate (unconfirmed) | information only | yes |
| `DocumentCurrency` | BKPF-WAERS | customer interface field: DocumentCurrency (unconfirmed) | information only | yes |

## `ZFIX_C_AccountingItemMig`

- Source: `ZFIX_I_AccountingItem`
- Keys: `CompanyCode`, `AccountingDocument`, `FiscalYear`, `AccountingDocumentItem`
- Scope: `all rows`
- Delivery mode: **reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Customers and suppliers require Business Partner/CVI mapping, roles and numbering. FI BSEG may be a cluster table in ECC and therefore cannot be assumed readable by CDS; use the full-row ABAP helper or a verified extraction interface when necessary. Open-at-cutover means posted by cutover and not cleared by cutover, including subsequently cleared items. Separate currencies, debit/credit signs, ledgers and fiscal periods; prevent double-counting subledger openings in G/L balances.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `CompanyCode` | BSEG-BUKRS | customer interface field: CompanyCode (unconfirmed) | information only | yes |
| `AccountingDocument` | BSEG-BELNR | customer interface field: AccountingDocument (unconfirmed) | information only | yes |
| `FiscalYear` | BSEG-GJAHR | customer interface field: FiscalYear (unconfirmed) | information only | yes |
| `AccountingDocumentItem` | BSEG-BUZEI | customer interface field: AccountingDocumentItem (unconfirmed) | information only | yes |
| `GLAccount` | BSEG-HKONT | customer interface field: GLAccount (unconfirmed) | information only | yes |
| `AccountType` | BSEG-KOART | customer interface field: AccountType (unconfirmed) | information only | yes |
| `DebitCreditCode` | BSEG-SHKZG | customer interface field: DebitCreditCode (unconfirmed) | information only | yes |
| `DocumentAmount` | BSEG-WRBTR | customer interface field: DocumentAmount (unconfirmed) | information only | yes |
| `CompanyCodeAmount` | BSEG-DMBTR | customer interface field: CompanyCodeAmount (unconfirmed) | information only | yes |
| `ClearingDate` | BSEG-AUGDT | customer interface field: ClearingDate (unconfirmed) | information only | yes |
| `ClearingDocument` | BSEG-AUGBL | customer interface field: ClearingDocument (unconfirmed) | information only | yes |

## Reconciliation

- Counts: `ZFIX_C_AccountingHeadMigCount` (ECC) vs `-` (S/4HANA) per `CompanyCode`

```bash
python3 tools/mig_reconcile.py counts --product fi_mig_ecc --module gl_line_item --source ecc_counts.csv --target s4_counts.csv
```

## Open gaps

- Customers and suppliers require Business Partner/CVI mapping, roles and numbering. FI BSEG may be a cluster table in ECC and therefore cannot be assumed readable by CDS; use the full-row ABAP helper or a verified extraction interface when necessary. Open-at-cutover means posted by cutover and not cleared by cutover, including subsequently cleared items. Separate currencies, debit/credit signs, ledgers and fiscal periods; prevent double-counting subledger openings in G/L balances.
