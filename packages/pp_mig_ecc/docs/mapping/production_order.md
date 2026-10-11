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

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `ManufacturingOrder` | AUFK-AUFNR | customer interface field: ManufacturingOrder (unconfirmed) | information only |
| `ManufacturingOrderType` | AUFK-AUART | customer interface field: ManufacturingOrderType (unconfirmed) | information only |
| `OrderCategory` | AUFK-AUTYP | customer interface field: OrderCategory (unconfirmed) | information only |
| `ManufacturingOrderText` | AUFK-KTEXT | customer interface field: ManufacturingOrderText (unconfirmed) | information only |
| `CompanyCode` | AUFK-BUKRS | customer interface field: CompanyCode (unconfirmed) | information only |
| `ProductionPlant` | AUFK-WERKS | customer interface field: ProductionPlant (unconfirmed) | information only |
| `ObjectNumber` | AUFK-OBJNR | customer interface field: ObjectNumber (unconfirmed) | information only |

## `ZPPX_C_ProductionHeadMig`

- Source: `ZPPX_I_ProductionHead`
- Keys: `ManufacturingOrder`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. BOMs and routings need key date, engineering change, usage, alternative and selected-node resolution. Preserve alternative sequences and dependencies. Production orders are process references unless the chosen target interface explicitly supports their state; confirmations, goods movements and costs must not be reposted as master data.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `ManufacturingOrder` | AFKO-AUFNR | customer interface field: ManufacturingOrder (unconfirmed) | information only |
| `OperationRoutingNumber` | AFKO-AUFPL | customer interface field: OperationRoutingNumber (unconfirmed) | information only |
| `TotalQuantity` | AFKO-GAMNG | customer interface field: TotalQuantity (unconfirmed) | information only |
| `Unit` | AFKO-GMEIN | customer interface field: Unit (unconfirmed) | information only |
| `BasicStartDate` | AFKO-GSTRP | customer interface field: BasicStartDate (unconfirmed) | information only |
| `BasicEndDate` | AFKO-GLTRP | customer interface field: BasicEndDate (unconfirmed) | information only |

## `ZPPX_C_ProductionItemMig`

- Source: `ZPPX_I_ProductionItem`
- Keys: `ManufacturingOrder`, `ManufacturingOrderItem`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. BOMs and routings need key date, engineering change, usage, alternative and selected-node resolution. Preserve alternative sequences and dependencies. Production orders are process references unless the chosen target interface explicitly supports their state; confirmations, goods movements and costs must not be reposted as master data.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `ManufacturingOrder` | AFPO-AUFNR | customer interface field: ManufacturingOrder (unconfirmed) | information only |
| `ManufacturingOrderItem` | AFPO-POSNR | customer interface field: ManufacturingOrderItem (unconfirmed) | information only |
| `Material` | AFPO-MATNR | customer interface field: Material (unconfirmed) | information only |
| `ProductionPlant` | AFPO-DWERK | customer interface field: ProductionPlant (unconfirmed) | information only |
| `PlannedQuantity` | AFPO-PSMNG | customer interface field: PlannedQuantity (unconfirmed) | information only |
| `Unit` | AFPO-MEINS | customer interface field: Unit (unconfirmed) | information only |

## `ZPPX_C_OrderStatusMig`

- Source: `ZPPX_I_OrderStatus`
- Keys: `ManufacturingOrder`, `StatusCode`
- Scope: `all rows`
- Delivery mode: **reference**
- Before posting: Preserve full keys and the selected parent population. Technical source IDs are references; SAP generates target IDs. Use supported SAP business interfaces; system statuses and address versions are reference data, not direct table posting payloads.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `ManufacturingOrder` | AUFK-AUFNR | - | copy |
| `ObjectNumber` | JEST-OBJNR | - | information only |
| `StatusCode` | JEST-STAT | - | copy |
| `StatusKind` | derived: first character of JEST-STAT | - | copy |
| `StatusChangeNumber` | JEST-CHGNR | - | copy |
| `StatusProfile` | JSTO-STSMA | - | copy |

## `ZPPX_C_OrderUserStatusMig`

- Source: `ZPPX_I_OrderUserStatus`
- Keys: `ManufacturingOrder`, `StatusCode`
- Scope: `all rows`
- Delivery mode: **posting**
- Before posting: Map source profile and E* user status codes to configured target profiles/statuses. Apply through a supported post-load business operation; do not replay system statuses or write JEST/JSTO.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `ManufacturingOrder` | AUFK-AUFNR | - | copy |
| `StatusCode` | JEST-STAT | - | copy |
| `ObjectNumber` | JEST-OBJNR | - | information only |
| `StatusKind` | derived: first character of JEST-STAT | - | copy |
| `StatusChangeNumber` | JEST-CHGNR | - | copy |
| `StatusProfile` | JSTO-STSMA | - | copy |

## `ZPPX_C_OrderLongTextMig`

- Source: `ZPPX_I_OrderLongText`
- Keys: `TextObject`, `TextName`, `TextID`, `Language`
- Scope: `all rows`
- Delivery mode: **reference**
- Before posting: SAPscript index only. Populate the explicit full text-key to business-owner link file from the source text editor/application metadata, run the text_scope preparation step against selected masters, then READ_TEXT to retrieve ordered formatted lines. Never infer the business owner from a TDNAME substring or post compressed STXL data.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `TextObject` | STXH-TDOBJECT | - | copy |
| `TextName` | STXH-TDNAME | - | copy |
| `TextID` | STXH-TDID | - | copy |
| `Language` | STXH-TDSPRAS | - | copy |

## Not delivered

| View | Element | Source | Reason |
|---|---|---|---|
| `ZPPX_B_OrderStatusData` | `StatusIsInactive` | JEST-INACT | Selection predicate retains only active source statuses. |

## Source controls

- Source count view: `ZPPX_C_ProductionOrdeMigCount`

## Open gaps

- BOMs and routings need key date, engineering change, usage, alternative and selected-node resolution. Preserve alternative sequences and dependencies. Production orders are process references unless the chosen target interface explicitly supports their state; confirmations, goods movements and costs must not be reposted as master data.
