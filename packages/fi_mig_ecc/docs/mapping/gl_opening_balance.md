# Migration interface: gl_opening_balance

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been run on a system.

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

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Ledger` | GLT0-RLDNR | customer interface field: Ledger (unconfirmed) | copy | yes |
| `RecordType` | GLT0-RRCTY | customer interface field: RecordType (unconfirmed) | copy | yes |
| `Version` | GLT0-RVERS | customer interface field: Version (unconfirmed) | copy | yes |
| `CompanyCode` | GLT0-BUKRS | customer interface field: CompanyCode (unconfirmed) | copy | yes |
| `FiscalYear` | GLT0-RYEAR | customer interface field: FiscalYear (unconfirmed) | copy | yes |
| `GLAccount` | GLT0-RACCT | customer interface field: GLAccount (unconfirmed) | copy | yes |
| `BusinessArea` | GLT0-RBUSA | customer interface field: BusinessArea (unconfirmed) | copy | yes |
| `TransactionCurrency` | GLT0-RTCUR | customer interface field: TransactionCurrency (unconfirmed) | copy | yes |
| `DebitCreditCode` | GLT0-DRCRK | customer interface field: DebitCreditCode (unconfirmed) | copy | yes |
| `TransactionAmount00` | GLT0-TSL00 | customer interface field: TransactionAmount00 (unconfirmed) | copy | yes |
| `LocalAmount00` | GLT0-HSL00 | customer interface field: LocalAmount00 (unconfirmed) | copy | yes |
| `TransactionAmount01` | GLT0-TSL01 | customer interface field: TransactionAmount01 (unconfirmed) | copy | yes |
| `LocalAmount01` | GLT0-HSL01 | customer interface field: LocalAmount01 (unconfirmed) | copy | yes |
| `TransactionAmount02` | GLT0-TSL02 | customer interface field: TransactionAmount02 (unconfirmed) | copy | yes |
| `LocalAmount02` | GLT0-HSL02 | customer interface field: LocalAmount02 (unconfirmed) | copy | yes |
| `TransactionAmount03` | GLT0-TSL03 | customer interface field: TransactionAmount03 (unconfirmed) | copy | yes |
| `LocalAmount03` | GLT0-HSL03 | customer interface field: LocalAmount03 (unconfirmed) | copy | yes |
| `TransactionAmount04` | GLT0-TSL04 | customer interface field: TransactionAmount04 (unconfirmed) | copy | yes |
| `LocalAmount04` | GLT0-HSL04 | customer interface field: LocalAmount04 (unconfirmed) | copy | yes |
| `TransactionAmount05` | GLT0-TSL05 | customer interface field: TransactionAmount05 (unconfirmed) | copy | yes |
| `LocalAmount05` | GLT0-HSL05 | customer interface field: LocalAmount05 (unconfirmed) | copy | yes |
| `TransactionAmount06` | GLT0-TSL06 | customer interface field: TransactionAmount06 (unconfirmed) | copy | yes |
| `LocalAmount06` | GLT0-HSL06 | customer interface field: LocalAmount06 (unconfirmed) | copy | yes |
| `TransactionAmount07` | GLT0-TSL07 | customer interface field: TransactionAmount07 (unconfirmed) | copy | yes |
| `LocalAmount07` | GLT0-HSL07 | customer interface field: LocalAmount07 (unconfirmed) | copy | yes |
| `TransactionAmount08` | GLT0-TSL08 | customer interface field: TransactionAmount08 (unconfirmed) | copy | yes |
| `LocalAmount08` | GLT0-HSL08 | customer interface field: LocalAmount08 (unconfirmed) | copy | yes |
| `TransactionAmount09` | GLT0-TSL09 | customer interface field: TransactionAmount09 (unconfirmed) | copy | yes |
| `LocalAmount09` | GLT0-HSL09 | customer interface field: LocalAmount09 (unconfirmed) | copy | yes |
| `TransactionAmount10` | GLT0-TSL10 | customer interface field: TransactionAmount10 (unconfirmed) | copy | yes |
| `LocalAmount10` | GLT0-HSL10 | customer interface field: LocalAmount10 (unconfirmed) | copy | yes |
| `TransactionAmount11` | GLT0-TSL11 | customer interface field: TransactionAmount11 (unconfirmed) | copy | yes |
| `LocalAmount11` | GLT0-HSL11 | customer interface field: LocalAmount11 (unconfirmed) | copy | yes |
| `TransactionAmount12` | GLT0-TSL12 | customer interface field: TransactionAmount12 (unconfirmed) | copy | yes |
| `LocalAmount12` | GLT0-HSL12 | customer interface field: LocalAmount12 (unconfirmed) | copy | yes |
| `TransactionAmount13` | GLT0-TSL13 | customer interface field: TransactionAmount13 (unconfirmed) | copy | yes |
| `LocalAmount13` | GLT0-HSL13 | customer interface field: LocalAmount13 (unconfirmed) | copy | yes |
| `TransactionAmount14` | GLT0-TSL14 | customer interface field: TransactionAmount14 (unconfirmed) | copy | yes |
| `LocalAmount14` | GLT0-HSL14 | customer interface field: LocalAmount14 (unconfirmed) | copy | yes |
| `TransactionAmount15` | GLT0-TSL15 | customer interface field: TransactionAmount15 (unconfirmed) | copy | yes |
| `LocalAmount15` | GLT0-HSL15 | customer interface field: LocalAmount15 (unconfirmed) | copy | yes |
| `TransactionAmount16` | GLT0-TSL16 | customer interface field: TransactionAmount16 (unconfirmed) | copy | yes |
| `LocalAmount16` | GLT0-HSL16 | customer interface field: LocalAmount16 (unconfirmed) | copy | yes |

## `ZFIX_C_NewGLBalanceMig`

- Source: `ZFIX_I_NewGLBalance`
- Keys: `Ledger`, `RecordType`, `Version`, `FiscalYear`, `GLAccount`, `CompanyCode`, `CostCenter`, `ProfitCenter`, `FunctionalArea`, `BusinessArea`, `Segment`, `PartnerCostCenter`, `PartnerProfitCenter`, `PartnerFunctionalArea`, `PartnerBusinessArea`, `TradingPartner`, `PartnerSegment`, `TransactionCurrency`, `BaseUnit`, `DebitCreditCode`
- Scope: `all rows`
- Delivery mode: **balance**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Customers and suppliers require Business Partner/CVI mapping, roles and numbering. FI BSEG may be a cluster table in ECC and therefore cannot be assumed readable by CDS; use the full-row ABAP helper or a verified extraction interface when necessary. Open-at-cutover means posted by cutover and not cleared by cutover, including subsequently cleared items. Separate currencies, debit/credit signs, ledgers and fiscal periods; prevent double-counting subledger openings in G/L balances. Choose classic OR new G/L for each ledger population; do not union both. DDIC must confirm all ledger dimensions and include any additional keys. Period 00 is carryforward, not period 01; calculate cutoff totals from the approved fiscal-year/period contract, including special periods only as intended. Enrich currency types from ledger/company configuration and classify accounts from SKB1. Exclude balances already supplied by FI-AA/AP/AR/open-item migration; reconcile migration clearing accounts to zero. No automatic totals-to-posting transformation is supplied.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Ledger` | FAGLFLEXT-RLDNR | customer interface field: Ledger (unconfirmed) | copy | yes |
| `RecordType` | FAGLFLEXT-RRCTY | customer interface field: RecordType (unconfirmed) | copy | yes |
| `Version` | FAGLFLEXT-RVERS | customer interface field: Version (unconfirmed) | copy | yes |
| `FiscalYear` | FAGLFLEXT-RYEAR | customer interface field: FiscalYear (unconfirmed) | copy | yes |
| `GLAccount` | FAGLFLEXT-RACCT | customer interface field: GLAccount (unconfirmed) | copy | yes |
| `CompanyCode` | FAGLFLEXT-RBUKRS | customer interface field: CompanyCode (unconfirmed) | copy | yes |
| `CostCenter` | FAGLFLEXT-RCNTR | customer interface field: CostCenter (unconfirmed) | copy | yes |
| `ProfitCenter` | FAGLFLEXT-PRCTR | customer interface field: ProfitCenter (unconfirmed) | copy | yes |
| `FunctionalArea` | FAGLFLEXT-RFAREA | customer interface field: FunctionalArea (unconfirmed) | copy | yes |
| `BusinessArea` | FAGLFLEXT-RBUSA | customer interface field: BusinessArea (unconfirmed) | copy | yes |
| `Segment` | FAGLFLEXT-SEGMENT | customer interface field: Segment (unconfirmed) | copy | yes |
| `PartnerCostCenter` | FAGLFLEXT-SCNTR | customer interface field: PartnerCostCenter (unconfirmed) | copy | yes |
| `PartnerProfitCenter` | FAGLFLEXT-PPRCTR | customer interface field: PartnerProfitCenter (unconfirmed) | copy | yes |
| `PartnerFunctionalArea` | FAGLFLEXT-SFAREA | customer interface field: PartnerFunctionalArea (unconfirmed) | copy | yes |
| `PartnerBusinessArea` | FAGLFLEXT-SBUSA | customer interface field: PartnerBusinessArea (unconfirmed) | copy | yes |
| `TradingPartner` | FAGLFLEXT-RASSC | customer interface field: TradingPartner (unconfirmed) | copy | yes |
| `PartnerSegment` | FAGLFLEXT-PSEGMENT | customer interface field: PartnerSegment (unconfirmed) | copy | yes |
| `TransactionCurrency` | FAGLFLEXT-RTCUR | customer interface field: TransactionCurrency (unconfirmed) | copy | yes |
| `BaseUnit` | FAGLFLEXT-RUNIT | customer interface field: BaseUnit (unconfirmed) | copy | yes |
| `DebitCreditCode` | FAGLFLEXT-DRCRK | customer interface field: DebitCreditCode (unconfirmed) | copy | yes |
| `BusinessTransaction` | FAGLFLEXT-ACTIV | customer interface field: BusinessTransaction (unconfirmed) | copy | yes |
| `TransactionAmount00` | FAGLFLEXT-TSL00 | customer interface field: TransactionAmount00 (unconfirmed) | copy | yes |
| `LocalAmount00` | FAGLFLEXT-HSL00 | customer interface field: LocalAmount00 (unconfirmed) | copy | yes |
| `GroupAmount00` | FAGLFLEXT-KSL00 | customer interface field: GroupAmount00 (unconfirmed) | copy | yes |
| `OtherAmount00` | FAGLFLEXT-OSL00 | customer interface field: OtherAmount00 (unconfirmed) | copy | yes |
| `TransactionAmount01` | FAGLFLEXT-TSL01 | customer interface field: TransactionAmount01 (unconfirmed) | copy | yes |
| `LocalAmount01` | FAGLFLEXT-HSL01 | customer interface field: LocalAmount01 (unconfirmed) | copy | yes |
| `GroupAmount01` | FAGLFLEXT-KSL01 | customer interface field: GroupAmount01 (unconfirmed) | copy | yes |
| `OtherAmount01` | FAGLFLEXT-OSL01 | customer interface field: OtherAmount01 (unconfirmed) | copy | yes |
| `TransactionAmount02` | FAGLFLEXT-TSL02 | customer interface field: TransactionAmount02 (unconfirmed) | copy | yes |
| `LocalAmount02` | FAGLFLEXT-HSL02 | customer interface field: LocalAmount02 (unconfirmed) | copy | yes |
| `GroupAmount02` | FAGLFLEXT-KSL02 | customer interface field: GroupAmount02 (unconfirmed) | copy | yes |
| `OtherAmount02` | FAGLFLEXT-OSL02 | customer interface field: OtherAmount02 (unconfirmed) | copy | yes |
| `TransactionAmount03` | FAGLFLEXT-TSL03 | customer interface field: TransactionAmount03 (unconfirmed) | copy | yes |
| `LocalAmount03` | FAGLFLEXT-HSL03 | customer interface field: LocalAmount03 (unconfirmed) | copy | yes |
| `GroupAmount03` | FAGLFLEXT-KSL03 | customer interface field: GroupAmount03 (unconfirmed) | copy | yes |
| `OtherAmount03` | FAGLFLEXT-OSL03 | customer interface field: OtherAmount03 (unconfirmed) | copy | yes |
| `TransactionAmount04` | FAGLFLEXT-TSL04 | customer interface field: TransactionAmount04 (unconfirmed) | copy | yes |
| `LocalAmount04` | FAGLFLEXT-HSL04 | customer interface field: LocalAmount04 (unconfirmed) | copy | yes |
| `GroupAmount04` | FAGLFLEXT-KSL04 | customer interface field: GroupAmount04 (unconfirmed) | copy | yes |
| `OtherAmount04` | FAGLFLEXT-OSL04 | customer interface field: OtherAmount04 (unconfirmed) | copy | yes |
| `TransactionAmount05` | FAGLFLEXT-TSL05 | customer interface field: TransactionAmount05 (unconfirmed) | copy | yes |
| `LocalAmount05` | FAGLFLEXT-HSL05 | customer interface field: LocalAmount05 (unconfirmed) | copy | yes |
| `GroupAmount05` | FAGLFLEXT-KSL05 | customer interface field: GroupAmount05 (unconfirmed) | copy | yes |
| `OtherAmount05` | FAGLFLEXT-OSL05 | customer interface field: OtherAmount05 (unconfirmed) | copy | yes |
| `TransactionAmount06` | FAGLFLEXT-TSL06 | customer interface field: TransactionAmount06 (unconfirmed) | copy | yes |
| `LocalAmount06` | FAGLFLEXT-HSL06 | customer interface field: LocalAmount06 (unconfirmed) | copy | yes |
| `GroupAmount06` | FAGLFLEXT-KSL06 | customer interface field: GroupAmount06 (unconfirmed) | copy | yes |
| `OtherAmount06` | FAGLFLEXT-OSL06 | customer interface field: OtherAmount06 (unconfirmed) | copy | yes |
| `TransactionAmount07` | FAGLFLEXT-TSL07 | customer interface field: TransactionAmount07 (unconfirmed) | copy | yes |
| `LocalAmount07` | FAGLFLEXT-HSL07 | customer interface field: LocalAmount07 (unconfirmed) | copy | yes |
| `GroupAmount07` | FAGLFLEXT-KSL07 | customer interface field: GroupAmount07 (unconfirmed) | copy | yes |
| `OtherAmount07` | FAGLFLEXT-OSL07 | customer interface field: OtherAmount07 (unconfirmed) | copy | yes |
| `TransactionAmount08` | FAGLFLEXT-TSL08 | customer interface field: TransactionAmount08 (unconfirmed) | copy | yes |
| `LocalAmount08` | FAGLFLEXT-HSL08 | customer interface field: LocalAmount08 (unconfirmed) | copy | yes |
| `GroupAmount08` | FAGLFLEXT-KSL08 | customer interface field: GroupAmount08 (unconfirmed) | copy | yes |
| `OtherAmount08` | FAGLFLEXT-OSL08 | customer interface field: OtherAmount08 (unconfirmed) | copy | yes |
| `TransactionAmount09` | FAGLFLEXT-TSL09 | customer interface field: TransactionAmount09 (unconfirmed) | copy | yes |
| `LocalAmount09` | FAGLFLEXT-HSL09 | customer interface field: LocalAmount09 (unconfirmed) | copy | yes |
| `GroupAmount09` | FAGLFLEXT-KSL09 | customer interface field: GroupAmount09 (unconfirmed) | copy | yes |
| `OtherAmount09` | FAGLFLEXT-OSL09 | customer interface field: OtherAmount09 (unconfirmed) | copy | yes |
| `TransactionAmount10` | FAGLFLEXT-TSL10 | customer interface field: TransactionAmount10 (unconfirmed) | copy | yes |
| `LocalAmount10` | FAGLFLEXT-HSL10 | customer interface field: LocalAmount10 (unconfirmed) | copy | yes |
| `GroupAmount10` | FAGLFLEXT-KSL10 | customer interface field: GroupAmount10 (unconfirmed) | copy | yes |
| `OtherAmount10` | FAGLFLEXT-OSL10 | customer interface field: OtherAmount10 (unconfirmed) | copy | yes |
| `TransactionAmount11` | FAGLFLEXT-TSL11 | customer interface field: TransactionAmount11 (unconfirmed) | copy | yes |
| `LocalAmount11` | FAGLFLEXT-HSL11 | customer interface field: LocalAmount11 (unconfirmed) | copy | yes |
| `GroupAmount11` | FAGLFLEXT-KSL11 | customer interface field: GroupAmount11 (unconfirmed) | copy | yes |
| `OtherAmount11` | FAGLFLEXT-OSL11 | customer interface field: OtherAmount11 (unconfirmed) | copy | yes |
| `TransactionAmount12` | FAGLFLEXT-TSL12 | customer interface field: TransactionAmount12 (unconfirmed) | copy | yes |
| `LocalAmount12` | FAGLFLEXT-HSL12 | customer interface field: LocalAmount12 (unconfirmed) | copy | yes |
| `GroupAmount12` | FAGLFLEXT-KSL12 | customer interface field: GroupAmount12 (unconfirmed) | copy | yes |
| `OtherAmount12` | FAGLFLEXT-OSL12 | customer interface field: OtherAmount12 (unconfirmed) | copy | yes |
| `TransactionAmount13` | FAGLFLEXT-TSL13 | customer interface field: TransactionAmount13 (unconfirmed) | copy | yes |
| `LocalAmount13` | FAGLFLEXT-HSL13 | customer interface field: LocalAmount13 (unconfirmed) | copy | yes |
| `GroupAmount13` | FAGLFLEXT-KSL13 | customer interface field: GroupAmount13 (unconfirmed) | copy | yes |
| `OtherAmount13` | FAGLFLEXT-OSL13 | customer interface field: OtherAmount13 (unconfirmed) | copy | yes |
| `TransactionAmount14` | FAGLFLEXT-TSL14 | customer interface field: TransactionAmount14 (unconfirmed) | copy | yes |
| `LocalAmount14` | FAGLFLEXT-HSL14 | customer interface field: LocalAmount14 (unconfirmed) | copy | yes |
| `GroupAmount14` | FAGLFLEXT-KSL14 | customer interface field: GroupAmount14 (unconfirmed) | copy | yes |
| `OtherAmount14` | FAGLFLEXT-OSL14 | customer interface field: OtherAmount14 (unconfirmed) | copy | yes |
| `TransactionAmount15` | FAGLFLEXT-TSL15 | customer interface field: TransactionAmount15 (unconfirmed) | copy | yes |
| `LocalAmount15` | FAGLFLEXT-HSL15 | customer interface field: LocalAmount15 (unconfirmed) | copy | yes |
| `GroupAmount15` | FAGLFLEXT-KSL15 | customer interface field: GroupAmount15 (unconfirmed) | copy | yes |
| `OtherAmount15` | FAGLFLEXT-OSL15 | customer interface field: OtherAmount15 (unconfirmed) | copy | yes |
| `TransactionAmount16` | FAGLFLEXT-TSL16 | customer interface field: TransactionAmount16 (unconfirmed) | copy | yes |
| `LocalAmount16` | FAGLFLEXT-HSL16 | customer interface field: LocalAmount16 (unconfirmed) | copy | yes |
| `GroupAmount16` | FAGLFLEXT-KSL16 | customer interface field: GroupAmount16 (unconfirmed) | copy | yes |
| `OtherAmount16` | FAGLFLEXT-OSL16 | customer interface field: OtherAmount16 (unconfirmed) | copy | yes |

## Reconciliation

- Counts: `ZFIX_C_ClassicBalanceMigCount` (ECC) vs `-` (S/4HANA) per `Ledger`

```bash
python3 tools/mig_reconcile.py counts --product fi_mig_ecc --module gl_opening_balance --source ecc_counts.csv --target s4_counts.csv
```

## Open gaps

- Customers and suppliers require Business Partner/CVI mapping, roles and numbering. FI BSEG may be a cluster table in ECC and therefore cannot be assumed readable by CDS; use the full-row ABAP helper or a verified extraction interface when necessary. Open-at-cutover means posted by cutover and not cleared by cutover, including subsequently cleared items. Separate currencies, debit/credit signs, ledgers and fiscal periods; prevent double-counting subledger openings in G/L balances.
- Choose classic OR new G/L for each ledger population; do not union both. DDIC must confirm all ledger dimensions and include any additional keys. Period 00 is carryforward, not period 01; calculate cutoff totals from the approved fiscal-year/period contract, including special periods only as intended. Enrich currency types from ledger/company configuration and classify accounts from SKB1. Exclude balances already supplied by FI-AA/AP/AR/open-item migration; reconcile migration clearing accounts to zero. No automatic totals-to-posting transformation is supplied.
