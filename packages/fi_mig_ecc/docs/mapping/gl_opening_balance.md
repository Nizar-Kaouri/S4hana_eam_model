# Migration interface: gl_opening_balance

> Version **1.0.0**

- **Read by:** Customer-verified business interface; balance restrictions apply
- **Load after:** `gl_account`
- **Business key:** `Ledger`, `RecordType`, `Version`, `CompanyCode`, `FiscalYear`, `GLAccount`, `BusinessArea`, `TransactionCurrency`, `DebitCreditCode` · numbering **keep**
- **Key rule:** Preserve source identifiers in an audit ledger; map regenerated internal IDs and target numbering. Never assume internal IDs survive migration.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZFIX_C_ClassicBalanceMig`

- Source: `ZFIX_I_ClassicBalance`
- Keys: `Ledger`, `RecordType`, `Version`, `CompanyCode`, `FiscalYear`, `GLAccount`, `BusinessArea`, `TransactionCurrency`, `DebitCreditCode`
- Scope: `all rows`
- Delivery mode: **balance**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Customers and suppliers require Business Partner/CVI mapping, roles and numbering. FI BSEG may be a cluster table in ECC and therefore cannot be assumed readable by CDS; use the full-row ABAP helper or a verified extraction interface when necessary. Open-at-cutover means posted by cutover and not cleared by cutover, including subsequently cleared items. Separate currencies, debit/credit signs, ledgers and fiscal periods; prevent double-counting subledger openings in G/L balances. Choose classic OR new G/L for each ledger population; do not union both. DDIC must confirm all ledger dimensions and include any additional keys. Period 00 is carryforward, not period 01; calculate cutoff totals from the approved fiscal-year/period contract, including special periods only as intended. Enrich currency types from ledger/company configuration and classify accounts from SKB1. Exclude balances already supplied by FI-AA/AP/AR/open-item migration; reconcile migration clearing accounts to zero. No automatic totals-to-posting transformation is supplied.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `Ledger` | GLT0-RLDNR | customer interface field: Ledger (unconfirmed) | copy |
| `RecordType` | GLT0-RRCTY | customer interface field: RecordType (unconfirmed) | copy |
| `Version` | GLT0-RVERS | customer interface field: Version (unconfirmed) | copy |
| `CompanyCode` | GLT0-BUKRS | customer interface field: CompanyCode (unconfirmed) | copy |
| `FiscalYear` | GLT0-RYEAR | customer interface field: FiscalYear (unconfirmed) | copy |
| `GLAccount` | GLT0-RACCT | customer interface field: GLAccount (unconfirmed) | copy |
| `BusinessArea` | GLT0-RBUSA | customer interface field: BusinessArea (unconfirmed) | copy |
| `TransactionCurrency` | GLT0-RTCUR | customer interface field: TransactionCurrency (unconfirmed) | copy |
| `DebitCreditCode` | GLT0-DRCRK | customer interface field: DebitCreditCode (unconfirmed) | copy |
| `TransactionAmount00` | GLT0-TSL00 | customer interface field: TransactionAmount00 (unconfirmed) | copy |
| `LocalAmount00` | GLT0-HSL00 | customer interface field: LocalAmount00 (unconfirmed) | copy |
| `TransactionAmount01` | GLT0-TSL01 | customer interface field: TransactionAmount01 (unconfirmed) | copy |
| `LocalAmount01` | GLT0-HSL01 | customer interface field: LocalAmount01 (unconfirmed) | copy |
| `TransactionAmount02` | GLT0-TSL02 | customer interface field: TransactionAmount02 (unconfirmed) | copy |
| `LocalAmount02` | GLT0-HSL02 | customer interface field: LocalAmount02 (unconfirmed) | copy |
| `TransactionAmount03` | GLT0-TSL03 | customer interface field: TransactionAmount03 (unconfirmed) | copy |
| `LocalAmount03` | GLT0-HSL03 | customer interface field: LocalAmount03 (unconfirmed) | copy |
| `TransactionAmount04` | GLT0-TSL04 | customer interface field: TransactionAmount04 (unconfirmed) | copy |
| `LocalAmount04` | GLT0-HSL04 | customer interface field: LocalAmount04 (unconfirmed) | copy |
| `TransactionAmount05` | GLT0-TSL05 | customer interface field: TransactionAmount05 (unconfirmed) | copy |
| `LocalAmount05` | GLT0-HSL05 | customer interface field: LocalAmount05 (unconfirmed) | copy |
| `TransactionAmount06` | GLT0-TSL06 | customer interface field: TransactionAmount06 (unconfirmed) | copy |
| `LocalAmount06` | GLT0-HSL06 | customer interface field: LocalAmount06 (unconfirmed) | copy |
| `TransactionAmount07` | GLT0-TSL07 | customer interface field: TransactionAmount07 (unconfirmed) | copy |
| `LocalAmount07` | GLT0-HSL07 | customer interface field: LocalAmount07 (unconfirmed) | copy |
| `TransactionAmount08` | GLT0-TSL08 | customer interface field: TransactionAmount08 (unconfirmed) | copy |
| `LocalAmount08` | GLT0-HSL08 | customer interface field: LocalAmount08 (unconfirmed) | copy |
| `TransactionAmount09` | GLT0-TSL09 | customer interface field: TransactionAmount09 (unconfirmed) | copy |
| `LocalAmount09` | GLT0-HSL09 | customer interface field: LocalAmount09 (unconfirmed) | copy |
| `TransactionAmount10` | GLT0-TSL10 | customer interface field: TransactionAmount10 (unconfirmed) | copy |
| `LocalAmount10` | GLT0-HSL10 | customer interface field: LocalAmount10 (unconfirmed) | copy |
| `TransactionAmount11` | GLT0-TSL11 | customer interface field: TransactionAmount11 (unconfirmed) | copy |
| `LocalAmount11` | GLT0-HSL11 | customer interface field: LocalAmount11 (unconfirmed) | copy |
| `TransactionAmount12` | GLT0-TSL12 | customer interface field: TransactionAmount12 (unconfirmed) | copy |
| `LocalAmount12` | GLT0-HSL12 | customer interface field: LocalAmount12 (unconfirmed) | copy |
| `TransactionAmount13` | GLT0-TSL13 | customer interface field: TransactionAmount13 (unconfirmed) | copy |
| `LocalAmount13` | GLT0-HSL13 | customer interface field: LocalAmount13 (unconfirmed) | copy |
| `TransactionAmount14` | GLT0-TSL14 | customer interface field: TransactionAmount14 (unconfirmed) | copy |
| `LocalAmount14` | GLT0-HSL14 | customer interface field: LocalAmount14 (unconfirmed) | copy |
| `TransactionAmount15` | GLT0-TSL15 | customer interface field: TransactionAmount15 (unconfirmed) | copy |
| `LocalAmount15` | GLT0-HSL15 | customer interface field: LocalAmount15 (unconfirmed) | copy |
| `TransactionAmount16` | GLT0-TSL16 | customer interface field: TransactionAmount16 (unconfirmed) | copy |
| `LocalAmount16` | GLT0-HSL16 | customer interface field: LocalAmount16 (unconfirmed) | copy |

## `ZFIX_C_NewGLBalanceMig`

- Source: `ZFIX_I_NewGLBalance`
- Keys: `Ledger`, `RecordType`, `Version`, `FiscalYear`, `GLAccount`, `CompanyCode`, `CostCenter`, `ProfitCenter`, `FunctionalArea`, `BusinessArea`, `Segment`, `PartnerCostCenter`, `PartnerProfitCenter`, `PartnerFunctionalArea`, `PartnerBusinessArea`, `TradingPartner`, `PartnerSegment`, `TransactionCurrency`, `BaseUnit`, `DebitCreditCode`
- Scope: `all rows`
- Delivery mode: **balance**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Customers and suppliers require Business Partner/CVI mapping, roles and numbering. FI BSEG may be a cluster table in ECC and therefore cannot be assumed readable by CDS; use the full-row ABAP helper or a verified extraction interface when necessary. Open-at-cutover means posted by cutover and not cleared by cutover, including subsequently cleared items. Separate currencies, debit/credit signs, ledgers and fiscal periods; prevent double-counting subledger openings in G/L balances. Choose classic OR new G/L for each ledger population; do not union both. DDIC must confirm all ledger dimensions and include any additional keys. Period 00 is carryforward, not period 01; calculate cutoff totals from the approved fiscal-year/period contract, including special periods only as intended. Enrich currency types from ledger/company configuration and classify accounts from SKB1. Exclude balances already supplied by FI-AA/AP/AR/open-item migration; reconcile migration clearing accounts to zero. No automatic totals-to-posting transformation is supplied.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `Ledger` | FAGLFLEXT-RLDNR | customer interface field: Ledger (unconfirmed) | copy |
| `RecordType` | FAGLFLEXT-RRCTY | customer interface field: RecordType (unconfirmed) | copy |
| `Version` | FAGLFLEXT-RVERS | customer interface field: Version (unconfirmed) | copy |
| `FiscalYear` | FAGLFLEXT-RYEAR | customer interface field: FiscalYear (unconfirmed) | copy |
| `GLAccount` | FAGLFLEXT-RACCT | customer interface field: GLAccount (unconfirmed) | copy |
| `CompanyCode` | FAGLFLEXT-RBUKRS | customer interface field: CompanyCode (unconfirmed) | copy |
| `CostCenter` | FAGLFLEXT-RCNTR | customer interface field: CostCenter (unconfirmed) | copy |
| `ProfitCenter` | FAGLFLEXT-PRCTR | customer interface field: ProfitCenter (unconfirmed) | copy |
| `FunctionalArea` | FAGLFLEXT-RFAREA | customer interface field: FunctionalArea (unconfirmed) | copy |
| `BusinessArea` | FAGLFLEXT-RBUSA | customer interface field: BusinessArea (unconfirmed) | copy |
| `Segment` | FAGLFLEXT-SEGMENT | customer interface field: Segment (unconfirmed) | copy |
| `PartnerCostCenter` | FAGLFLEXT-SCNTR | customer interface field: PartnerCostCenter (unconfirmed) | copy |
| `PartnerProfitCenter` | FAGLFLEXT-PPRCTR | customer interface field: PartnerProfitCenter (unconfirmed) | copy |
| `PartnerFunctionalArea` | FAGLFLEXT-SFAREA | customer interface field: PartnerFunctionalArea (unconfirmed) | copy |
| `PartnerBusinessArea` | FAGLFLEXT-SBUSA | customer interface field: PartnerBusinessArea (unconfirmed) | copy |
| `TradingPartner` | FAGLFLEXT-RASSC | customer interface field: TradingPartner (unconfirmed) | copy |
| `PartnerSegment` | FAGLFLEXT-PSEGMENT | customer interface field: PartnerSegment (unconfirmed) | copy |
| `TransactionCurrency` | FAGLFLEXT-RTCUR | customer interface field: TransactionCurrency (unconfirmed) | copy |
| `BaseUnit` | FAGLFLEXT-RUNIT | customer interface field: BaseUnit (unconfirmed) | copy |
| `DebitCreditCode` | FAGLFLEXT-DRCRK | customer interface field: DebitCreditCode (unconfirmed) | copy |
| `BusinessTransaction` | FAGLFLEXT-ACTIV | customer interface field: BusinessTransaction (unconfirmed) | copy |
| `TransactionAmount00` | FAGLFLEXT-TSL00 | customer interface field: TransactionAmount00 (unconfirmed) | copy |
| `LocalAmount00` | FAGLFLEXT-HSL00 | customer interface field: LocalAmount00 (unconfirmed) | copy |
| `GroupAmount00` | FAGLFLEXT-KSL00 | customer interface field: GroupAmount00 (unconfirmed) | copy |
| `OtherAmount00` | FAGLFLEXT-OSL00 | customer interface field: OtherAmount00 (unconfirmed) | copy |
| `TransactionAmount01` | FAGLFLEXT-TSL01 | customer interface field: TransactionAmount01 (unconfirmed) | copy |
| `LocalAmount01` | FAGLFLEXT-HSL01 | customer interface field: LocalAmount01 (unconfirmed) | copy |
| `GroupAmount01` | FAGLFLEXT-KSL01 | customer interface field: GroupAmount01 (unconfirmed) | copy |
| `OtherAmount01` | FAGLFLEXT-OSL01 | customer interface field: OtherAmount01 (unconfirmed) | copy |
| `TransactionAmount02` | FAGLFLEXT-TSL02 | customer interface field: TransactionAmount02 (unconfirmed) | copy |
| `LocalAmount02` | FAGLFLEXT-HSL02 | customer interface field: LocalAmount02 (unconfirmed) | copy |
| `GroupAmount02` | FAGLFLEXT-KSL02 | customer interface field: GroupAmount02 (unconfirmed) | copy |
| `OtherAmount02` | FAGLFLEXT-OSL02 | customer interface field: OtherAmount02 (unconfirmed) | copy |
| `TransactionAmount03` | FAGLFLEXT-TSL03 | customer interface field: TransactionAmount03 (unconfirmed) | copy |
| `LocalAmount03` | FAGLFLEXT-HSL03 | customer interface field: LocalAmount03 (unconfirmed) | copy |
| `GroupAmount03` | FAGLFLEXT-KSL03 | customer interface field: GroupAmount03 (unconfirmed) | copy |
| `OtherAmount03` | FAGLFLEXT-OSL03 | customer interface field: OtherAmount03 (unconfirmed) | copy |
| `TransactionAmount04` | FAGLFLEXT-TSL04 | customer interface field: TransactionAmount04 (unconfirmed) | copy |
| `LocalAmount04` | FAGLFLEXT-HSL04 | customer interface field: LocalAmount04 (unconfirmed) | copy |
| `GroupAmount04` | FAGLFLEXT-KSL04 | customer interface field: GroupAmount04 (unconfirmed) | copy |
| `OtherAmount04` | FAGLFLEXT-OSL04 | customer interface field: OtherAmount04 (unconfirmed) | copy |
| `TransactionAmount05` | FAGLFLEXT-TSL05 | customer interface field: TransactionAmount05 (unconfirmed) | copy |
| `LocalAmount05` | FAGLFLEXT-HSL05 | customer interface field: LocalAmount05 (unconfirmed) | copy |
| `GroupAmount05` | FAGLFLEXT-KSL05 | customer interface field: GroupAmount05 (unconfirmed) | copy |
| `OtherAmount05` | FAGLFLEXT-OSL05 | customer interface field: OtherAmount05 (unconfirmed) | copy |
| `TransactionAmount06` | FAGLFLEXT-TSL06 | customer interface field: TransactionAmount06 (unconfirmed) | copy |
| `LocalAmount06` | FAGLFLEXT-HSL06 | customer interface field: LocalAmount06 (unconfirmed) | copy |
| `GroupAmount06` | FAGLFLEXT-KSL06 | customer interface field: GroupAmount06 (unconfirmed) | copy |
| `OtherAmount06` | FAGLFLEXT-OSL06 | customer interface field: OtherAmount06 (unconfirmed) | copy |
| `TransactionAmount07` | FAGLFLEXT-TSL07 | customer interface field: TransactionAmount07 (unconfirmed) | copy |
| `LocalAmount07` | FAGLFLEXT-HSL07 | customer interface field: LocalAmount07 (unconfirmed) | copy |
| `GroupAmount07` | FAGLFLEXT-KSL07 | customer interface field: GroupAmount07 (unconfirmed) | copy |
| `OtherAmount07` | FAGLFLEXT-OSL07 | customer interface field: OtherAmount07 (unconfirmed) | copy |
| `TransactionAmount08` | FAGLFLEXT-TSL08 | customer interface field: TransactionAmount08 (unconfirmed) | copy |
| `LocalAmount08` | FAGLFLEXT-HSL08 | customer interface field: LocalAmount08 (unconfirmed) | copy |
| `GroupAmount08` | FAGLFLEXT-KSL08 | customer interface field: GroupAmount08 (unconfirmed) | copy |
| `OtherAmount08` | FAGLFLEXT-OSL08 | customer interface field: OtherAmount08 (unconfirmed) | copy |
| `TransactionAmount09` | FAGLFLEXT-TSL09 | customer interface field: TransactionAmount09 (unconfirmed) | copy |
| `LocalAmount09` | FAGLFLEXT-HSL09 | customer interface field: LocalAmount09 (unconfirmed) | copy |
| `GroupAmount09` | FAGLFLEXT-KSL09 | customer interface field: GroupAmount09 (unconfirmed) | copy |
| `OtherAmount09` | FAGLFLEXT-OSL09 | customer interface field: OtherAmount09 (unconfirmed) | copy |
| `TransactionAmount10` | FAGLFLEXT-TSL10 | customer interface field: TransactionAmount10 (unconfirmed) | copy |
| `LocalAmount10` | FAGLFLEXT-HSL10 | customer interface field: LocalAmount10 (unconfirmed) | copy |
| `GroupAmount10` | FAGLFLEXT-KSL10 | customer interface field: GroupAmount10 (unconfirmed) | copy |
| `OtherAmount10` | FAGLFLEXT-OSL10 | customer interface field: OtherAmount10 (unconfirmed) | copy |
| `TransactionAmount11` | FAGLFLEXT-TSL11 | customer interface field: TransactionAmount11 (unconfirmed) | copy |
| `LocalAmount11` | FAGLFLEXT-HSL11 | customer interface field: LocalAmount11 (unconfirmed) | copy |
| `GroupAmount11` | FAGLFLEXT-KSL11 | customer interface field: GroupAmount11 (unconfirmed) | copy |
| `OtherAmount11` | FAGLFLEXT-OSL11 | customer interface field: OtherAmount11 (unconfirmed) | copy |
| `TransactionAmount12` | FAGLFLEXT-TSL12 | customer interface field: TransactionAmount12 (unconfirmed) | copy |
| `LocalAmount12` | FAGLFLEXT-HSL12 | customer interface field: LocalAmount12 (unconfirmed) | copy |
| `GroupAmount12` | FAGLFLEXT-KSL12 | customer interface field: GroupAmount12 (unconfirmed) | copy |
| `OtherAmount12` | FAGLFLEXT-OSL12 | customer interface field: OtherAmount12 (unconfirmed) | copy |
| `TransactionAmount13` | FAGLFLEXT-TSL13 | customer interface field: TransactionAmount13 (unconfirmed) | copy |
| `LocalAmount13` | FAGLFLEXT-HSL13 | customer interface field: LocalAmount13 (unconfirmed) | copy |
| `GroupAmount13` | FAGLFLEXT-KSL13 | customer interface field: GroupAmount13 (unconfirmed) | copy |
| `OtherAmount13` | FAGLFLEXT-OSL13 | customer interface field: OtherAmount13 (unconfirmed) | copy |
| `TransactionAmount14` | FAGLFLEXT-TSL14 | customer interface field: TransactionAmount14 (unconfirmed) | copy |
| `LocalAmount14` | FAGLFLEXT-HSL14 | customer interface field: LocalAmount14 (unconfirmed) | copy |
| `GroupAmount14` | FAGLFLEXT-KSL14 | customer interface field: GroupAmount14 (unconfirmed) | copy |
| `OtherAmount14` | FAGLFLEXT-OSL14 | customer interface field: OtherAmount14 (unconfirmed) | copy |
| `TransactionAmount15` | FAGLFLEXT-TSL15 | customer interface field: TransactionAmount15 (unconfirmed) | copy |
| `LocalAmount15` | FAGLFLEXT-HSL15 | customer interface field: LocalAmount15 (unconfirmed) | copy |
| `GroupAmount15` | FAGLFLEXT-KSL15 | customer interface field: GroupAmount15 (unconfirmed) | copy |
| `OtherAmount15` | FAGLFLEXT-OSL15 | customer interface field: OtherAmount15 (unconfirmed) | copy |
| `TransactionAmount16` | FAGLFLEXT-TSL16 | customer interface field: TransactionAmount16 (unconfirmed) | copy |
| `LocalAmount16` | FAGLFLEXT-HSL16 | customer interface field: LocalAmount16 (unconfirmed) | copy |
| `GroupAmount16` | FAGLFLEXT-KSL16 | customer interface field: GroupAmount16 (unconfirmed) | copy |
| `OtherAmount16` | FAGLFLEXT-OSL16 | customer interface field: OtherAmount16 (unconfirmed) | copy |

## Source controls

- Source count view: `ZFIX_C_ClassicBalanceMigCount`

## Open gaps

- Customers and suppliers require Business Partner/CVI mapping, roles and numbering. FI BSEG may be a cluster table in ECC and therefore cannot be assumed readable by CDS; use the full-row ABAP helper or a verified extraction interface when necessary. Open-at-cutover means posted by cutover and not cleared by cutover, including subsequently cleared items. Separate currencies, debit/credit signs, ledgers and fiscal periods; prevent double-counting subledger openings in G/L balances.
- Choose classic OR new G/L for each ledger population; do not union both. DDIC must confirm all ledger dimensions and include any additional keys. Period 00 is carryforward, not period 01; calculate cutoff totals from the approved fiscal-year/period contract, including special periods only as intended. Enrich currency types from ledger/company configuration and classify accounts from SKB1. Exclude balances already supplied by FI-AA/AP/AR/open-item migration; reconcile migration clearing accounts to zero. No automatic totals-to-posting transformation is supplied.
