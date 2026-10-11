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

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `Product` | MKAL-MATNR | customer interface field: Product (unconfirmed) | information only |
| `Plant` | MKAL-WERKS | customer interface field: Plant (unconfirmed) | information only |
| `ProductionVersion` | MKAL-VERID | customer interface field: ProductionVersion (unconfirmed) | information only |
| `ProductionVersionText` | MKAL-TEXT1 | customer interface field: ProductionVersionText (unconfirmed) | information only |
| `ValidityStartDate` | MKAL-ADATU | customer interface field: ValidityStartDate (unconfirmed) | information only |
| `ValidityEndDate` | MKAL-BDATU | customer interface field: ValidityEndDate (unconfirmed) | information only |
| `MinimumLotSize` | MKAL-BSTMI | customer interface field: MinimumLotSize (unconfirmed) | information only |
| `MaximumLotSize` | MKAL-BSTMA | customer interface field: MaximumLotSize (unconfirmed) | information only |
| `BOMAlternative` | MKAL-STLAL | customer interface field: BOMAlternative (unconfirmed) | information only |
| `BOMUsage` | MKAL-STLAN | customer interface field: BOMUsage (unconfirmed) | information only |
| `TaskListType` | MKAL-PLNTY | customer interface field: TaskListType (unconfirmed) | information only |
| `TaskListGroup` | MKAL-PLNNR | customer interface field: TaskListGroup (unconfirmed) | information only |
| `TaskListGroupCounter` | MKAL-ALNAL | customer interface field: TaskListGroupCounter (unconfirmed) | information only |
| `ProductionVersionLock` | MKAL-MKSP | customer interface field: ProductionVersionLock (unconfirmed) | information only |

## Source controls

- Source count view: `ZPPX_C_ProdVersionMigCount`

## Open gaps

- BOMs and routings need key date, engineering change, usage, alternative and selected-node resolution. Preserve alternative sequences and dependencies. Production orders are process references unless the chosen target interface explicitly supports their state; confirmations, goods movements and costs must not be reposted as master data.
- Verify production-version validity, lot-size ranges, lock/check status and the effective BOM/task-list combination. Materials and plants are cross-domain prerequisites. Distinct production versions may intentionally overlap; evaluate availability for a version identity rather than rejecting every material-level overlap. REM planning levels require release-specific interface review.
