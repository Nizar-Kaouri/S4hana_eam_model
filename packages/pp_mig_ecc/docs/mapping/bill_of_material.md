# Migration interface: bill_of_material

> Version **1.0.0**

- **Read by:** customer-selected supported posting interface; reference data is not posted
- **Load after:** - (first level)
- **Business key:** `Material`, `Plant`, `BillOfMaterialUsage`, `BillOfMaterial`, `BillOfMaterialVariant` · numbering **keep**
- **Key rule:** Preserve source identifiers in an audit ledger; map regenerated internal IDs and target numbering. Never assume internal IDs survive migration.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZPPX_C_MaterialBOMMig`

- Source: `ZPPX_I_MaterialBOM`
- Keys: `Material`, `Plant`, `BillOfMaterialUsage`, `BillOfMaterial`, `BillOfMaterialVariant`
- Scope: `all rows`
- Delivery mode: **effectivity-reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. BOMs and routings need key date, engineering change, usage, alternative and selected-node resolution. Preserve alternative sequences and dependencies. Production orders are process references unless the chosen target interface explicitly supports their state; confirmations, goods movements and costs must not be reposted as master data.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `Material` | MAST-MATNR | customer interface field: Material (unconfirmed) | information only |
| `Plant` | MAST-WERKS | customer interface field: Plant (unconfirmed) | information only |
| `BillOfMaterialUsage` | MAST-STLAN | customer interface field: BillOfMaterialUsage (unconfirmed) | information only |
| `BillOfMaterial` | MAST-STLNR | customer interface field: BillOfMaterial (unconfirmed) | information only |
| `BillOfMaterialVariant` | MAST-STLAL | customer interface field: BillOfMaterialVariant (unconfirmed) | information only |
| `LotSizeFrom` | MAST-LOSVN | customer interface field: LotSizeFrom (unconfirmed) | information only |
| `LotSizeTo` | MAST-LOSBS | customer interface field: LotSizeTo (unconfirmed) | information only |

## `ZPPX_C_BOMHeaderMig`

- Source: `ZPPX_I_BOMHeader`
- Keys: `BOMCategory`, `BillOfMaterial`, `BillOfMaterialVariant`, `InternalCounter`
- Scope: `all rows`
- Delivery mode: **effectivity-reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. BOMs and routings need key date, engineering change, usage, alternative and selected-node resolution. Preserve alternative sequences and dependencies. Production orders are process references unless the chosen target interface explicitly supports their state; confirmations, goods movements and costs must not be reposted as master data.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `BOMCategory` | STKO-STLTY | customer interface field: BOMCategory (unconfirmed) | information only |
| `BillOfMaterial` | STKO-STLNR | customer interface field: BillOfMaterial (unconfirmed) | information only |
| `BillOfMaterialVariant` | STKO-STLAL | customer interface field: BillOfMaterialVariant (unconfirmed) | information only |
| `InternalCounter` | STKO-STKOZ | customer interface field: InternalCounter (unconfirmed) | information only |
| `ValidFromDate` | STKO-DATUV | customer interface field: ValidFromDate (unconfirmed) | information only |
| `ChangeNumber` | STKO-AENNR | customer interface field: ChangeNumber (unconfirmed) | information only |
| `DeletionFlag` | STKO-LKENZ | customer interface field: DeletionFlag (unconfirmed) | information only |
| `BaseQuantity` | STKO-BMENG | customer interface field: BaseQuantity (unconfirmed) | information only |
| `BaseUnit` | STKO-BMEIN | customer interface field: BaseUnit (unconfirmed) | information only |

## `ZPPX_C_BOMSelectionMig`

- Source: `ZPPX_I_BOMSelection`
- Keys: `BOMCategory`, `BillOfMaterial`, `BillOfMaterialVariant`, `BOMNode`, `InternalCounter`
- Scope: `all rows`
- Delivery mode: **effectivity-reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. BOMs and routings need key date, engineering change, usage, alternative and selected-node resolution. Preserve alternative sequences and dependencies. Production orders are process references unless the chosen target interface explicitly supports their state; confirmations, goods movements and costs must not be reposted as master data.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `BOMCategory` | STAS-STLTY | customer interface field: BOMCategory (unconfirmed) | information only |
| `BillOfMaterial` | STAS-STLNR | customer interface field: BillOfMaterial (unconfirmed) | information only |
| `BillOfMaterialVariant` | STAS-STLAL | customer interface field: BillOfMaterialVariant (unconfirmed) | information only |
| `BOMNode` | STAS-STLKN | customer interface field: BOMNode (unconfirmed) | information only |
| `InternalCounter` | STAS-STASZ | customer interface field: InternalCounter (unconfirmed) | information only |
| `ValidFromDate` | STAS-DATUV | customer interface field: ValidFromDate (unconfirmed) | information only |
| `ChangeNumber` | STAS-AENNR | customer interface field: ChangeNumber (unconfirmed) | information only |
| `DeletionFlag` | STAS-LKENZ | customer interface field: DeletionFlag (unconfirmed) | information only |

## `ZPPX_C_BOMItemMig`

- Source: `ZPPX_I_BOMItem`
- Keys: `BOMCategory`, `BillOfMaterial`, `BOMNode`, `InternalCounter`
- Scope: `all rows`
- Delivery mode: **effectivity-reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. BOMs and routings need key date, engineering change, usage, alternative and selected-node resolution. Preserve alternative sequences and dependencies. Production orders are process references unless the chosen target interface explicitly supports their state; confirmations, goods movements and costs must not be reposted as master data.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `BOMCategory` | STPO-STLTY | customer interface field: BOMCategory (unconfirmed) | information only |
| `BillOfMaterial` | STPO-STLNR | customer interface field: BillOfMaterial (unconfirmed) | information only |
| `BOMNode` | STPO-STLKN | customer interface field: BOMNode (unconfirmed) | information only |
| `InternalCounter` | STPO-STPOZ | customer interface field: InternalCounter (unconfirmed) | information only |
| `ValidFromDate` | STPO-DATUV | customer interface field: ValidFromDate (unconfirmed) | information only |
| `ChangeNumber` | STPO-AENNR | customer interface field: ChangeNumber (unconfirmed) | information only |
| `DeletionFlag` | STPO-LKENZ | customer interface field: DeletionFlag (unconfirmed) | information only |
| `Component` | STPO-IDNRK | customer interface field: Component (unconfirmed) | information only |
| `ItemNumber` | STPO-POSNR | customer interface field: ItemNumber (unconfirmed) | information only |
| `ComponentQuantity` | STPO-MENGE | customer interface field: ComponentQuantity (unconfirmed) | information only |
| `Unit` | STPO-MEINS | customer interface field: Unit (unconfirmed) | information only |

## `ZPPX_C_BOMLongTextMig`

- Source: `ZPPX_I_BOMLongText`
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

## Source controls

- Source count view: `ZPPX_C_MaterialBOMMigCount`

## Open gaps

- BOMs and routings need key date, engineering change, usage, alternative and selected-node resolution. Preserve alternative sequences and dependencies. Production orders are process references unless the chosen target interface explicitly supports their state; confirmations, goods movements and costs must not be reposted as master data.
