# Migration interface: bill_of_material

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been run on a system.

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

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Material` | MAST-MATNR | customer interface field: Material (unconfirmed) | information only | yes |
| `Plant` | MAST-WERKS | customer interface field: Plant (unconfirmed) | information only | yes |
| `BillOfMaterialUsage` | MAST-STLAN | customer interface field: BillOfMaterialUsage (unconfirmed) | information only | yes |
| `BillOfMaterial` | MAST-STLNR | customer interface field: BillOfMaterial (unconfirmed) | information only | yes |
| `BillOfMaterialVariant` | MAST-STLAL | customer interface field: BillOfMaterialVariant (unconfirmed) | information only | yes |
| `LotSizeFrom` | MAST-LOSVN | customer interface field: LotSizeFrom (unconfirmed) | information only | yes |
| `LotSizeTo` | MAST-LOSBS | customer interface field: LotSizeTo (unconfirmed) | information only | yes |

## `ZPPX_C_BOMHeaderMig`

- Source: `ZPPX_I_BOMHeader`
- Keys: `BOMCategory`, `BillOfMaterial`, `BillOfMaterialVariant`, `InternalCounter`
- Scope: `all rows`
- Delivery mode: **effectivity-reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. BOMs and routings need key date, engineering change, usage, alternative and selected-node resolution. Preserve alternative sequences and dependencies. Production orders are process references unless the chosen target interface explicitly supports their state; confirmations, goods movements and costs must not be reposted as master data.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `BOMCategory` | STKO-STLTY | customer interface field: BOMCategory (unconfirmed) | information only | yes |
| `BillOfMaterial` | STKO-STLNR | customer interface field: BillOfMaterial (unconfirmed) | information only | yes |
| `BillOfMaterialVariant` | STKO-STLAL | customer interface field: BillOfMaterialVariant (unconfirmed) | information only | yes |
| `InternalCounter` | STKO-STKOZ | customer interface field: InternalCounter (unconfirmed) | information only | yes |
| `ValidFromDate` | STKO-DATUV | customer interface field: ValidFromDate (unconfirmed) | information only | yes |
| `ChangeNumber` | STKO-AENNR | customer interface field: ChangeNumber (unconfirmed) | information only | yes |
| `DeletionFlag` | STKO-LKENZ | customer interface field: DeletionFlag (unconfirmed) | information only | yes |
| `BaseQuantity` | STKO-BMENG | customer interface field: BaseQuantity (unconfirmed) | information only | yes |
| `BaseUnit` | STKO-BMEIN | customer interface field: BaseUnit (unconfirmed) | information only | yes |

## `ZPPX_C_BOMSelectionMig`

- Source: `ZPPX_I_BOMSelection`
- Keys: `BOMCategory`, `BillOfMaterial`, `BillOfMaterialVariant`, `BOMNode`, `InternalCounter`
- Scope: `all rows`
- Delivery mode: **effectivity-reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. BOMs and routings need key date, engineering change, usage, alternative and selected-node resolution. Preserve alternative sequences and dependencies. Production orders are process references unless the chosen target interface explicitly supports their state; confirmations, goods movements and costs must not be reposted as master data.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `BOMCategory` | STAS-STLTY | customer interface field: BOMCategory (unconfirmed) | information only | yes |
| `BillOfMaterial` | STAS-STLNR | customer interface field: BillOfMaterial (unconfirmed) | information only | yes |
| `BillOfMaterialVariant` | STAS-STLAL | customer interface field: BillOfMaterialVariant (unconfirmed) | information only | yes |
| `BOMNode` | STAS-STLKN | customer interface field: BOMNode (unconfirmed) | information only | yes |
| `InternalCounter` | STAS-STASZ | customer interface field: InternalCounter (unconfirmed) | information only | yes |
| `ValidFromDate` | STAS-DATUV | customer interface field: ValidFromDate (unconfirmed) | information only | yes |
| `ChangeNumber` | STAS-AENNR | customer interface field: ChangeNumber (unconfirmed) | information only | yes |
| `DeletionFlag` | STAS-LKENZ | customer interface field: DeletionFlag (unconfirmed) | information only | yes |

## `ZPPX_C_BOMItemMig`

- Source: `ZPPX_I_BOMItem`
- Keys: `BOMCategory`, `BillOfMaterial`, `BOMNode`, `InternalCounter`
- Scope: `all rows`
- Delivery mode: **effectivity-reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. BOMs and routings need key date, engineering change, usage, alternative and selected-node resolution. Preserve alternative sequences and dependencies. Production orders are process references unless the chosen target interface explicitly supports their state; confirmations, goods movements and costs must not be reposted as master data.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `BOMCategory` | STPO-STLTY | customer interface field: BOMCategory (unconfirmed) | information only | yes |
| `BillOfMaterial` | STPO-STLNR | customer interface field: BillOfMaterial (unconfirmed) | information only | yes |
| `BOMNode` | STPO-STLKN | customer interface field: BOMNode (unconfirmed) | information only | yes |
| `InternalCounter` | STPO-STPOZ | customer interface field: InternalCounter (unconfirmed) | information only | yes |
| `ValidFromDate` | STPO-DATUV | customer interface field: ValidFromDate (unconfirmed) | information only | yes |
| `ChangeNumber` | STPO-AENNR | customer interface field: ChangeNumber (unconfirmed) | information only | yes |
| `DeletionFlag` | STPO-LKENZ | customer interface field: DeletionFlag (unconfirmed) | information only | yes |
| `Component` | STPO-IDNRK | customer interface field: Component (unconfirmed) | information only | yes |
| `ItemNumber` | STPO-POSNR | customer interface field: ItemNumber (unconfirmed) | information only | yes |
| `ComponentQuantity` | STPO-MENGE | customer interface field: ComponentQuantity (unconfirmed) | information only | yes |
| `Unit` | STPO-MEINS | customer interface field: Unit (unconfirmed) | information only | yes |

## Reconciliation

- Counts: `ZPPX_C_MaterialBOMMigCount` (ECC) vs `-` (S/4HANA) per `Material`

```bash
python3 tools/mig_reconcile.py counts --product pp_mig_ecc --module bill_of_material --source ecc_counts.csv --target s4_counts.csv
```

## Open gaps

- BOMs and routings need key date, engineering change, usage, alternative and selected-node resolution. Preserve alternative sequences and dependencies. Production orders are process references unless the chosen target interface explicitly supports their state; confirmations, goods movements and costs must not be reposted as master data.
