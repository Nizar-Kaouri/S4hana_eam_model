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

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `ChartOfAccounts` | SKA1-KTOPL | customer interface field: ChartOfAccounts (unconfirmed) | copy |
| `GLAccount` | SKA1-SAKNR | customer interface field: GLAccount (unconfirmed) | copy |
| `AccountGroup` | SKA1-KTOKS | customer interface field: AccountGroup (unconfirmed) | copy |
| `BalanceSheetAccount` | SKA1-XBILK | customer interface field: BalanceSheetAccount (unconfirmed) | copy |
| `DeletionFlag` | SKA1-XLOEV | customer interface field: DeletionFlag (unconfirmed) | copy |

## `ZFIX_C_GLAccountTextMig`

- Source: `ZFIX_I_GLAccountText`
- Keys: `Language`, `ChartOfAccounts`, `GLAccount`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Customers and suppliers require Business Partner/CVI mapping, roles and numbering. FI BSEG may be a cluster table in ECC and therefore cannot be assumed readable by CDS; use the full-row ABAP helper or a verified extraction interface when necessary. Open-at-cutover means posted by cutover and not cleared by cutover, including subsequently cleared items. Separate currencies, debit/credit signs, ledgers and fiscal periods; prevent double-counting subledger openings in G/L balances.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `Language` | SKAT-SPRAS | customer interface field: Language (unconfirmed) | copy |
| `ChartOfAccounts` | SKAT-KTOPL | customer interface field: ChartOfAccounts (unconfirmed) | copy |
| `GLAccount` | SKAT-SAKNR | customer interface field: GLAccount (unconfirmed) | copy |
| `GLAccountName` | SKAT-TXT20 | customer interface field: GLAccountName (unconfirmed) | copy |
| `GLAccountDescription` | SKAT-TXT50 | customer interface field: GLAccountDescription (unconfirmed) | copy |

## `ZFIX_C_GLCompanyMig`

- Source: `ZFIX_I_GLCompany`
- Keys: `CompanyCode`, `GLAccount`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Customers and suppliers require Business Partner/CVI mapping, roles and numbering. FI BSEG may be a cluster table in ECC and therefore cannot be assumed readable by CDS; use the full-row ABAP helper or a verified extraction interface when necessary. Open-at-cutover means posted by cutover and not cleared by cutover, including subsequently cleared items. Separate currencies, debit/credit signs, ledgers and fiscal periods; prevent double-counting subledger openings in G/L balances.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `CompanyCode` | SKB1-BUKRS | customer interface field: CompanyCode (unconfirmed) | copy |
| `GLAccount` | SKB1-SAKNR | customer interface field: GLAccount (unconfirmed) | copy |
| `AccountCurrency` | SKB1-WAERS | customer interface field: AccountCurrency (unconfirmed) | copy |
| `OpenItemManagement` | SKB1-XOPVW | customer interface field: OpenItemManagement (unconfirmed) | copy |
| `DeletionFlag` | SKB1-XLOEB | customer interface field: DeletionFlag (unconfirmed) | copy |

## `ZFIX_C_GLAccountLongTextMig`

- Source: `ZFIX_I_GLAccountLongText`
- Keys: `TextObject`, `TextName`, `TextID`, `Language`
- Scope: `all rows`
- Delivery mode: **reference**
- Before posting: SAPscript index only. Populate the explicit full text-key to business-owner link file from the source text editor/application metadata, run the text_scope preparation step against selected masters, then READ_TEXT to retrieve ordered formatted lines. Never infer the business owner from a TDNAME substring or post compressed STXL data.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `TextObject` | STXH-TDOBJECT | - | copy |
| `TextName` | STXH-TDNAME | - | copy |
| `TextID` | STXH-TDID | - | copy |
| `Language` | STXH-TDSPRAS | - | copy |

## Source controls

- Source count view: `ZFIX_C_GLAccountMigCount`

## Open gaps

- Customers and suppliers require Business Partner/CVI mapping, roles and numbering. FI BSEG may be a cluster table in ECC and therefore cannot be assumed readable by CDS; use the full-row ABAP helper or a verified extraction interface when necessary. Open-at-cutover means posted by cutover and not cleared by cutover, including subsequently cleared items. Separate currencies, debit/credit signs, ledgers and fiscal periods; prevent double-counting subledger openings in G/L balances.
