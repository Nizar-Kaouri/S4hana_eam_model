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

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `Ledger` | COSP-LEDNR | customer interface field: Ledger (unconfirmed) | information only |
| `ObjectNumber` | COSP-OBJNR | customer interface field: ObjectNumber (unconfirmed) | information only |
| `FiscalYear` | COSP-GJAHR | customer interface field: FiscalYear (unconfirmed) | information only |
| `ValueType` | COSP-WRTTP | customer interface field: ValueType (unconfirmed) | information only |
| `PlanVersion` | COSP-VERSN | customer interface field: PlanVersion (unconfirmed) | information only |
| `CostElement` | COSP-KSTAR | customer interface field: CostElement (unconfirmed) | information only |
| `OriginGroup` | COSP-HRKFT | customer interface field: OriginGroup (unconfirmed) | information only |
| `BusinessTransaction` | COSP-VRGNG | customer interface field: BusinessTransaction (unconfirmed) | information only |
| `TradingPartner` | COSP-VBUND | customer interface field: TradingPartner (unconfirmed) | information only |
| `PartnerBusinessArea` | COSP-PARGB | customer interface field: PartnerBusinessArea (unconfirmed) | information only |
| `DebitCreditCode` | COSP-BEKNZ | customer interface field: DebitCreditCode (unconfirmed) | information only |
| `PeriodBlock` | COSP-PERBL | customer interface field: PeriodBlock (unconfirmed) | information only |
| `TransactionCurrency` | COSP-TWAER | customer interface field: TransactionCurrency (unconfirmed) | information only |
| `ControllingAmount01` | COSP-WKG001 | customer interface field: ControllingAmount01 (unconfirmed) | information only |
| `ObjectAmount01` | COSP-WOG001 | customer interface field: ObjectAmount01 (unconfirmed) | information only |
| `TransactionAmount01` | COSP-WTG001 | customer interface field: TransactionAmount01 (unconfirmed) | information only |
| `ControllingAmount02` | COSP-WKG002 | customer interface field: ControllingAmount02 (unconfirmed) | information only |
| `ObjectAmount02` | COSP-WOG002 | customer interface field: ObjectAmount02 (unconfirmed) | information only |
| `TransactionAmount02` | COSP-WTG002 | customer interface field: TransactionAmount02 (unconfirmed) | information only |
| `ControllingAmount03` | COSP-WKG003 | customer interface field: ControllingAmount03 (unconfirmed) | information only |
| `ObjectAmount03` | COSP-WOG003 | customer interface field: ObjectAmount03 (unconfirmed) | information only |
| `TransactionAmount03` | COSP-WTG003 | customer interface field: TransactionAmount03 (unconfirmed) | information only |
| `ControllingAmount04` | COSP-WKG004 | customer interface field: ControllingAmount04 (unconfirmed) | information only |
| `ObjectAmount04` | COSP-WOG004 | customer interface field: ObjectAmount04 (unconfirmed) | information only |
| `TransactionAmount04` | COSP-WTG004 | customer interface field: TransactionAmount04 (unconfirmed) | information only |
| `ControllingAmount05` | COSP-WKG005 | customer interface field: ControllingAmount05 (unconfirmed) | information only |
| `ObjectAmount05` | COSP-WOG005 | customer interface field: ObjectAmount05 (unconfirmed) | information only |
| `TransactionAmount05` | COSP-WTG005 | customer interface field: TransactionAmount05 (unconfirmed) | information only |
| `ControllingAmount06` | COSP-WKG006 | customer interface field: ControllingAmount06 (unconfirmed) | information only |
| `ObjectAmount06` | COSP-WOG006 | customer interface field: ObjectAmount06 (unconfirmed) | information only |
| `TransactionAmount06` | COSP-WTG006 | customer interface field: TransactionAmount06 (unconfirmed) | information only |
| `ControllingAmount07` | COSP-WKG007 | customer interface field: ControllingAmount07 (unconfirmed) | information only |
| `ObjectAmount07` | COSP-WOG007 | customer interface field: ObjectAmount07 (unconfirmed) | information only |
| `TransactionAmount07` | COSP-WTG007 | customer interface field: TransactionAmount07 (unconfirmed) | information only |
| `ControllingAmount08` | COSP-WKG008 | customer interface field: ControllingAmount08 (unconfirmed) | information only |
| `ObjectAmount08` | COSP-WOG008 | customer interface field: ObjectAmount08 (unconfirmed) | information only |
| `TransactionAmount08` | COSP-WTG008 | customer interface field: TransactionAmount08 (unconfirmed) | information only |
| `ControllingAmount09` | COSP-WKG009 | customer interface field: ControllingAmount09 (unconfirmed) | information only |
| `ObjectAmount09` | COSP-WOG009 | customer interface field: ObjectAmount09 (unconfirmed) | information only |
| `TransactionAmount09` | COSP-WTG009 | customer interface field: TransactionAmount09 (unconfirmed) | information only |
| `ControllingAmount10` | COSP-WKG010 | customer interface field: ControllingAmount10 (unconfirmed) | information only |
| `ObjectAmount10` | COSP-WOG010 | customer interface field: ObjectAmount10 (unconfirmed) | information only |
| `TransactionAmount10` | COSP-WTG010 | customer interface field: TransactionAmount10 (unconfirmed) | information only |
| `ControllingAmount11` | COSP-WKG011 | customer interface field: ControllingAmount11 (unconfirmed) | information only |
| `ObjectAmount11` | COSP-WOG011 | customer interface field: ObjectAmount11 (unconfirmed) | information only |
| `TransactionAmount11` | COSP-WTG011 | customer interface field: TransactionAmount11 (unconfirmed) | information only |
| `ControllingAmount12` | COSP-WKG012 | customer interface field: ControllingAmount12 (unconfirmed) | information only |
| `ObjectAmount12` | COSP-WOG012 | customer interface field: ObjectAmount12 (unconfirmed) | information only |
| `TransactionAmount12` | COSP-WTG012 | customer interface field: TransactionAmount12 (unconfirmed) | information only |
| `ControllingAmount13` | COSP-WKG013 | customer interface field: ControllingAmount13 (unconfirmed) | information only |
| `ObjectAmount13` | COSP-WOG013 | customer interface field: ObjectAmount13 (unconfirmed) | information only |
| `TransactionAmount13` | COSP-WTG013 | customer interface field: TransactionAmount13 (unconfirmed) | information only |
| `ControllingAmount14` | COSP-WKG014 | customer interface field: ControllingAmount14 (unconfirmed) | information only |
| `ObjectAmount14` | COSP-WOG014 | customer interface field: ObjectAmount14 (unconfirmed) | information only |
| `TransactionAmount14` | COSP-WTG014 | customer interface field: TransactionAmount14 (unconfirmed) | information only |
| `ControllingAmount15` | COSP-WKG015 | customer interface field: ControllingAmount15 (unconfirmed) | information only |
| `ObjectAmount15` | COSP-WOG015 | customer interface field: ObjectAmount15 (unconfirmed) | information only |
| `TransactionAmount15` | COSP-WTG015 | customer interface field: TransactionAmount15 (unconfirmed) | information only |
| `ControllingAmount16` | COSP-WKG016 | customer interface field: ControllingAmount16 (unconfirmed) | information only |
| `ObjectAmount16` | COSP-WOG016 | customer interface field: ObjectAmount16 (unconfirmed) | information only |
| `TransactionAmount16` | COSP-WTG016 | customer interface field: TransactionAmount16 (unconfirmed) | information only |

## `ZCOX_C_SecondaryPlanMig`

- Source: `ZCOX_I_SecondaryPlan`
- Keys: `Ledger`, `ObjectNumber`, `FiscalYear`, `ValueType`, `PlanVersion`, `CostElement`, `OriginGroup`, `BusinessTransaction`, `TradingPartner`, `PartnerBusinessArea`, `DebitCreditCode`, `PeriodBlock`
- Scope: `all rows`
- Delivery mode: **planning-reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Resolve time intervals at cutover and map controlling areas, cost centers, profit centers and order numbers. Cost elements integrate with S/4HANA G/L accounts. COEP is source history, not a target Universal Journal posting template. Plan data, allocations, settlement and commitments require additional interface scope. COSP/COSS also contain actuals: approve the plan value types and versions explicitly. Preserve period blocks, periods 01–16, fiscal-year variant, controlling/object/transaction currencies and debit-credit semantics. Resolve cost objects and accounts first. Target ACDOCP planning is not a field-for-field copy of these totals; choose a supported plan import and map period/currency types.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `Ledger` | COSS-LEDNR | customer interface field: Ledger (unconfirmed) | information only |
| `ObjectNumber` | COSS-OBJNR | customer interface field: ObjectNumber (unconfirmed) | information only |
| `FiscalYear` | COSS-GJAHR | customer interface field: FiscalYear (unconfirmed) | information only |
| `ValueType` | COSS-WRTTP | customer interface field: ValueType (unconfirmed) | information only |
| `PlanVersion` | COSS-VERSN | customer interface field: PlanVersion (unconfirmed) | information only |
| `CostElement` | COSS-KSTAR | customer interface field: CostElement (unconfirmed) | information only |
| `OriginGroup` | COSS-HRKFT | customer interface field: OriginGroup (unconfirmed) | information only |
| `BusinessTransaction` | COSS-VRGNG | customer interface field: BusinessTransaction (unconfirmed) | information only |
| `TradingPartner` | COSS-VBUND | customer interface field: TradingPartner (unconfirmed) | information only |
| `PartnerBusinessArea` | COSS-PARGB | customer interface field: PartnerBusinessArea (unconfirmed) | information only |
| `DebitCreditCode` | COSS-BEKNZ | customer interface field: DebitCreditCode (unconfirmed) | information only |
| `PeriodBlock` | COSS-PERBL | customer interface field: PeriodBlock (unconfirmed) | information only |
| `TransactionCurrency` | COSS-TWAER | customer interface field: TransactionCurrency (unconfirmed) | information only |
| `ControllingAmount01` | COSS-WKG001 | customer interface field: ControllingAmount01 (unconfirmed) | information only |
| `ObjectAmount01` | COSS-WOG001 | customer interface field: ObjectAmount01 (unconfirmed) | information only |
| `TransactionAmount01` | COSS-WTG001 | customer interface field: TransactionAmount01 (unconfirmed) | information only |
| `ControllingAmount02` | COSS-WKG002 | customer interface field: ControllingAmount02 (unconfirmed) | information only |
| `ObjectAmount02` | COSS-WOG002 | customer interface field: ObjectAmount02 (unconfirmed) | information only |
| `TransactionAmount02` | COSS-WTG002 | customer interface field: TransactionAmount02 (unconfirmed) | information only |
| `ControllingAmount03` | COSS-WKG003 | customer interface field: ControllingAmount03 (unconfirmed) | information only |
| `ObjectAmount03` | COSS-WOG003 | customer interface field: ObjectAmount03 (unconfirmed) | information only |
| `TransactionAmount03` | COSS-WTG003 | customer interface field: TransactionAmount03 (unconfirmed) | information only |
| `ControllingAmount04` | COSS-WKG004 | customer interface field: ControllingAmount04 (unconfirmed) | information only |
| `ObjectAmount04` | COSS-WOG004 | customer interface field: ObjectAmount04 (unconfirmed) | information only |
| `TransactionAmount04` | COSS-WTG004 | customer interface field: TransactionAmount04 (unconfirmed) | information only |
| `ControllingAmount05` | COSS-WKG005 | customer interface field: ControllingAmount05 (unconfirmed) | information only |
| `ObjectAmount05` | COSS-WOG005 | customer interface field: ObjectAmount05 (unconfirmed) | information only |
| `TransactionAmount05` | COSS-WTG005 | customer interface field: TransactionAmount05 (unconfirmed) | information only |
| `ControllingAmount06` | COSS-WKG006 | customer interface field: ControllingAmount06 (unconfirmed) | information only |
| `ObjectAmount06` | COSS-WOG006 | customer interface field: ObjectAmount06 (unconfirmed) | information only |
| `TransactionAmount06` | COSS-WTG006 | customer interface field: TransactionAmount06 (unconfirmed) | information only |
| `ControllingAmount07` | COSS-WKG007 | customer interface field: ControllingAmount07 (unconfirmed) | information only |
| `ObjectAmount07` | COSS-WOG007 | customer interface field: ObjectAmount07 (unconfirmed) | information only |
| `TransactionAmount07` | COSS-WTG007 | customer interface field: TransactionAmount07 (unconfirmed) | information only |
| `ControllingAmount08` | COSS-WKG008 | customer interface field: ControllingAmount08 (unconfirmed) | information only |
| `ObjectAmount08` | COSS-WOG008 | customer interface field: ObjectAmount08 (unconfirmed) | information only |
| `TransactionAmount08` | COSS-WTG008 | customer interface field: TransactionAmount08 (unconfirmed) | information only |
| `ControllingAmount09` | COSS-WKG009 | customer interface field: ControllingAmount09 (unconfirmed) | information only |
| `ObjectAmount09` | COSS-WOG009 | customer interface field: ObjectAmount09 (unconfirmed) | information only |
| `TransactionAmount09` | COSS-WTG009 | customer interface field: TransactionAmount09 (unconfirmed) | information only |
| `ControllingAmount10` | COSS-WKG010 | customer interface field: ControllingAmount10 (unconfirmed) | information only |
| `ObjectAmount10` | COSS-WOG010 | customer interface field: ObjectAmount10 (unconfirmed) | information only |
| `TransactionAmount10` | COSS-WTG010 | customer interface field: TransactionAmount10 (unconfirmed) | information only |
| `ControllingAmount11` | COSS-WKG011 | customer interface field: ControllingAmount11 (unconfirmed) | information only |
| `ObjectAmount11` | COSS-WOG011 | customer interface field: ObjectAmount11 (unconfirmed) | information only |
| `TransactionAmount11` | COSS-WTG011 | customer interface field: TransactionAmount11 (unconfirmed) | information only |
| `ControllingAmount12` | COSS-WKG012 | customer interface field: ControllingAmount12 (unconfirmed) | information only |
| `ObjectAmount12` | COSS-WOG012 | customer interface field: ObjectAmount12 (unconfirmed) | information only |
| `TransactionAmount12` | COSS-WTG012 | customer interface field: TransactionAmount12 (unconfirmed) | information only |
| `ControllingAmount13` | COSS-WKG013 | customer interface field: ControllingAmount13 (unconfirmed) | information only |
| `ObjectAmount13` | COSS-WOG013 | customer interface field: ObjectAmount13 (unconfirmed) | information only |
| `TransactionAmount13` | COSS-WTG013 | customer interface field: TransactionAmount13 (unconfirmed) | information only |
| `ControllingAmount14` | COSS-WKG014 | customer interface field: ControllingAmount14 (unconfirmed) | information only |
| `ObjectAmount14` | COSS-WOG014 | customer interface field: ObjectAmount14 (unconfirmed) | information only |
| `TransactionAmount14` | COSS-WTG014 | customer interface field: TransactionAmount14 (unconfirmed) | information only |
| `ControllingAmount15` | COSS-WKG015 | customer interface field: ControllingAmount15 (unconfirmed) | information only |
| `ObjectAmount15` | COSS-WOG015 | customer interface field: ObjectAmount15 (unconfirmed) | information only |
| `TransactionAmount15` | COSS-WTG015 | customer interface field: TransactionAmount15 (unconfirmed) | information only |
| `ControllingAmount16` | COSS-WKG016 | customer interface field: ControllingAmount16 (unconfirmed) | information only |
| `ObjectAmount16` | COSS-WOG016 | customer interface field: ObjectAmount16 (unconfirmed) | information only |
| `TransactionAmount16` | COSS-WTG016 | customer interface field: TransactionAmount16 (unconfirmed) | information only |

## Source controls

- Source count view: `ZCOX_C_PrimaryPlanMigCount`

## Open gaps

- Resolve time intervals at cutover and map controlling areas, cost centers, profit centers and order numbers. Cost elements integrate with S/4HANA G/L accounts. COEP is source history, not a target Universal Journal posting template. Plan data, allocations, settlement and commitments require additional interface scope.
- COSP/COSS also contain actuals: approve the plan value types and versions explicitly. Preserve period blocks, periods 01–16, fiscal-year variant, controlling/object/transaction currencies and debit-credit semantics. Resolve cost objects and accounts first. Target ACDOCP planning is not a field-for-field copy of these totals; choose a supported plan import and map period/currency types.
