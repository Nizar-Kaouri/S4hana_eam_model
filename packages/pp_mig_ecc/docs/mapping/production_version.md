# Migration interface: production_version

> Version **1.0.0**

- **Read by:** Customer-verified business interface; effectivity-reference restrictions apply
- **Load after:** `bill_of_material`, `routing`
- **Business key:** `Product`, `Plant`, `ProductionVersion` · numbering **keep**
- **Key rule:** Preserve source identifiers in an audit ledger; map regenerated internal IDs and target numbering. Never assume internal IDs survive migration.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZPPX_C_ProdVersionMig`

- Source: `ZPPX_I_ProdVersion`
- Keys: `Product`, `Plant`, `ProductionVersion`
- Scope: `all rows`
- Delivery mode: **effectivity-reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. BOMs and routings need key date, engineering change, usage, alternative and selected-node resolution. Preserve alternative sequences and dependencies. Production orders are process references unless the chosen target interface explicitly supports their state; confirmations, goods movements and costs must not be reposted as master data. Verify production-version validity, lot-size ranges, lock/check status and the effective BOM/task-list combination. Materials and plants are cross-domain prerequisites. Distinct production versions may intentionally overlap; evaluate availability for a version identity rather than rejecting every material-level overlap. REM planning levels require release-specific interface review.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Product` | MKAL-MATNR | customer interface field: Product (unconfirmed) | information only | yes |
| `Plant` | MKAL-WERKS | customer interface field: Plant (unconfirmed) | information only | yes |
| `ProductionVersion` | MKAL-VERID | customer interface field: ProductionVersion (unconfirmed) | information only | yes |
| `ProductionVersionText` | MKAL-TEXT1 | customer interface field: ProductionVersionText (unconfirmed) | information only | yes |
| `ValidityStartDate` | MKAL-ADATU | customer interface field: ValidityStartDate (unconfirmed) | information only | yes |
| `ValidityEndDate` | MKAL-BDATU | customer interface field: ValidityEndDate (unconfirmed) | information only | yes |
| `MinimumLotSize` | MKAL-BSTMI | customer interface field: MinimumLotSize (unconfirmed) | information only | yes |
| `MaximumLotSize` | MKAL-BSTMA | customer interface field: MaximumLotSize (unconfirmed) | information only | yes |
| `BOMAlternative` | MKAL-STLAL | customer interface field: BOMAlternative (unconfirmed) | information only | yes |
| `BOMUsage` | MKAL-STLAN | customer interface field: BOMUsage (unconfirmed) | information only | yes |
| `TaskListType` | MKAL-PLNTY | customer interface field: TaskListType (unconfirmed) | information only | yes |
| `TaskListGroup` | MKAL-PLNNR | customer interface field: TaskListGroup (unconfirmed) | information only | yes |
| `TaskListGroupCounter` | MKAL-ALNAL | customer interface field: TaskListGroupCounter (unconfirmed) | information only | yes |
| `ProductionVersionLock` | MKAL-MKSP | customer interface field: ProductionVersionLock (unconfirmed) | information only | yes |

## Reconciliation

- Counts: `ZPPX_C_ProdVersionMigCount` (ECC) vs `-` (S/4HANA) per `Product`

```bash
python3 tools/mig_reconcile.py counts --product pp_mig_ecc --module production_version --source ecc_counts.csv --target s4_counts.csv
```

## Open gaps

- BOMs and routings need key date, engineering change, usage, alternative and selected-node resolution. Preserve alternative sequences and dependencies. Production orders are process references unless the chosen target interface explicitly supports their state; confirmations, goods movements and costs must not be reposted as master data.
- Verify production-version validity, lot-size ranges, lock/check status and the effective BOM/task-list combination. Materials and plants are cross-domain prerequisites. Distinct production versions may intentionally overlap; evaluate availability for a version identity rather than rejecting every material-level overlap. REM planning levels require release-specific interface review.
