# Migration interface: planning

> Version **1.0.0**

- **Read by:** Customer-verified business interface; planning-reference restrictions apply
- **Load after:** `cost_center`, `internal_order`, `cost_element`
- **Business key:** `Ledger`, `ObjectNumber`, `FiscalYear`, `ValueType`, `PlanVersion`, `CostElement`, `OriginGroup`, `BusinessTransaction`, `TradingPartner`, `PartnerBusinessArea`, `DebitCreditCode`, `PeriodBlock` · numbering **keep**
- **Key rule:** Preserve source identifiers in an audit ledger; map regenerated internal IDs and target numbering. Never assume internal IDs survive migration.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZCOX_C_PrimaryPlanMig`

- Source: `ZCOX_I_PrimaryPlan`
- Keys: `Ledger`, `ObjectNumber`, `FiscalYear`, `ValueType`, `PlanVersion`, `CostElement`, `OriginGroup`, `BusinessTransaction`, `TradingPartner`, `PartnerBusinessArea`, `DebitCreditCode`, `PeriodBlock`
- Scope: `all rows`
- Delivery mode: **planning-reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Resolve time intervals at cutover and map controlling areas, cost centers, profit centers and order numbers. Cost elements integrate with S/4HANA G/L accounts. COEP is source history, not a target Universal Journal posting template. Plan data, allocations, settlement and commitments require additional interface scope. COSP/COSS also contain actuals: approve the plan value types and versions explicitly. Preserve period blocks, periods 01–16, fiscal-year variant, controlling/object/transaction currencies and debit-credit semantics. Resolve cost objects and accounts first. Target ACDOCP planning is not a field-for-field copy of these totals; choose a supported plan import and map period/currency types.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Ledger` | COSP-LEDNR | customer interface field: Ledger (unconfirmed) | information only | yes |
| `ObjectNumber` | COSP-OBJNR | customer interface field: ObjectNumber (unconfirmed) | information only | yes |
| `FiscalYear` | COSP-GJAHR | customer interface field: FiscalYear (unconfirmed) | information only | yes |
| `ValueType` | COSP-WRTTP | customer interface field: ValueType (unconfirmed) | information only | yes |
| `PlanVersion` | COSP-VERSN | customer interface field: PlanVersion (unconfirmed) | information only | yes |
| `CostElement` | COSP-KSTAR | customer interface field: CostElement (unconfirmed) | information only | yes |
| `OriginGroup` | COSP-HRKFT | customer interface field: OriginGroup (unconfirmed) | information only | yes |
| `BusinessTransaction` | COSP-VRGNG | customer interface field: BusinessTransaction (unconfirmed) | information only | yes |
| `TradingPartner` | COSP-VBUND | customer interface field: TradingPartner (unconfirmed) | information only | yes |
| `PartnerBusinessArea` | COSP-PARGB | customer interface field: PartnerBusinessArea (unconfirmed) | information only | yes |
| `DebitCreditCode` | COSP-BEKNZ | customer interface field: DebitCreditCode (unconfirmed) | information only | yes |
| `PeriodBlock` | COSP-PERBL | customer interface field: PeriodBlock (unconfirmed) | information only | yes |
| `TransactionCurrency` | COSP-TWAER | customer interface field: TransactionCurrency (unconfirmed) | information only | yes |
| `ControllingAmount01` | COSP-WKG001 | customer interface field: ControllingAmount01 (unconfirmed) | information only | yes |
| `ObjectAmount01` | COSP-WOG001 | customer interface field: ObjectAmount01 (unconfirmed) | information only | yes |
| `TransactionAmount01` | COSP-WTG001 | customer interface field: TransactionAmount01 (unconfirmed) | information only | yes |
| `ControllingAmount02` | COSP-WKG002 | customer interface field: ControllingAmount02 (unconfirmed) | information only | yes |
| `ObjectAmount02` | COSP-WOG002 | customer interface field: ObjectAmount02 (unconfirmed) | information only | yes |
| `TransactionAmount02` | COSP-WTG002 | customer interface field: TransactionAmount02 (unconfirmed) | information only | yes |
| `ControllingAmount03` | COSP-WKG003 | customer interface field: ControllingAmount03 (unconfirmed) | information only | yes |
| `ObjectAmount03` | COSP-WOG003 | customer interface field: ObjectAmount03 (unconfirmed) | information only | yes |
| `TransactionAmount03` | COSP-WTG003 | customer interface field: TransactionAmount03 (unconfirmed) | information only | yes |
| `ControllingAmount04` | COSP-WKG004 | customer interface field: ControllingAmount04 (unconfirmed) | information only | yes |
| `ObjectAmount04` | COSP-WOG004 | customer interface field: ObjectAmount04 (unconfirmed) | information only | yes |
| `TransactionAmount04` | COSP-WTG004 | customer interface field: TransactionAmount04 (unconfirmed) | information only | yes |
| `ControllingAmount05` | COSP-WKG005 | customer interface field: ControllingAmount05 (unconfirmed) | information only | yes |
| `ObjectAmount05` | COSP-WOG005 | customer interface field: ObjectAmount05 (unconfirmed) | information only | yes |
| `TransactionAmount05` | COSP-WTG005 | customer interface field: TransactionAmount05 (unconfirmed) | information only | yes |
| `ControllingAmount06` | COSP-WKG006 | customer interface field: ControllingAmount06 (unconfirmed) | information only | yes |
| `ObjectAmount06` | COSP-WOG006 | customer interface field: ObjectAmount06 (unconfirmed) | information only | yes |
| `TransactionAmount06` | COSP-WTG006 | customer interface field: TransactionAmount06 (unconfirmed) | information only | yes |
| `ControllingAmount07` | COSP-WKG007 | customer interface field: ControllingAmount07 (unconfirmed) | information only | yes |
| `ObjectAmount07` | COSP-WOG007 | customer interface field: ObjectAmount07 (unconfirmed) | information only | yes |
| `TransactionAmount07` | COSP-WTG007 | customer interface field: TransactionAmount07 (unconfirmed) | information only | yes |
| `ControllingAmount08` | COSP-WKG008 | customer interface field: ControllingAmount08 (unconfirmed) | information only | yes |
| `ObjectAmount08` | COSP-WOG008 | customer interface field: ObjectAmount08 (unconfirmed) | information only | yes |
| `TransactionAmount08` | COSP-WTG008 | customer interface field: TransactionAmount08 (unconfirmed) | information only | yes |
| `ControllingAmount09` | COSP-WKG009 | customer interface field: ControllingAmount09 (unconfirmed) | information only | yes |
| `ObjectAmount09` | COSP-WOG009 | customer interface field: ObjectAmount09 (unconfirmed) | information only | yes |
| `TransactionAmount09` | COSP-WTG009 | customer interface field: TransactionAmount09 (unconfirmed) | information only | yes |
| `ControllingAmount10` | COSP-WKG010 | customer interface field: ControllingAmount10 (unconfirmed) | information only | yes |
| `ObjectAmount10` | COSP-WOG010 | customer interface field: ObjectAmount10 (unconfirmed) | information only | yes |
| `TransactionAmount10` | COSP-WTG010 | customer interface field: TransactionAmount10 (unconfirmed) | information only | yes |
| `ControllingAmount11` | COSP-WKG011 | customer interface field: ControllingAmount11 (unconfirmed) | information only | yes |
| `ObjectAmount11` | COSP-WOG011 | customer interface field: ObjectAmount11 (unconfirmed) | information only | yes |
| `TransactionAmount11` | COSP-WTG011 | customer interface field: TransactionAmount11 (unconfirmed) | information only | yes |
| `ControllingAmount12` | COSP-WKG012 | customer interface field: ControllingAmount12 (unconfirmed) | information only | yes |
| `ObjectAmount12` | COSP-WOG012 | customer interface field: ObjectAmount12 (unconfirmed) | information only | yes |
| `TransactionAmount12` | COSP-WTG012 | customer interface field: TransactionAmount12 (unconfirmed) | information only | yes |
| `ControllingAmount13` | COSP-WKG013 | customer interface field: ControllingAmount13 (unconfirmed) | information only | yes |
| `ObjectAmount13` | COSP-WOG013 | customer interface field: ObjectAmount13 (unconfirmed) | information only | yes |
| `TransactionAmount13` | COSP-WTG013 | customer interface field: TransactionAmount13 (unconfirmed) | information only | yes |
| `ControllingAmount14` | COSP-WKG014 | customer interface field: ControllingAmount14 (unconfirmed) | information only | yes |
| `ObjectAmount14` | COSP-WOG014 | customer interface field: ObjectAmount14 (unconfirmed) | information only | yes |
| `TransactionAmount14` | COSP-WTG014 | customer interface field: TransactionAmount14 (unconfirmed) | information only | yes |
| `ControllingAmount15` | COSP-WKG015 | customer interface field: ControllingAmount15 (unconfirmed) | information only | yes |
| `ObjectAmount15` | COSP-WOG015 | customer interface field: ObjectAmount15 (unconfirmed) | information only | yes |
| `TransactionAmount15` | COSP-WTG015 | customer interface field: TransactionAmount15 (unconfirmed) | information only | yes |
| `ControllingAmount16` | COSP-WKG016 | customer interface field: ControllingAmount16 (unconfirmed) | information only | yes |
| `ObjectAmount16` | COSP-WOG016 | customer interface field: ObjectAmount16 (unconfirmed) | information only | yes |
| `TransactionAmount16` | COSP-WTG016 | customer interface field: TransactionAmount16 (unconfirmed) | information only | yes |

## `ZCOX_C_SecondaryPlanMig`

- Source: `ZCOX_I_SecondaryPlan`
- Keys: `Ledger`, `ObjectNumber`, `FiscalYear`, `ValueType`, `PlanVersion`, `CostElement`, `OriginGroup`, `BusinessTransaction`, `TradingPartner`, `PartnerBusinessArea`, `DebitCreditCode`, `PeriodBlock`
- Scope: `all rows`
- Delivery mode: **planning-reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Resolve time intervals at cutover and map controlling areas, cost centers, profit centers and order numbers. Cost elements integrate with S/4HANA G/L accounts. COEP is source history, not a target Universal Journal posting template. Plan data, allocations, settlement and commitments require additional interface scope. COSP/COSS also contain actuals: approve the plan value types and versions explicitly. Preserve period blocks, periods 01–16, fiscal-year variant, controlling/object/transaction currencies and debit-credit semantics. Resolve cost objects and accounts first. Target ACDOCP planning is not a field-for-field copy of these totals; choose a supported plan import and map period/currency types.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Ledger` | COSS-LEDNR | customer interface field: Ledger (unconfirmed) | information only | yes |
| `ObjectNumber` | COSS-OBJNR | customer interface field: ObjectNumber (unconfirmed) | information only | yes |
| `FiscalYear` | COSS-GJAHR | customer interface field: FiscalYear (unconfirmed) | information only | yes |
| `ValueType` | COSS-WRTTP | customer interface field: ValueType (unconfirmed) | information only | yes |
| `PlanVersion` | COSS-VERSN | customer interface field: PlanVersion (unconfirmed) | information only | yes |
| `CostElement` | COSS-KSTAR | customer interface field: CostElement (unconfirmed) | information only | yes |
| `OriginGroup` | COSS-HRKFT | customer interface field: OriginGroup (unconfirmed) | information only | yes |
| `BusinessTransaction` | COSS-VRGNG | customer interface field: BusinessTransaction (unconfirmed) | information only | yes |
| `TradingPartner` | COSS-VBUND | customer interface field: TradingPartner (unconfirmed) | information only | yes |
| `PartnerBusinessArea` | COSS-PARGB | customer interface field: PartnerBusinessArea (unconfirmed) | information only | yes |
| `DebitCreditCode` | COSS-BEKNZ | customer interface field: DebitCreditCode (unconfirmed) | information only | yes |
| `PeriodBlock` | COSS-PERBL | customer interface field: PeriodBlock (unconfirmed) | information only | yes |
| `TransactionCurrency` | COSS-TWAER | customer interface field: TransactionCurrency (unconfirmed) | information only | yes |
| `ControllingAmount01` | COSS-WKG001 | customer interface field: ControllingAmount01 (unconfirmed) | information only | yes |
| `ObjectAmount01` | COSS-WOG001 | customer interface field: ObjectAmount01 (unconfirmed) | information only | yes |
| `TransactionAmount01` | COSS-WTG001 | customer interface field: TransactionAmount01 (unconfirmed) | information only | yes |
| `ControllingAmount02` | COSS-WKG002 | customer interface field: ControllingAmount02 (unconfirmed) | information only | yes |
| `ObjectAmount02` | COSS-WOG002 | customer interface field: ObjectAmount02 (unconfirmed) | information only | yes |
| `TransactionAmount02` | COSS-WTG002 | customer interface field: TransactionAmount02 (unconfirmed) | information only | yes |
| `ControllingAmount03` | COSS-WKG003 | customer interface field: ControllingAmount03 (unconfirmed) | information only | yes |
| `ObjectAmount03` | COSS-WOG003 | customer interface field: ObjectAmount03 (unconfirmed) | information only | yes |
| `TransactionAmount03` | COSS-WTG003 | customer interface field: TransactionAmount03 (unconfirmed) | information only | yes |
| `ControllingAmount04` | COSS-WKG004 | customer interface field: ControllingAmount04 (unconfirmed) | information only | yes |
| `ObjectAmount04` | COSS-WOG004 | customer interface field: ObjectAmount04 (unconfirmed) | information only | yes |
| `TransactionAmount04` | COSS-WTG004 | customer interface field: TransactionAmount04 (unconfirmed) | information only | yes |
| `ControllingAmount05` | COSS-WKG005 | customer interface field: ControllingAmount05 (unconfirmed) | information only | yes |
| `ObjectAmount05` | COSS-WOG005 | customer interface field: ObjectAmount05 (unconfirmed) | information only | yes |
| `TransactionAmount05` | COSS-WTG005 | customer interface field: TransactionAmount05 (unconfirmed) | information only | yes |
| `ControllingAmount06` | COSS-WKG006 | customer interface field: ControllingAmount06 (unconfirmed) | information only | yes |
| `ObjectAmount06` | COSS-WOG006 | customer interface field: ObjectAmount06 (unconfirmed) | information only | yes |
| `TransactionAmount06` | COSS-WTG006 | customer interface field: TransactionAmount06 (unconfirmed) | information only | yes |
| `ControllingAmount07` | COSS-WKG007 | customer interface field: ControllingAmount07 (unconfirmed) | information only | yes |
| `ObjectAmount07` | COSS-WOG007 | customer interface field: ObjectAmount07 (unconfirmed) | information only | yes |
| `TransactionAmount07` | COSS-WTG007 | customer interface field: TransactionAmount07 (unconfirmed) | information only | yes |
| `ControllingAmount08` | COSS-WKG008 | customer interface field: ControllingAmount08 (unconfirmed) | information only | yes |
| `ObjectAmount08` | COSS-WOG008 | customer interface field: ObjectAmount08 (unconfirmed) | information only | yes |
| `TransactionAmount08` | COSS-WTG008 | customer interface field: TransactionAmount08 (unconfirmed) | information only | yes |
| `ControllingAmount09` | COSS-WKG009 | customer interface field: ControllingAmount09 (unconfirmed) | information only | yes |
| `ObjectAmount09` | COSS-WOG009 | customer interface field: ObjectAmount09 (unconfirmed) | information only | yes |
| `TransactionAmount09` | COSS-WTG009 | customer interface field: TransactionAmount09 (unconfirmed) | information only | yes |
| `ControllingAmount10` | COSS-WKG010 | customer interface field: ControllingAmount10 (unconfirmed) | information only | yes |
| `ObjectAmount10` | COSS-WOG010 | customer interface field: ObjectAmount10 (unconfirmed) | information only | yes |
| `TransactionAmount10` | COSS-WTG010 | customer interface field: TransactionAmount10 (unconfirmed) | information only | yes |
| `ControllingAmount11` | COSS-WKG011 | customer interface field: ControllingAmount11 (unconfirmed) | information only | yes |
| `ObjectAmount11` | COSS-WOG011 | customer interface field: ObjectAmount11 (unconfirmed) | information only | yes |
| `TransactionAmount11` | COSS-WTG011 | customer interface field: TransactionAmount11 (unconfirmed) | information only | yes |
| `ControllingAmount12` | COSS-WKG012 | customer interface field: ControllingAmount12 (unconfirmed) | information only | yes |
| `ObjectAmount12` | COSS-WOG012 | customer interface field: ObjectAmount12 (unconfirmed) | information only | yes |
| `TransactionAmount12` | COSS-WTG012 | customer interface field: TransactionAmount12 (unconfirmed) | information only | yes |
| `ControllingAmount13` | COSS-WKG013 | customer interface field: ControllingAmount13 (unconfirmed) | information only | yes |
| `ObjectAmount13` | COSS-WOG013 | customer interface field: ObjectAmount13 (unconfirmed) | information only | yes |
| `TransactionAmount13` | COSS-WTG013 | customer interface field: TransactionAmount13 (unconfirmed) | information only | yes |
| `ControllingAmount14` | COSS-WKG014 | customer interface field: ControllingAmount14 (unconfirmed) | information only | yes |
| `ObjectAmount14` | COSS-WOG014 | customer interface field: ObjectAmount14 (unconfirmed) | information only | yes |
| `TransactionAmount14` | COSS-WTG014 | customer interface field: TransactionAmount14 (unconfirmed) | information only | yes |
| `ControllingAmount15` | COSS-WKG015 | customer interface field: ControllingAmount15 (unconfirmed) | information only | yes |
| `ObjectAmount15` | COSS-WOG015 | customer interface field: ObjectAmount15 (unconfirmed) | information only | yes |
| `TransactionAmount15` | COSS-WTG015 | customer interface field: TransactionAmount15 (unconfirmed) | information only | yes |
| `ControllingAmount16` | COSS-WKG016 | customer interface field: ControllingAmount16 (unconfirmed) | information only | yes |
| `ObjectAmount16` | COSS-WOG016 | customer interface field: ObjectAmount16 (unconfirmed) | information only | yes |
| `TransactionAmount16` | COSS-WTG016 | customer interface field: TransactionAmount16 (unconfirmed) | information only | yes |

## Reconciliation

- Counts: `ZCOX_C_PrimaryPlanMigCount` (ECC) vs `-` (S/4HANA) per `Ledger`

```bash
python3 tools/mig_reconcile.py counts --product co_mig_ecc --module planning --source ecc_counts.csv --target s4_counts.csv
```

## Open gaps

- Resolve time intervals at cutover and map controlling areas, cost centers, profit centers and order numbers. Cost elements integrate with S/4HANA G/L accounts. COEP is source history, not a target Universal Journal posting template. Plan data, allocations, settlement and commitments require additional interface scope.
- COSP/COSS also contain actuals: approve the plan value types and versions explicitly. Preserve period blocks, periods 01–16, fiscal-year variant, controlling/object/transaction currencies and debit-credit semantics. Resolve cost objects and accounts first. Target ACDOCP planning is not a field-for-field copy of these totals; choose a supported plan import and map period/currency types.
