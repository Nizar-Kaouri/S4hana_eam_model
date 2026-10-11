# Migration interface: product

> Version **1.0.0**

- **Read by:** customer-selected supported posting interface; reference data is not posted
- **Load after:** - (first level)
- **Business key:** `Product` · numbering **keep**
- **Key rule:** Preserve source identifiers in an audit ledger; map regenerated internal IDs and target numbering. Never assume internal IDs survive migration.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZMMX_C_MaterialMig`

- Source: `ZMMX_I_Material`
- Keys: `Product`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Stock is a frozen, reconciled inventory population, including batch and special stock. MARD quantities alone do not establish complete inventory. Physical inventory, valuation, units and currency conversion need business sign-off. Historical goods movements are reference data. Open purchasing scope requires item status, receipts, invoices, deletion, returns and remaining quantities; it is not inferred from the header alone.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Product` | MARA-MATNR | customer interface field: Product (unconfirmed) | copy | yes |
| `ProductType` | MARA-MTART | customer interface field: ProductType (unconfirmed) | copy | yes |
| `ProductGroup` | MARA-MATKL | customer interface field: ProductGroup (unconfirmed) | copy | yes |
| `BaseUnit` | MARA-MEINS | customer interface field: BaseUnit (unconfirmed) | copy | yes |
| `GrossWeight` | MARA-BRGEW | customer interface field: GrossWeight (unconfirmed) | copy | yes |
| `NetWeight` | MARA-NTGEW | customer interface field: NetWeight (unconfirmed) | copy | yes |
| `WeightUnit` | MARA-GEWEI | customer interface field: WeightUnit (unconfirmed) | copy | yes |
| `DeletionFlag` | MARA-LVORM | customer interface field: DeletionFlag (unconfirmed) | copy | yes |

## `ZMMX_C_MaterialTextMig`

- Source: `ZMMX_I_MaterialText`
- Keys: `Product`, `Language`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Stock is a frozen, reconciled inventory population, including batch and special stock. MARD quantities alone do not establish complete inventory. Physical inventory, valuation, units and currency conversion need business sign-off. Historical goods movements are reference data. Open purchasing scope requires item status, receipts, invoices, deletion, returns and remaining quantities; it is not inferred from the header alone.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Product` | MAKT-MATNR | customer interface field: Product (unconfirmed) | copy | yes |
| `Language` | MAKT-SPRAS | customer interface field: Language (unconfirmed) | copy | yes |
| `ProductDescription` | MAKT-MAKTX | customer interface field: ProductDescription (unconfirmed) | copy | yes |

## `ZMMX_C_MaterialPlantMig`

- Source: `ZMMX_I_MaterialPlant`
- Keys: `Product`, `Plant`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Stock is a frozen, reconciled inventory population, including batch and special stock. MARD quantities alone do not establish complete inventory. Physical inventory, valuation, units and currency conversion need business sign-off. Historical goods movements are reference data. Open purchasing scope requires item status, receipts, invoices, deletion, returns and remaining quantities; it is not inferred from the header alone.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Product` | MARC-MATNR | customer interface field: Product (unconfirmed) | copy | yes |
| `Plant` | MARC-WERKS | customer interface field: Plant (unconfirmed) | copy | yes |
| `MRPType` | MARC-DISMM | customer interface field: MRPType (unconfirmed) | copy | yes |
| `MRPController` | MARC-DISPO | customer interface field: MRPController (unconfirmed) | copy | yes |
| `ProcurementType` | MARC-BESKZ | customer interface field: ProcurementType (unconfirmed) | copy | yes |
| `PurchasingGroup` | MARC-EKGRP | customer interface field: PurchasingGroup (unconfirmed) | copy | yes |
| `DeletionFlag` | MARC-LVORM | customer interface field: DeletionFlag (unconfirmed) | copy | yes |

## `ZMMX_C_MaterialLocatiMig`

- Source: `ZMMX_I_MaterialLocati`
- Keys: `Product`, `Plant`, `StorageLocation`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Stock is a frozen, reconciled inventory population, including batch and special stock. MARD quantities alone do not establish complete inventory. Physical inventory, valuation, units and currency conversion need business sign-off. Historical goods movements are reference data. Open purchasing scope requires item status, receipts, invoices, deletion, returns and remaining quantities; it is not inferred from the header alone.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Product` | MARD-MATNR | customer interface field: Product (unconfirmed) | copy | yes |
| `Plant` | MARD-WERKS | customer interface field: Plant (unconfirmed) | copy | yes |
| `StorageLocation` | MARD-LGORT | customer interface field: StorageLocation (unconfirmed) | copy | yes |
| `DeletionFlag` | MARD-LVORM | customer interface field: DeletionFlag (unconfirmed) | copy | yes |

## `ZMMX_C_MaterialUnitMig`

- Source: `ZMMX_I_MaterialUnit`
- Keys: `Product`, `AlternativeUnit`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Stock is a frozen, reconciled inventory population, including batch and special stock. MARD quantities alone do not establish complete inventory. Physical inventory, valuation, units and currency conversion need business sign-off. Historical goods movements are reference data. Open purchasing scope requires item status, receipts, invoices, deletion, returns and remaining quantities; it is not inferred from the header alone.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Product` | MARM-MATNR | customer interface field: Product (unconfirmed) | copy | yes |
| `AlternativeUnit` | MARM-MEINH | customer interface field: AlternativeUnit (unconfirmed) | copy | yes |
| `Numerator` | MARM-UMREZ | customer interface field: Numerator (unconfirmed) | copy | yes |
| `Denominator` | MARM-UMREN | customer interface field: Denominator (unconfirmed) | copy | yes |
| `InternationalArticleNumber` | MARM-EAN11 | customer interface field: InternationalArticleNumber (unconfirmed) | copy | yes |

## `ZMMX_C_MaterialValueMig`

- Source: `ZMMX_I_MaterialValue`
- Keys: `Product`, `ValuationArea`, `ValuationType`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Stock is a frozen, reconciled inventory population, including batch and special stock. MARD quantities alone do not establish complete inventory. Physical inventory, valuation, units and currency conversion need business sign-off. Historical goods movements are reference data. Open purchasing scope requires item status, receipts, invoices, deletion, returns and remaining quantities; it is not inferred from the header alone.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Product` | MBEW-MATNR | customer interface field: Product (unconfirmed) | copy | yes |
| `ValuationArea` | MBEW-BWKEY | customer interface field: ValuationArea (unconfirmed) | copy | yes |
| `ValuationType` | MBEW-BWTAR | customer interface field: ValuationType (unconfirmed) | copy | yes |
| `ValuationClass` | MBEW-BKLAS | customer interface field: ValuationClass (unconfirmed) | copy | yes |
| `PriceControl` | MBEW-VPRSV | customer interface field: PriceControl (unconfirmed) | copy | yes |
| `StandardPrice` | MBEW-STPRS | customer interface field: StandardPrice (unconfirmed) | copy | yes |
| `MovingAveragePrice` | MBEW-VERPR | customer interface field: MovingAveragePrice (unconfirmed) | copy | yes |
| `PriceUnit` | MBEW-PEINH | customer interface field: PriceUnit (unconfirmed) | copy | yes |

## `ZMMX_C_BatchGeneralMig`

- Source: `ZMMX_I_BatchGeneral`
- Keys: `Product`, `Batch`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Stock is a frozen, reconciled inventory population, including batch and special stock. MARD quantities alone do not establish complete inventory. Physical inventory, valuation, units and currency conversion need business sign-off. Historical goods movements are reference data. Open purchasing scope requires item status, receipts, invoices, deletion, returns and remaining quantities; it is not inferred from the header alone.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Product` | MCH1-MATNR | customer interface field: Product (unconfirmed) | copy | yes |
| `Batch` | MCH1-CHARG | customer interface field: Batch (unconfirmed) | copy | yes |
| `ManufactureDate` | MCH1-HSDAT | customer interface field: ManufactureDate (unconfirmed) | copy | yes |
| `ExpirationDate` | MCH1-VFDAT | customer interface field: ExpirationDate (unconfirmed) | copy | yes |

## `ZMMX_C_BatchPlantMig`

- Source: `ZMMX_I_BatchPlant`
- Keys: `Product`, `Plant`, `Batch`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Stock is a frozen, reconciled inventory population, including batch and special stock. MARD quantities alone do not establish complete inventory. Physical inventory, valuation, units and currency conversion need business sign-off. Historical goods movements are reference data. Open purchasing scope requires item status, receipts, invoices, deletion, returns and remaining quantities; it is not inferred from the header alone.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Product` | MCHA-MATNR | customer interface field: Product (unconfirmed) | copy | yes |
| `Plant` | MCHA-WERKS | customer interface field: Plant (unconfirmed) | copy | yes |
| `Batch` | MCHA-CHARG | customer interface field: Batch (unconfirmed) | copy | yes |
| `ManufactureDate` | MCHA-HSDAT | customer interface field: ManufactureDate (unconfirmed) | copy | yes |
| `ExpirationDate` | MCHA-VFDAT | customer interface field: ExpirationDate (unconfirmed) | copy | yes |

## Reconciliation

- Counts: `ZMMX_C_MaterialMigCount` (ECC) vs `ZMMT_I_MaterialCount` (S/4HANA) per `Product`
- Records and fields: `ZMMX_C_MaterialMig` vs `ZMMT_B_MaterialCompare` on `Product`; compared: `ProductType`, `ProductGroup`, `BaseUnit`, `GrossWeight`, `NetWeight`, `WeightUnit`

```bash
python3 tools/mig_reconcile.py counts --product mm_mig_ecc --module product --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --product mm_mig_ecc --module product --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- Stock is a frozen, reconciled inventory population, including batch and special stock. MARD quantities alone do not establish complete inventory. Physical inventory, valuation, units and currency conversion need business sign-off. Historical goods movements are reference data. Open purchasing scope requires item status, receipts, invoices, deletion, returns and remaining quantities; it is not inferred from the header alone.
