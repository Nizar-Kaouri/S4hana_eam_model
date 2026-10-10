# Migration interface: cost_actuals

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been run on a system.

- **Read by:** customer-selected supported posting interface; reference data is not posted
- **Load after:** `cost_center`, `internal_order`
- **Business key:** `ControllingArea`, `COAccountingDocument`, `COAccountingDocumentItem` · numbering **keep**
- **Key rule:** Preserve source identifiers in an audit ledger; map regenerated internal IDs and target numbering. Never assume internal IDs survive migration.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZCOX_C_CostActualMig`

- Source: `ZCOX_I_CostActual`
- Keys: `ControllingArea`, `COAccountingDocument`, `COAccountingDocumentItem`
- Scope: `all rows`
- Delivery mode: **reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Resolve time intervals at cutover and map controlling areas, cost centers, profit centers and order numbers. Cost elements integrate with S/4HANA G/L accounts. COEP is source history, not a target Universal Journal posting template. Plan data, allocations, settlement and commitments require additional interface scope.

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

- Counts: `ZCOX_C_CostActualMigCount` (ECC) vs `-` (S/4HANA) per `ControllingArea`

```bash
python3 tools/mig_reconcile.py counts --product co_mig_ecc --module cost_actuals --source ecc_counts.csv --target s4_counts.csv
```

## Open gaps

- Resolve time intervals at cutover and map controlling areas, cost centers, profit centers and order numbers. Cost elements integrate with S/4HANA G/L accounts. COEP is source history, not a target Universal Journal posting template. Plan data, allocations, settlement and commitments require additional interface scope.
