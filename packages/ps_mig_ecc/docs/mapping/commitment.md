# Migration interface: commitment

> Version **1.0.0**

- **Read by:** Customer-verified business interface; reference restrictions apply
- **Load after:** `wbs_element`
- **Business key:** `ObjectNumber`, `FiscalYear`, `ValueType`, `Version`, `CostElement`, `OriginGroup`, `BusinessTransaction`, `CommitmentDocument`, `CommitmentItem` · numbering **derived**
- **Key rule:** Preserve source identifiers in an audit ledger; map regenerated internal IDs and target numbering. Never assume internal IDs survive migration.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZPSX_C_CommitmentMig`

- Source: `ZPSX_I_Commitment`
- Keys: `ObjectNumber`, `FiscalYear`, `ValueType`, `Version`, `CostElement`, `OriginGroup`, `BusinessTransaction`, `CommitmentDocument`, `CommitmentItem`
- Scope: `all rows`
- Delivery mode: **reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Retain both external project/WBS identifiers and internal references. Rebuild hierarchy with target key maps; do not copy internal object numbers. Project costs are reference history. Status, networks, settlement rules, budgets, commitments and investment measures require a supported business interface and separate scope agreement. COOI grain and fields must be confirmed from DDIC before extraction. Tie commitments to approved PR/PO items and their remaining obligations. Commitments are generally regenerated from migrated purchasing documents: never post both a commitment history and its purchasing source. Enrich object and controlling-area currencies before monetary checks.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `ObjectNumber` | COOI-OBJNR | customer interface field: ObjectNumber (unconfirmed) | information only |
| `FiscalYear` | COOI-GJAHR | customer interface field: FiscalYear (unconfirmed) | information only |
| `ValueType` | COOI-WRTTP | customer interface field: ValueType (unconfirmed) | information only |
| `Version` | COOI-VERSN | customer interface field: Version (unconfirmed) | information only |
| `CostElement` | COOI-KSTAR | customer interface field: CostElement (unconfirmed) | information only |
| `OriginGroup` | COOI-HRKFT | customer interface field: OriginGroup (unconfirmed) | information only |
| `BusinessTransaction` | COOI-VRGNG | customer interface field: BusinessTransaction (unconfirmed) | information only |
| `CommitmentDocument` | COOI-BELNR | customer interface field: CommitmentDocument (unconfirmed) | information only |
| `CommitmentItem` | COOI-BUZEI | customer interface field: CommitmentItem (unconfirmed) | information only |
| `TransactionCurrency` | COOI-TWAER | customer interface field: TransactionCurrency (unconfirmed) | information only |
| `TransactionAmount` | COOI-WTGBTR | customer interface field: TransactionAmount (unconfirmed) | information only |
| `ObjectCurrencyAmount` | COOI-WOGBTR | customer interface field: ObjectCurrencyAmount (unconfirmed) | information only |
| `ControllingAreaAmount` | COOI-WKGBTR | customer interface field: ControllingAreaAmount (unconfirmed) | information only |

## Source controls

- Source count view: `ZPSX_C_CommitmentMigCount`

## Open gaps

- Retain both external project/WBS identifiers and internal references. Rebuild hierarchy with target key maps; do not copy internal object numbers. Project costs are reference history. Status, networks, settlement rules, budgets, commitments and investment measures require a supported business interface and separate scope agreement.
- COOI grain and fields must be confirmed from DDIC before extraction. Tie commitments to approved PR/PO items and their remaining obligations. Commitments are generally regenerated from migrated purchasing documents: never post both a commitment history and its purchasing source. Enrich object and controlling-area currencies before monetary checks.
