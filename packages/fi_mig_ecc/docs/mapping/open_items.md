# Migration interface: open_items

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been run on a system.

- **Read by:** customer-selected supported posting interface; reference data is not posted
- **Load after:** `gl_account`, `supplier`, `customer`
- **Business key:** `CompanyCode`, `GLAccount`, `ClearingDate`, `ClearingDocument`, `AssignmentReference`, `FiscalYear`, `AccountingDocument`, `AccountingDocumentItem` · numbering **keep**
- **Key rule:** Preserve source identifiers in an audit ledger; map regenerated internal IDs and target numbering. Never assume internal IDs survive migration.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZFIX_C_GLOpenMig`

- Source: `ZFIX_I_GLOpen`
- Keys: `CompanyCode`, `GLAccount`, `ClearingDate`, `ClearingDocument`, `AssignmentReference`, `FiscalYear`, `AccountingDocument`, `AccountingDocumentItem`
- Scope: `all rows`
- Delivery mode: **open-item**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Customers and suppliers require Business Partner/CVI mapping, roles and numbering. FI BSEG may be a cluster table in ECC and therefore cannot be assumed readable by CDS; use the full-row ABAP helper or a verified extraction interface when necessary. Open-at-cutover means posted by cutover and not cleared by cutover, including subsequently cleared items. Separate currencies, debit/credit signs, ledgers and fiscal periods; prevent double-counting subledger openings in G/L balances.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `CompanyCode` | BSIS-BUKRS | customer interface field: CompanyCode (unconfirmed) | copy | yes |
| `GLAccount` | BSIS-HKONT | customer interface field: GLAccount (unconfirmed) | copy | yes |
| `ClearingDate` | BSIS-AUGDT | customer interface field: ClearingDate (unconfirmed) | copy | yes |
| `ClearingDocument` | BSIS-AUGBL | customer interface field: ClearingDocument (unconfirmed) | copy | yes |
| `AssignmentReference` | BSIS-ZUONR | customer interface field: AssignmentReference (unconfirmed) | copy | yes |
| `FiscalYear` | BSIS-GJAHR | customer interface field: FiscalYear (unconfirmed) | copy | yes |
| `AccountingDocument` | BSIS-BELNR | customer interface field: AccountingDocument (unconfirmed) | copy | yes |
| `AccountingDocumentItem` | BSIS-BUZEI | customer interface field: AccountingDocumentItem (unconfirmed) | copy | yes |
| `PostingDate` | BSIS-BUDAT | customer interface field: PostingDate (unconfirmed) | copy | yes |
| `DebitCreditCode` | BSIS-SHKZG | customer interface field: DebitCreditCode (unconfirmed) | copy | yes |
| `DocumentAmount` | BSIS-WRBTR | customer interface field: DocumentAmount (unconfirmed) | copy | yes |
| `CompanyCodeAmount` | BSIS-DMBTR | customer interface field: CompanyCodeAmount (unconfirmed) | copy | yes |
| `DocumentCurrency` | BSIS-WAERS | customer interface field: DocumentCurrency (unconfirmed) | copy | yes |

## `ZFIX_C_GLClearedMig`

- Source: `ZFIX_I_GLCleared`
- Keys: `CompanyCode`, `GLAccount`, `ClearingDate`, `ClearingDocument`, `AssignmentReference`, `FiscalYear`, `AccountingDocument`, `AccountingDocumentItem`
- Scope: `all rows`
- Delivery mode: **open-item**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Customers and suppliers require Business Partner/CVI mapping, roles and numbering. FI BSEG may be a cluster table in ECC and therefore cannot be assumed readable by CDS; use the full-row ABAP helper or a verified extraction interface when necessary. Open-at-cutover means posted by cutover and not cleared by cutover, including subsequently cleared items. Separate currencies, debit/credit signs, ledgers and fiscal periods; prevent double-counting subledger openings in G/L balances.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `CompanyCode` | BSAS-BUKRS | customer interface field: CompanyCode (unconfirmed) | copy | yes |
| `GLAccount` | BSAS-HKONT | customer interface field: GLAccount (unconfirmed) | copy | yes |
| `ClearingDate` | BSAS-AUGDT | customer interface field: ClearingDate (unconfirmed) | copy | yes |
| `ClearingDocument` | BSAS-AUGBL | customer interface field: ClearingDocument (unconfirmed) | copy | yes |
| `AssignmentReference` | BSAS-ZUONR | customer interface field: AssignmentReference (unconfirmed) | copy | yes |
| `FiscalYear` | BSAS-GJAHR | customer interface field: FiscalYear (unconfirmed) | copy | yes |
| `AccountingDocument` | BSAS-BELNR | customer interface field: AccountingDocument (unconfirmed) | copy | yes |
| `AccountingDocumentItem` | BSAS-BUZEI | customer interface field: AccountingDocumentItem (unconfirmed) | copy | yes |
| `PostingDate` | BSAS-BUDAT | customer interface field: PostingDate (unconfirmed) | copy | yes |
| `DebitCreditCode` | BSAS-SHKZG | customer interface field: DebitCreditCode (unconfirmed) | copy | yes |
| `DocumentAmount` | BSAS-WRBTR | customer interface field: DocumentAmount (unconfirmed) | copy | yes |
| `CompanyCodeAmount` | BSAS-DMBTR | customer interface field: CompanyCodeAmount (unconfirmed) | copy | yes |
| `DocumentCurrency` | BSAS-WAERS | customer interface field: DocumentCurrency (unconfirmed) | copy | yes |

## `ZFIX_C_APOpenMig`

- Source: `ZFIX_I_APOpen`
- Keys: `CompanyCode`, `Supplier`, `SpecialGLTransactionType`, `SpecialGLCode`, `ClearingDate`, `ClearingDocument`, `AssignmentReference`, `FiscalYear`, `AccountingDocument`, `AccountingDocumentItem`
- Scope: `all rows`
- Delivery mode: **open-item**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Customers and suppliers require Business Partner/CVI mapping, roles and numbering. FI BSEG may be a cluster table in ECC and therefore cannot be assumed readable by CDS; use the full-row ABAP helper or a verified extraction interface when necessary. Open-at-cutover means posted by cutover and not cleared by cutover, including subsequently cleared items. Separate currencies, debit/credit signs, ledgers and fiscal periods; prevent double-counting subledger openings in G/L balances.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `CompanyCode` | BSIK-BUKRS | customer interface field: CompanyCode (unconfirmed) | copy | yes |
| `Supplier` | BSIK-LIFNR | customer interface field: Supplier (unconfirmed) | copy | yes |
| `SpecialGLTransactionType` | BSIK-UMSKS | customer interface field: SpecialGLTransactionType (unconfirmed) | copy | yes |
| `SpecialGLCode` | BSIK-UMSKZ | customer interface field: SpecialGLCode (unconfirmed) | copy | yes |
| `ClearingDate` | BSIK-AUGDT | customer interface field: ClearingDate (unconfirmed) | copy | yes |
| `ClearingDocument` | BSIK-AUGBL | customer interface field: ClearingDocument (unconfirmed) | copy | yes |
| `AssignmentReference` | BSIK-ZUONR | customer interface field: AssignmentReference (unconfirmed) | copy | yes |
| `FiscalYear` | BSIK-GJAHR | customer interface field: FiscalYear (unconfirmed) | copy | yes |
| `AccountingDocument` | BSIK-BELNR | customer interface field: AccountingDocument (unconfirmed) | copy | yes |
| `AccountingDocumentItem` | BSIK-BUZEI | customer interface field: AccountingDocumentItem (unconfirmed) | copy | yes |
| `PostingDate` | BSIK-BUDAT | customer interface field: PostingDate (unconfirmed) | copy | yes |
| `DebitCreditCode` | BSIK-SHKZG | customer interface field: DebitCreditCode (unconfirmed) | copy | yes |
| `DocumentAmount` | BSIK-WRBTR | customer interface field: DocumentAmount (unconfirmed) | copy | yes |
| `CompanyCodeAmount` | BSIK-DMBTR | customer interface field: CompanyCodeAmount (unconfirmed) | copy | yes |
| `DocumentCurrency` | BSIK-WAERS | customer interface field: DocumentCurrency (unconfirmed) | copy | yes |

## `ZFIX_C_APClearedMig`

- Source: `ZFIX_I_APCleared`
- Keys: `CompanyCode`, `Supplier`, `SpecialGLTransactionType`, `SpecialGLCode`, `ClearingDate`, `ClearingDocument`, `AssignmentReference`, `FiscalYear`, `AccountingDocument`, `AccountingDocumentItem`
- Scope: `all rows`
- Delivery mode: **open-item**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Customers and suppliers require Business Partner/CVI mapping, roles and numbering. FI BSEG may be a cluster table in ECC and therefore cannot be assumed readable by CDS; use the full-row ABAP helper or a verified extraction interface when necessary. Open-at-cutover means posted by cutover and not cleared by cutover, including subsequently cleared items. Separate currencies, debit/credit signs, ledgers and fiscal periods; prevent double-counting subledger openings in G/L balances.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `CompanyCode` | BSAK-BUKRS | customer interface field: CompanyCode (unconfirmed) | copy | yes |
| `Supplier` | BSAK-LIFNR | customer interface field: Supplier (unconfirmed) | copy | yes |
| `SpecialGLTransactionType` | BSAK-UMSKS | customer interface field: SpecialGLTransactionType (unconfirmed) | copy | yes |
| `SpecialGLCode` | BSAK-UMSKZ | customer interface field: SpecialGLCode (unconfirmed) | copy | yes |
| `ClearingDate` | BSAK-AUGDT | customer interface field: ClearingDate (unconfirmed) | copy | yes |
| `ClearingDocument` | BSAK-AUGBL | customer interface field: ClearingDocument (unconfirmed) | copy | yes |
| `AssignmentReference` | BSAK-ZUONR | customer interface field: AssignmentReference (unconfirmed) | copy | yes |
| `FiscalYear` | BSAK-GJAHR | customer interface field: FiscalYear (unconfirmed) | copy | yes |
| `AccountingDocument` | BSAK-BELNR | customer interface field: AccountingDocument (unconfirmed) | copy | yes |
| `AccountingDocumentItem` | BSAK-BUZEI | customer interface field: AccountingDocumentItem (unconfirmed) | copy | yes |
| `PostingDate` | BSAK-BUDAT | customer interface field: PostingDate (unconfirmed) | copy | yes |
| `DebitCreditCode` | BSAK-SHKZG | customer interface field: DebitCreditCode (unconfirmed) | copy | yes |
| `DocumentAmount` | BSAK-WRBTR | customer interface field: DocumentAmount (unconfirmed) | copy | yes |
| `CompanyCodeAmount` | BSAK-DMBTR | customer interface field: CompanyCodeAmount (unconfirmed) | copy | yes |
| `DocumentCurrency` | BSAK-WAERS | customer interface field: DocumentCurrency (unconfirmed) | copy | yes |

## `ZFIX_C_AROpenMig`

- Source: `ZFIX_I_AROpen`
- Keys: `CompanyCode`, `Customer`, `SpecialGLTransactionType`, `SpecialGLCode`, `ClearingDate`, `ClearingDocument`, `AssignmentReference`, `FiscalYear`, `AccountingDocument`, `AccountingDocumentItem`
- Scope: `all rows`
- Delivery mode: **open-item**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Customers and suppliers require Business Partner/CVI mapping, roles and numbering. FI BSEG may be a cluster table in ECC and therefore cannot be assumed readable by CDS; use the full-row ABAP helper or a verified extraction interface when necessary. Open-at-cutover means posted by cutover and not cleared by cutover, including subsequently cleared items. Separate currencies, debit/credit signs, ledgers and fiscal periods; prevent double-counting subledger openings in G/L balances.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `CompanyCode` | BSID-BUKRS | customer interface field: CompanyCode (unconfirmed) | copy | yes |
| `Customer` | BSID-KUNNR | customer interface field: Customer (unconfirmed) | copy | yes |
| `SpecialGLTransactionType` | BSID-UMSKS | customer interface field: SpecialGLTransactionType (unconfirmed) | copy | yes |
| `SpecialGLCode` | BSID-UMSKZ | customer interface field: SpecialGLCode (unconfirmed) | copy | yes |
| `ClearingDate` | BSID-AUGDT | customer interface field: ClearingDate (unconfirmed) | copy | yes |
| `ClearingDocument` | BSID-AUGBL | customer interface field: ClearingDocument (unconfirmed) | copy | yes |
| `AssignmentReference` | BSID-ZUONR | customer interface field: AssignmentReference (unconfirmed) | copy | yes |
| `FiscalYear` | BSID-GJAHR | customer interface field: FiscalYear (unconfirmed) | copy | yes |
| `AccountingDocument` | BSID-BELNR | customer interface field: AccountingDocument (unconfirmed) | copy | yes |
| `AccountingDocumentItem` | BSID-BUZEI | customer interface field: AccountingDocumentItem (unconfirmed) | copy | yes |
| `PostingDate` | BSID-BUDAT | customer interface field: PostingDate (unconfirmed) | copy | yes |
| `DebitCreditCode` | BSID-SHKZG | customer interface field: DebitCreditCode (unconfirmed) | copy | yes |
| `DocumentAmount` | BSID-WRBTR | customer interface field: DocumentAmount (unconfirmed) | copy | yes |
| `CompanyCodeAmount` | BSID-DMBTR | customer interface field: CompanyCodeAmount (unconfirmed) | copy | yes |
| `DocumentCurrency` | BSID-WAERS | customer interface field: DocumentCurrency (unconfirmed) | copy | yes |

## `ZFIX_C_ARClearedMig`

- Source: `ZFIX_I_ARCleared`
- Keys: `CompanyCode`, `Customer`, `SpecialGLTransactionType`, `SpecialGLCode`, `ClearingDate`, `ClearingDocument`, `AssignmentReference`, `FiscalYear`, `AccountingDocument`, `AccountingDocumentItem`
- Scope: `all rows`
- Delivery mode: **open-item**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Customers and suppliers require Business Partner/CVI mapping, roles and numbering. FI BSEG may be a cluster table in ECC and therefore cannot be assumed readable by CDS; use the full-row ABAP helper or a verified extraction interface when necessary. Open-at-cutover means posted by cutover and not cleared by cutover, including subsequently cleared items. Separate currencies, debit/credit signs, ledgers and fiscal periods; prevent double-counting subledger openings in G/L balances.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `CompanyCode` | BSAD-BUKRS | customer interface field: CompanyCode (unconfirmed) | copy | yes |
| `Customer` | BSAD-KUNNR | customer interface field: Customer (unconfirmed) | copy | yes |
| `SpecialGLTransactionType` | BSAD-UMSKS | customer interface field: SpecialGLTransactionType (unconfirmed) | copy | yes |
| `SpecialGLCode` | BSAD-UMSKZ | customer interface field: SpecialGLCode (unconfirmed) | copy | yes |
| `ClearingDate` | BSAD-AUGDT | customer interface field: ClearingDate (unconfirmed) | copy | yes |
| `ClearingDocument` | BSAD-AUGBL | customer interface field: ClearingDocument (unconfirmed) | copy | yes |
| `AssignmentReference` | BSAD-ZUONR | customer interface field: AssignmentReference (unconfirmed) | copy | yes |
| `FiscalYear` | BSAD-GJAHR | customer interface field: FiscalYear (unconfirmed) | copy | yes |
| `AccountingDocument` | BSAD-BELNR | customer interface field: AccountingDocument (unconfirmed) | copy | yes |
| `AccountingDocumentItem` | BSAD-BUZEI | customer interface field: AccountingDocumentItem (unconfirmed) | copy | yes |
| `PostingDate` | BSAD-BUDAT | customer interface field: PostingDate (unconfirmed) | copy | yes |
| `DebitCreditCode` | BSAD-SHKZG | customer interface field: DebitCreditCode (unconfirmed) | copy | yes |
| `DocumentAmount` | BSAD-WRBTR | customer interface field: DocumentAmount (unconfirmed) | copy | yes |
| `CompanyCodeAmount` | BSAD-DMBTR | customer interface field: CompanyCodeAmount (unconfirmed) | copy | yes |
| `DocumentCurrency` | BSAD-WAERS | customer interface field: DocumentCurrency (unconfirmed) | copy | yes |

## Reconciliation

- Counts: `ZFIX_C_GLOpenMigCount` (ECC) vs `-` (S/4HANA) per `CompanyCode`

```bash
python3 tools/mig_reconcile.py counts --product fi_mig_ecc --module open_items --source ecc_counts.csv --target s4_counts.csv
```

## Open gaps

- Customers and suppliers require Business Partner/CVI mapping, roles and numbering. FI BSEG may be a cluster table in ECC and therefore cannot be assumed readable by CDS; use the full-row ABAP helper or a verified extraction interface when necessary. Open-at-cutover means posted by cutover and not cleared by cutover, including subsequently cleared items. Separate currencies, debit/credit signs, ledgers and fiscal periods; prevent double-counting subledger openings in G/L balances.
