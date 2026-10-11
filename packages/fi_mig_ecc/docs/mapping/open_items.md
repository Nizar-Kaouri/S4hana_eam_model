# Migration interface: open_items

> Version **1.0.0**

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

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `CompanyCode` | BSIS-BUKRS | customer interface field: CompanyCode (unconfirmed) | copy |
| `GLAccount` | BSIS-HKONT | customer interface field: GLAccount (unconfirmed) | copy |
| `ClearingDate` | BSIS-AUGDT | customer interface field: ClearingDate (unconfirmed) | copy |
| `ClearingDocument` | BSIS-AUGBL | customer interface field: ClearingDocument (unconfirmed) | copy |
| `AssignmentReference` | BSIS-ZUONR | customer interface field: AssignmentReference (unconfirmed) | copy |
| `FiscalYear` | BSIS-GJAHR | customer interface field: FiscalYear (unconfirmed) | copy |
| `AccountingDocument` | BSIS-BELNR | customer interface field: AccountingDocument (unconfirmed) | copy |
| `AccountingDocumentItem` | BSIS-BUZEI | customer interface field: AccountingDocumentItem (unconfirmed) | copy |
| `PostingDate` | BSIS-BUDAT | customer interface field: PostingDate (unconfirmed) | copy |
| `DebitCreditCode` | BSIS-SHKZG | customer interface field: DebitCreditCode (unconfirmed) | copy |
| `DocumentAmount` | BSIS-WRBTR | customer interface field: DocumentAmount (unconfirmed) | copy |
| `CompanyCodeAmount` | BSIS-DMBTR | customer interface field: CompanyCodeAmount (unconfirmed) | copy |
| `DocumentCurrency` | BSIS-WAERS | customer interface field: DocumentCurrency (unconfirmed) | copy |
| `ItemText` | BSIS-SGTXT | - | copy |
| `TaxCode` | BSIS-MWSKZ | - | copy |

## `ZFIX_C_GLClearedMig`

- Source: `ZFIX_I_GLCleared`
- Keys: `CompanyCode`, `GLAccount`, `ClearingDate`, `ClearingDocument`, `AssignmentReference`, `FiscalYear`, `AccountingDocument`, `AccountingDocumentItem`
- Scope: `all rows`
- Delivery mode: **open-item**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Customers and suppliers require Business Partner/CVI mapping, roles and numbering. FI BSEG may be a cluster table in ECC and therefore cannot be assumed readable by CDS; use the full-row ABAP helper or a verified extraction interface when necessary. Open-at-cutover means posted by cutover and not cleared by cutover, including subsequently cleared items. Separate currencies, debit/credit signs, ledgers and fiscal periods; prevent double-counting subledger openings in G/L balances.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `CompanyCode` | BSAS-BUKRS | customer interface field: CompanyCode (unconfirmed) | copy |
| `GLAccount` | BSAS-HKONT | customer interface field: GLAccount (unconfirmed) | copy |
| `ClearingDate` | BSAS-AUGDT | customer interface field: ClearingDate (unconfirmed) | copy |
| `ClearingDocument` | BSAS-AUGBL | customer interface field: ClearingDocument (unconfirmed) | copy |
| `AssignmentReference` | BSAS-ZUONR | customer interface field: AssignmentReference (unconfirmed) | copy |
| `FiscalYear` | BSAS-GJAHR | customer interface field: FiscalYear (unconfirmed) | copy |
| `AccountingDocument` | BSAS-BELNR | customer interface field: AccountingDocument (unconfirmed) | copy |
| `AccountingDocumentItem` | BSAS-BUZEI | customer interface field: AccountingDocumentItem (unconfirmed) | copy |
| `PostingDate` | BSAS-BUDAT | customer interface field: PostingDate (unconfirmed) | copy |
| `DebitCreditCode` | BSAS-SHKZG | customer interface field: DebitCreditCode (unconfirmed) | copy |
| `DocumentAmount` | BSAS-WRBTR | customer interface field: DocumentAmount (unconfirmed) | copy |
| `CompanyCodeAmount` | BSAS-DMBTR | customer interface field: CompanyCodeAmount (unconfirmed) | copy |
| `DocumentCurrency` | BSAS-WAERS | customer interface field: DocumentCurrency (unconfirmed) | copy |
| `ItemText` | BSAS-SGTXT | - | copy |
| `TaxCode` | BSAS-MWSKZ | - | copy |

## `ZFIX_C_APOpenMig`

- Source: `ZFIX_I_APOpen`
- Keys: `CompanyCode`, `Supplier`, `SpecialGLTransactionType`, `SpecialGLCode`, `ClearingDate`, `ClearingDocument`, `AssignmentReference`, `FiscalYear`, `AccountingDocument`, `AccountingDocumentItem`
- Scope: `all rows`
- Delivery mode: **open-item**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Customers and suppliers require Business Partner/CVI mapping, roles and numbering. FI BSEG may be a cluster table in ECC and therefore cannot be assumed readable by CDS; use the full-row ABAP helper or a verified extraction interface when necessary. Open-at-cutover means posted by cutover and not cleared by cutover, including subsequently cleared items. Separate currencies, debit/credit signs, ledgers and fiscal periods; prevent double-counting subledger openings in G/L balances.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `CompanyCode` | BSIK-BUKRS | customer interface field: CompanyCode (unconfirmed) | copy |
| `Supplier` | BSIK-LIFNR | customer interface field: Supplier (unconfirmed) | copy |
| `SpecialGLTransactionType` | BSIK-UMSKS | customer interface field: SpecialGLTransactionType (unconfirmed) | copy |
| `SpecialGLCode` | BSIK-UMSKZ | customer interface field: SpecialGLCode (unconfirmed) | copy |
| `ClearingDate` | BSIK-AUGDT | customer interface field: ClearingDate (unconfirmed) | copy |
| `ClearingDocument` | BSIK-AUGBL | customer interface field: ClearingDocument (unconfirmed) | copy |
| `AssignmentReference` | BSIK-ZUONR | customer interface field: AssignmentReference (unconfirmed) | copy |
| `FiscalYear` | BSIK-GJAHR | customer interface field: FiscalYear (unconfirmed) | copy |
| `AccountingDocument` | BSIK-BELNR | customer interface field: AccountingDocument (unconfirmed) | copy |
| `AccountingDocumentItem` | BSIK-BUZEI | customer interface field: AccountingDocumentItem (unconfirmed) | copy |
| `PostingDate` | BSIK-BUDAT | customer interface field: PostingDate (unconfirmed) | copy |
| `DebitCreditCode` | BSIK-SHKZG | customer interface field: DebitCreditCode (unconfirmed) | copy |
| `DocumentAmount` | BSIK-WRBTR | customer interface field: DocumentAmount (unconfirmed) | copy |
| `CompanyCodeAmount` | BSIK-DMBTR | customer interface field: CompanyCodeAmount (unconfirmed) | copy |
| `DocumentCurrency` | BSIK-WAERS | customer interface field: DocumentCurrency (unconfirmed) | copy |
| `ItemText` | BSIK-SGTXT | - | copy |
| `TaxCode` | BSIK-MWSKZ | - | copy |

## `ZFIX_C_APClearedMig`

- Source: `ZFIX_I_APCleared`
- Keys: `CompanyCode`, `Supplier`, `SpecialGLTransactionType`, `SpecialGLCode`, `ClearingDate`, `ClearingDocument`, `AssignmentReference`, `FiscalYear`, `AccountingDocument`, `AccountingDocumentItem`
- Scope: `all rows`
- Delivery mode: **open-item**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Customers and suppliers require Business Partner/CVI mapping, roles and numbering. FI BSEG may be a cluster table in ECC and therefore cannot be assumed readable by CDS; use the full-row ABAP helper or a verified extraction interface when necessary. Open-at-cutover means posted by cutover and not cleared by cutover, including subsequently cleared items. Separate currencies, debit/credit signs, ledgers and fiscal periods; prevent double-counting subledger openings in G/L balances.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `CompanyCode` | BSAK-BUKRS | customer interface field: CompanyCode (unconfirmed) | copy |
| `Supplier` | BSAK-LIFNR | customer interface field: Supplier (unconfirmed) | copy |
| `SpecialGLTransactionType` | BSAK-UMSKS | customer interface field: SpecialGLTransactionType (unconfirmed) | copy |
| `SpecialGLCode` | BSAK-UMSKZ | customer interface field: SpecialGLCode (unconfirmed) | copy |
| `ClearingDate` | BSAK-AUGDT | customer interface field: ClearingDate (unconfirmed) | copy |
| `ClearingDocument` | BSAK-AUGBL | customer interface field: ClearingDocument (unconfirmed) | copy |
| `AssignmentReference` | BSAK-ZUONR | customer interface field: AssignmentReference (unconfirmed) | copy |
| `FiscalYear` | BSAK-GJAHR | customer interface field: FiscalYear (unconfirmed) | copy |
| `AccountingDocument` | BSAK-BELNR | customer interface field: AccountingDocument (unconfirmed) | copy |
| `AccountingDocumentItem` | BSAK-BUZEI | customer interface field: AccountingDocumentItem (unconfirmed) | copy |
| `PostingDate` | BSAK-BUDAT | customer interface field: PostingDate (unconfirmed) | copy |
| `DebitCreditCode` | BSAK-SHKZG | customer interface field: DebitCreditCode (unconfirmed) | copy |
| `DocumentAmount` | BSAK-WRBTR | customer interface field: DocumentAmount (unconfirmed) | copy |
| `CompanyCodeAmount` | BSAK-DMBTR | customer interface field: CompanyCodeAmount (unconfirmed) | copy |
| `DocumentCurrency` | BSAK-WAERS | customer interface field: DocumentCurrency (unconfirmed) | copy |
| `ItemText` | BSAK-SGTXT | - | copy |
| `TaxCode` | BSAK-MWSKZ | - | copy |

## `ZFIX_C_AROpenMig`

- Source: `ZFIX_I_AROpen`
- Keys: `CompanyCode`, `Customer`, `SpecialGLTransactionType`, `SpecialGLCode`, `ClearingDate`, `ClearingDocument`, `AssignmentReference`, `FiscalYear`, `AccountingDocument`, `AccountingDocumentItem`
- Scope: `all rows`
- Delivery mode: **open-item**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Customers and suppliers require Business Partner/CVI mapping, roles and numbering. FI BSEG may be a cluster table in ECC and therefore cannot be assumed readable by CDS; use the full-row ABAP helper or a verified extraction interface when necessary. Open-at-cutover means posted by cutover and not cleared by cutover, including subsequently cleared items. Separate currencies, debit/credit signs, ledgers and fiscal periods; prevent double-counting subledger openings in G/L balances.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `CompanyCode` | BSID-BUKRS | customer interface field: CompanyCode (unconfirmed) | copy |
| `Customer` | BSID-KUNNR | customer interface field: Customer (unconfirmed) | copy |
| `SpecialGLTransactionType` | BSID-UMSKS | customer interface field: SpecialGLTransactionType (unconfirmed) | copy |
| `SpecialGLCode` | BSID-UMSKZ | customer interface field: SpecialGLCode (unconfirmed) | copy |
| `ClearingDate` | BSID-AUGDT | customer interface field: ClearingDate (unconfirmed) | copy |
| `ClearingDocument` | BSID-AUGBL | customer interface field: ClearingDocument (unconfirmed) | copy |
| `AssignmentReference` | BSID-ZUONR | customer interface field: AssignmentReference (unconfirmed) | copy |
| `FiscalYear` | BSID-GJAHR | customer interface field: FiscalYear (unconfirmed) | copy |
| `AccountingDocument` | BSID-BELNR | customer interface field: AccountingDocument (unconfirmed) | copy |
| `AccountingDocumentItem` | BSID-BUZEI | customer interface field: AccountingDocumentItem (unconfirmed) | copy |
| `PostingDate` | BSID-BUDAT | customer interface field: PostingDate (unconfirmed) | copy |
| `DebitCreditCode` | BSID-SHKZG | customer interface field: DebitCreditCode (unconfirmed) | copy |
| `DocumentAmount` | BSID-WRBTR | customer interface field: DocumentAmount (unconfirmed) | copy |
| `CompanyCodeAmount` | BSID-DMBTR | customer interface field: CompanyCodeAmount (unconfirmed) | copy |
| `DocumentCurrency` | BSID-WAERS | customer interface field: DocumentCurrency (unconfirmed) | copy |
| `ItemText` | BSID-SGTXT | - | copy |
| `TaxCode` | BSID-MWSKZ | - | copy |

## `ZFIX_C_ARClearedMig`

- Source: `ZFIX_I_ARCleared`
- Keys: `CompanyCode`, `Customer`, `SpecialGLTransactionType`, `SpecialGLCode`, `ClearingDate`, `ClearingDocument`, `AssignmentReference`, `FiscalYear`, `AccountingDocument`, `AccountingDocumentItem`
- Scope: `all rows`
- Delivery mode: **open-item**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Customers and suppliers require Business Partner/CVI mapping, roles and numbering. FI BSEG may be a cluster table in ECC and therefore cannot be assumed readable by CDS; use the full-row ABAP helper or a verified extraction interface when necessary. Open-at-cutover means posted by cutover and not cleared by cutover, including subsequently cleared items. Separate currencies, debit/credit signs, ledgers and fiscal periods; prevent double-counting subledger openings in G/L balances.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `CompanyCode` | BSAD-BUKRS | customer interface field: CompanyCode (unconfirmed) | copy |
| `Customer` | BSAD-KUNNR | customer interface field: Customer (unconfirmed) | copy |
| `SpecialGLTransactionType` | BSAD-UMSKS | customer interface field: SpecialGLTransactionType (unconfirmed) | copy |
| `SpecialGLCode` | BSAD-UMSKZ | customer interface field: SpecialGLCode (unconfirmed) | copy |
| `ClearingDate` | BSAD-AUGDT | customer interface field: ClearingDate (unconfirmed) | copy |
| `ClearingDocument` | BSAD-AUGBL | customer interface field: ClearingDocument (unconfirmed) | copy |
| `AssignmentReference` | BSAD-ZUONR | customer interface field: AssignmentReference (unconfirmed) | copy |
| `FiscalYear` | BSAD-GJAHR | customer interface field: FiscalYear (unconfirmed) | copy |
| `AccountingDocument` | BSAD-BELNR | customer interface field: AccountingDocument (unconfirmed) | copy |
| `AccountingDocumentItem` | BSAD-BUZEI | customer interface field: AccountingDocumentItem (unconfirmed) | copy |
| `PostingDate` | BSAD-BUDAT | customer interface field: PostingDate (unconfirmed) | copy |
| `DebitCreditCode` | BSAD-SHKZG | customer interface field: DebitCreditCode (unconfirmed) | copy |
| `DocumentAmount` | BSAD-WRBTR | customer interface field: DocumentAmount (unconfirmed) | copy |
| `CompanyCodeAmount` | BSAD-DMBTR | customer interface field: CompanyCodeAmount (unconfirmed) | copy |
| `DocumentCurrency` | BSAD-WAERS | customer interface field: DocumentCurrency (unconfirmed) | copy |
| `ItemText` | BSAD-SGTXT | - | copy |
| `TaxCode` | BSAD-MWSKZ | - | copy |

## Source controls

- Source count view: `ZFIX_C_GLOpenMigCount`

## Open gaps

- Customers and suppliers require Business Partner/CVI mapping, roles and numbering. FI BSEG may be a cluster table in ECC and therefore cannot be assumed readable by CDS; use the full-row ABAP helper or a verified extraction interface when necessary. Open-at-cutover means posted by cutover and not cleared by cutover, including subsequently cleared items. Separate currencies, debit/credit signs, ledgers and fiscal periods; prevent double-counting subledger openings in G/L balances.
