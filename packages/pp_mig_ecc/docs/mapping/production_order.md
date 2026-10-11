# Migration interface: production_order

> Version **1.0.0**

- **Read by:** customer-selected supported posting interface; reference data is not posted
- **Load after:** - (first level)
- **Business key:** `ManufacturingOrder` · numbering **keep**
- **Key rule:** Preserve source identifiers in an audit ledger; map regenerated internal IDs and target numbering. Never assume internal IDs survive migration.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZPPX_C_ProductionOrdeMig`

- Source: `ZPPX_I_ProductionOrde`
- Keys: `ManufacturingOrder`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. BOMs and routings need key date, engineering change, usage, alternative and selected-node resolution. Preserve alternative sequences and dependencies. Production orders are process references unless the chosen target interface explicitly supports their state; confirmations, goods movements and costs must not be reposted as master data.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `ManufacturingOrder` | AUFK-AUFNR | customer interface field: ManufacturingOrder (unconfirmed) | information only | yes |
| `ManufacturingOrderType` | AUFK-AUART | customer interface field: ManufacturingOrderType (unconfirmed) | information only | yes |
| `OrderCategory` | AUFK-AUTYP | customer interface field: OrderCategory (unconfirmed) | information only | yes |
| `ManufacturingOrderText` | AUFK-KTEXT | customer interface field: ManufacturingOrderText (unconfirmed) | information only | yes |
| `CompanyCode` | AUFK-BUKRS | customer interface field: CompanyCode (unconfirmed) | information only | yes |
| `ProductionPlant` | AUFK-WERKS | customer interface field: ProductionPlant (unconfirmed) | information only | yes |
| `ObjectNumber` | AUFK-OBJNR | customer interface field: ObjectNumber (unconfirmed) | information only | yes |

## `ZPPX_C_ProductionHeadMig`

- Source: `ZPPX_I_ProductionHead`
- Keys: `ManufacturingOrder`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. BOMs and routings need key date, engineering change, usage, alternative and selected-node resolution. Preserve alternative sequences and dependencies. Production orders are process references unless the chosen target interface explicitly supports their state; confirmations, goods movements and costs must not be reposted as master data.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `ManufacturingOrder` | AFKO-AUFNR | customer interface field: ManufacturingOrder (unconfirmed) | information only | yes |
| `OperationRoutingNumber` | AFKO-AUFPL | customer interface field: OperationRoutingNumber (unconfirmed) | information only | yes |
| `TotalQuantity` | AFKO-GAMNG | customer interface field: TotalQuantity (unconfirmed) | information only | yes |
| `Unit` | AFKO-GMEIN | customer interface field: Unit (unconfirmed) | information only | yes |
| `BasicStartDate` | AFKO-GSTRP | customer interface field: BasicStartDate (unconfirmed) | information only | yes |
| `BasicEndDate` | AFKO-GLTRP | customer interface field: BasicEndDate (unconfirmed) | information only | yes |

## `ZPPX_C_ProductionItemMig`

- Source: `ZPPX_I_ProductionItem`
- Keys: `ManufacturingOrder`, `ManufacturingOrderItem`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. BOMs and routings need key date, engineering change, usage, alternative and selected-node resolution. Preserve alternative sequences and dependencies. Production orders are process references unless the chosen target interface explicitly supports their state; confirmations, goods movements and costs must not be reposted as master data.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `ManufacturingOrder` | AFPO-AUFNR | customer interface field: ManufacturingOrder (unconfirmed) | information only | yes |
| `ManufacturingOrderItem` | AFPO-POSNR | customer interface field: ManufacturingOrderItem (unconfirmed) | information only | yes |
| `Material` | AFPO-MATNR | customer interface field: Material (unconfirmed) | information only | yes |
| `ProductionPlant` | AFPO-DWERK | customer interface field: ProductionPlant (unconfirmed) | information only | yes |
| `PlannedQuantity` | AFPO-PSMNG | customer interface field: PlannedQuantity (unconfirmed) | information only | yes |
| `Unit` | AFPO-MEINS | customer interface field: Unit (unconfirmed) | information only | yes |

## `ZPPX_C_OrderStatusMig`

- Source: `ZPPX_I_OrderStatus`
- Keys: `ManufacturingOrder`, `StatusCode`
- Scope: `all rows`
- Delivery mode: **reference**
- Before posting: Preserve full keys and the selected parent population. Technical source IDs are references; SAP generates target IDs. Use supported SAP business interfaces; system statuses and address versions are reference data, not direct table posting payloads.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `ManufacturingOrder` | AUFK-AUFNR | - | copy |  |
| `ObjectNumber` | JEST-OBJNR | - | information only |  |
| `StatusCode` | JEST-STAT | - | copy |  |
| `StatusKind` | derived: first character of JEST-STAT | - | copy |  |
| `StatusChangeNumber` | JEST-CHGNR | - | copy |  |

## Not delivered

| View | Element | Source | Reason |
|---|---|---|---|
| `ZPPX_B_OrderStatusData` | `StatusIsInactive` | JEST-INACT | Selection predicate retains only active source statuses. |

## Reconciliation

- Counts: `ZPPX_C_ProductionOrdeMigCount` (ECC) vs `ZPPT_I_ProductionOrdeCount` (S/4HANA) per `ManufacturingOrder`
- Records and fields: `ZPPX_C_ProductionOrdeMig` vs `ZPPT_B_ProductionOrdeCompare` on `ManufacturingOrder`; compared: `ManufacturingOrderType`, `ManufacturingOrderText`, `CompanyCode`, `ProductionPlant`

```bash
python3 tools/mig_reconcile.py counts --product pp_mig_ecc --module production_order --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --product pp_mig_ecc --module production_order --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- BOMs and routings need key date, engineering change, usage, alternative and selected-node resolution. Preserve alternative sequences and dependencies. Production orders are process references unless the chosen target interface explicitly supports their state; confirmations, goods movements and costs must not be reposted as master data.
