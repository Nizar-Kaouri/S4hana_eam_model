# Migration interface: project_cost

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been run on a system.

- **Read by:** customer-selected supported posting interface; reference data is not posted
- **Load after:** `wbs_element`
- **Business key:** `ControllingArea`, `COAccountingDocument`, `COAccountingDocumentItem` · numbering **derived**
- **Key rule:** Preserve source identifiers in an audit ledger; map regenerated internal IDs and target numbering. Never assume internal IDs survive migration.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZPSX_C_ProjectCostMig`

- Source: `ZPSX_I_ProjectCost`
- Keys: `ControllingArea`, `COAccountingDocument`, `COAccountingDocumentItem`
- Scope: `all rows`
- Delivery mode: **reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Retain both external project/WBS identifiers and internal references. Rebuild hierarchy with target key maps; do not copy internal object numbers. Project costs are reference history. Status, networks, settlement rules, budgets, commitments and investment measures require a supported business interface and separate scope agreement.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `ControllingArea` | COEP-KOKRS | customer interface field: ControllingArea (unconfirmed) | information only | yes |
| `COAccountingDocument` | COEP-BELNR | customer interface field: COAccountingDocument (unconfirmed) | information only | yes |
| `COAccountingDocumentItem` | COEP-BUZEI | customer interface field: COAccountingDocumentItem (unconfirmed) | information only | yes |
| `FiscalYear` | COEP-GJAHR | customer interface field: FiscalYear (unconfirmed) | information only | yes |
| `ObjectNumber` | COEP-OBJNR | customer interface field: ObjectNumber (unconfirmed) | information only | yes |
| `CostElement` | COEP-KSTAR | customer interface field: CostElement (unconfirmed) | information only | yes |
| `ValueType` | COEP-WRTTP | customer interface field: ValueType (unconfirmed) | information only | yes |
| `BusinessTransaction` | COEP-VRGNG | customer interface field: BusinessTransaction (unconfirmed) | information only | yes |
| `TransactionAmount` | COEP-WTGBTR | customer interface field: TransactionAmount (unconfirmed) | information only | yes |
| `TransactionCurrency` | COEP-TWAER | customer interface field: TransactionCurrency (unconfirmed) | information only | yes |

## Reconciliation

- Counts: `ZPSX_C_ProjectCostMigCount` (ECC) vs `-` (S/4HANA) per `ControllingArea`

```bash
python3 tools/mig_reconcile.py counts --product ps_mig_ecc --module project_cost --source ecc_counts.csv --target s4_counts.csv
```

## Open gaps

- Retain both external project/WBS identifiers and internal references. Rebuild hierarchy with target key maps; do not copy internal object numbers. Project costs are reference history. Status, networks, settlement rules, budgets, commitments and investment measures require a supported business interface and separate scope agreement.
