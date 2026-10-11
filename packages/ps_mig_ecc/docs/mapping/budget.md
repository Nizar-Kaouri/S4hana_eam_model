# Migration interface: budget

> Version **1.0.0**

- **Read by:** Customer-verified business interface; balance restrictions apply
- **Load after:** `wbs_element`
- **Business key:** `Ledger`, `ObjectNumber`, `BudgetItem`, `TransactionIndicator`, `ValueType`, `Version` · numbering **derived**
- **Key rule:** Preserve source identifiers in an audit ledger; map regenerated internal IDs and target numbering. Never assume internal IDs survive migration.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZPSX_C_OverallBudgetMig`

- Source: `ZPSX_I_OverallBudget`
- Keys: `Ledger`, `ObjectNumber`, `BudgetItem`, `TransactionIndicator`, `ValueType`, `Version`
- Scope: `all rows`
- Delivery mode: **balance**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Retain both external project/WBS identifiers and internal references. Rebuild hierarchy with target key maps; do not copy internal object numbers. Project costs are reference history. Status, networks, settlement rules, budgets, commitments and investment measures require a supported business interface and separate scope agreement. Separate original budget, supplements, returns, releases and transfers by verified value type and transaction semantics; do not sum all BPGE/BPJA rows as available budget. Currency, object ownership, fiscal year and availability-control settings must be enriched and approved. Reconcile overall and annual budget separately through a supported budget interface.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Ledger` | BPGE-LEDNR | customer interface field: Ledger (unconfirmed) | copy | yes |
| `ObjectNumber` | BPGE-OBJNR | customer interface field: ObjectNumber (unconfirmed) | copy | yes |
| `BudgetItem` | BPGE-POSIT | customer interface field: BudgetItem (unconfirmed) | copy | yes |
| `TransactionIndicator` | BPGE-TRGKZ | customer interface field: TransactionIndicator (unconfirmed) | copy | yes |
| `ValueType` | BPGE-WRTTP | customer interface field: ValueType (unconfirmed) | copy | yes |
| `Version` | BPGE-VERSN | customer interface field: Version (unconfirmed) | copy | yes |
| `OverallBudgetAmount` | BPGE-WLGES | customer interface field: OverallBudgetAmount (unconfirmed) | copy | yes |

## `ZPSX_C_AnnualBudgetMig`

- Source: `ZPSX_I_AnnualBudget`
- Keys: `Ledger`, `ObjectNumber`, `BudgetItem`, `TransactionIndicator`, `ValueType`, `Version`, `FiscalYear`
- Scope: `all rows`
- Delivery mode: **balance**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Retain both external project/WBS identifiers and internal references. Rebuild hierarchy with target key maps; do not copy internal object numbers. Project costs are reference history. Status, networks, settlement rules, budgets, commitments and investment measures require a supported business interface and separate scope agreement. Separate original budget, supplements, returns, releases and transfers by verified value type and transaction semantics; do not sum all BPGE/BPJA rows as available budget. Currency, object ownership, fiscal year and availability-control settings must be enriched and approved. Reconcile overall and annual budget separately through a supported budget interface.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Ledger` | BPJA-LEDNR | customer interface field: Ledger (unconfirmed) | copy | yes |
| `ObjectNumber` | BPJA-OBJNR | customer interface field: ObjectNumber (unconfirmed) | copy | yes |
| `BudgetItem` | BPJA-POSIT | customer interface field: BudgetItem (unconfirmed) | copy | yes |
| `TransactionIndicator` | BPJA-TRGKZ | customer interface field: TransactionIndicator (unconfirmed) | copy | yes |
| `ValueType` | BPJA-WRTTP | customer interface field: ValueType (unconfirmed) | copy | yes |
| `Version` | BPJA-VERSN | customer interface field: Version (unconfirmed) | copy | yes |
| `FiscalYear` | BPJA-GJAHR | customer interface field: FiscalYear (unconfirmed) | copy | yes |
| `AnnualBudgetAmount` | BPJA-WTJHR | customer interface field: AnnualBudgetAmount (unconfirmed) | copy | yes |

## Reconciliation

- Counts: `ZPSX_C_OverallBudgetMigCount` (ECC) vs `-` (S/4HANA) per `Ledger`

```bash
python3 tools/mig_reconcile.py counts --product ps_mig_ecc --module budget --source ecc_counts.csv --target s4_counts.csv
```

## Open gaps

- Retain both external project/WBS identifiers and internal references. Rebuild hierarchy with target key maps; do not copy internal object numbers. Project costs are reference history. Status, networks, settlement rules, budgets, commitments and investment measures require a supported business interface and separate scope agreement.
- Separate original budget, supplements, returns, releases and transfers by verified value type and transaction semantics; do not sum all BPGE/BPJA rows as available budget. Currency, object ownership, fiscal year and availability-control settings must be enriched and approved. Reconcile overall and annual budget separately through a supported budget interface.
