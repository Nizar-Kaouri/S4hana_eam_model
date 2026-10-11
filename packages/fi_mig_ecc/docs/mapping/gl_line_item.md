# Migration interface: gl_line_item

> Version **1.0.0**

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

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `CompanyCode` | BKPF-BUKRS | customer interface field: CompanyCode (unconfirmed) | information only |
| `AccountingDocument` | BKPF-BELNR | customer interface field: AccountingDocument (unconfirmed) | information only |
| `FiscalYear` | BKPF-GJAHR | customer interface field: FiscalYear (unconfirmed) | information only |
| `AccountingDocumentType` | BKPF-BLART | customer interface field: AccountingDocumentType (unconfirmed) | information only |
| `DocumentDate` | BKPF-BLDAT | customer interface field: DocumentDate (unconfirmed) | information only |
| `PostingDate` | BKPF-BUDAT | customer interface field: PostingDate (unconfirmed) | information only |
| `DocumentCurrency` | BKPF-WAERS | customer interface field: DocumentCurrency (unconfirmed) | information only |
| `ReferenceDocument` | BKPF-XBLNR | - | copy |
| `HeaderText` | BKPF-BKTXT | - | copy |

## `ZFIX_C_AccountingItemMig`

- Source: `ZFIX_I_AccountingItem`
- Keys: `CompanyCode`, `AccountingDocument`, `FiscalYear`, `AccountingDocumentItem`
- Scope: `all rows`
- Delivery mode: **reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Customers and suppliers require Business Partner/CVI mapping, roles and numbering. FI BSEG may be a cluster table in ECC and therefore cannot be assumed readable by CDS; use the full-row ABAP helper or a verified extraction interface when necessary. Open-at-cutover means posted by cutover and not cleared by cutover, including subsequently cleared items. Separate currencies, debit/credit signs, ledgers and fiscal periods; prevent double-counting subledger openings in G/L balances.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `CompanyCode` | BSEG-BUKRS | customer interface field: CompanyCode (unconfirmed) | information only |
| `AccountingDocument` | BSEG-BELNR | customer interface field: AccountingDocument (unconfirmed) | information only |
| `FiscalYear` | BSEG-GJAHR | customer interface field: FiscalYear (unconfirmed) | information only |
| `AccountingDocumentItem` | BSEG-BUZEI | customer interface field: AccountingDocumentItem (unconfirmed) | information only |
| `GLAccount` | BSEG-HKONT | customer interface field: GLAccount (unconfirmed) | information only |
| `AccountType` | BSEG-KOART | customer interface field: AccountType (unconfirmed) | information only |
| `DebitCreditCode` | BSEG-SHKZG | customer interface field: DebitCreditCode (unconfirmed) | information only |
| `DocumentAmount` | BSEG-WRBTR | customer interface field: DocumentAmount (unconfirmed) | information only |
| `CompanyCodeAmount` | BSEG-DMBTR | customer interface field: CompanyCodeAmount (unconfirmed) | information only |
| `ClearingDate` | BSEG-AUGDT | customer interface field: ClearingDate (unconfirmed) | information only |
| `ClearingDocument` | BSEG-AUGBL | customer interface field: ClearingDocument (unconfirmed) | information only |
| `ItemText` | BSEG-SGTXT | - | copy |
| `Assignment` | BSEG-ZUONR | - | copy |
| `Customer` | BSEG-KUNNR | - | copy |
| `Supplier` | BSEG-LIFNR | - | copy |
| `TaxCode` | BSEG-MWSKZ | - | copy |
| `CostCenter` | BSEG-KOSTL | - | copy |
| `ProfitCenter` | BSEG-PRCTR | - | copy |

## Source controls

- Source count view: `ZFIX_C_AccountingHeadMigCount`

## Open gaps

- Customers and suppliers require Business Partner/CVI mapping, roles and numbering. FI BSEG may be a cluster table in ECC and therefore cannot be assumed readable by CDS; use the full-row ABAP helper or a verified extraction interface when necessary. Open-at-cutover means posted by cutover and not cleared by cutover, including subsequently cleared items. Separate currencies, debit/credit signs, ledgers and fiscal periods; prevent double-counting subledger openings in G/L balances.
