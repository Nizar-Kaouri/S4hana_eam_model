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
| `IndustrySector` | MARA-MBRSH | - | copy |  |
| `Division` | MARA-SPART | - | copy |  |
| `OldMaterialNumber` | MARA-BISMT | - | copy |  |
| `ExternalProductGroup` | MARA-EXTWG | - | copy |  |
| `CrossPlantMaterialStatus` | MARA-MSTAE | - | copy |  |
| `MaterialStatusValidFrom` | MARA-MSTDE | - | copy |  |
| `BatchManagementRequired` | MARA-XCHPF | - | copy |  |

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
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Stock is a frozen, reconciled inventory population, including batch and special stock. MARD quantities alone do not establish complete inventory. Physical inventory, valuation, units and currency conversion need business sign-off. Historical goods movements are reference data. Open purchasing scope requires item status, receipts, invoices, deletion, returns and remaining quantities; it is not inferred from the header alone. Safety stock and lot-size quantities use the selected material base unit from C_MaterialMig; processing/delivery times are days.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Product` | MARC-MATNR | customer interface field: Product (unconfirmed) | copy | yes |
| `Plant` | MARC-WERKS | customer interface field: Plant (unconfirmed) | copy | yes |
| `MRPType` | MARC-DISMM | customer interface field: MRPType (unconfirmed) | copy | yes |
| `MRPController` | MARC-DISPO | customer interface field: MRPController (unconfirmed) | copy | yes |
| `ProcurementType` | MARC-BESKZ | customer interface field: ProcurementType (unconfirmed) | copy | yes |
| `PurchasingGroup` | MARC-EKGRP | customer interface field: PurchasingGroup (unconfirmed) | copy | yes |
| `DeletionFlag` | MARC-LVORM | customer interface field: DeletionFlag (unconfirmed) | copy | yes |
| `MRPGroup` | MARC-DISGR | - | copy |  |
| `LotSizingProcedure` | MARC-DISLS | - | copy |  |
| `SpecialProcurementType` | MARC-SOBSL | - | copy |  |
| `AvailabilityCheck` | MARC-MTVFP | - | copy |  |
| `SafetyStock` | MARC-EISBE | - | copy |  |
| `MinimumLotSize` | MARC-BSTMI | - | copy |  |
| `MaximumLotSize` | MARC-BSTMA | - | copy |  |
| `FixedLotSize` | MARC-BSTFE | - | copy |  |
| `PlannedDeliveryTime` | MARC-PLIFZ | - | copy |  |
| `GoodsReceiptProcessingTime` | MARC-WEBAZ | - | copy |  |
| `InHouseProductionTime` | MARC-DZEIT | - | copy |  |
| `IssueStorageLocation` | MARC-LGPRO | - | copy |  |
| `ExternalProcStorageLocation` | MARC-LGFSB | - | copy |  |
| `SerialNumberProfile` | MARC-SERNP | - | copy |  |
| `BatchManagementRequired` | MARC-XCHPF | - | copy |  |

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

## `ZMMX_C_MaterialSalesMig`

- Source: `ZMMX_I_MaterialSales`
- Keys: `Product`, `SalesOrganization`, `DistributionChannel`
- Scope: `all rows`
- Delivery mode: **posting**
- Before posting: Preserve full keys and the selected parent population. Technical source IDs are references; SAP generates target IDs. Use supported SAP business interfaces; system statuses and address versions are reference data, not direct table posting payloads.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Product` | MVKE-MATNR | - | copy |  |
| `SalesOrganization` | MVKE-VKORG | - | copy |  |
| `DistributionChannel` | MVKE-VTWEG | - | copy |  |
| `SalesUnit` | MVKE-VRKME | - | copy |  |
| `DeliveringPlant` | MVKE-DWERK | - | copy |  |
| `SalesStatus` | MVKE-VMSTA | - | copy |  |
| `SalesStatusValidFrom` | MVKE-VMSTD | - | copy |  |
| `ItemCategoryGroup` | MVKE-MTPOS | - | copy |  |
| `AccountAssignmentGroup` | MVKE-KTGRM | - | copy |  |
| `DeletionFlag` | MVKE-LVORM | - | copy |  |

## `ZMMX_C_MaterialTaxMig`

- Source: `ZMMX_I_MaterialTax`
- Keys: `Product`, `DepartureCountry`
- Scope: `all rows`
- Delivery mode: **posting**
- Before posting: Preserve full keys and the selected parent population. Technical source IDs are references; SAP generates target IDs. Use supported SAP business interfaces; system statuses and address versions are reference data, not direct table posting payloads.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Product` | MLAN-MATNR | - | copy |  |
| `DepartureCountry` | MLAN-ALAND | - | copy |  |
| `TaxClassification1` | MLAN-TAXM1 | - | copy |  |
| `TaxClassification2` | MLAN-TAXM2 | - | copy |  |
| `TaxClassification3` | MLAN-TAXM3 | - | copy |  |
| `TaxClassification4` | MLAN-TAXM4 | - | copy |  |
| `TaxClassification5` | MLAN-TAXM5 | - | copy |  |
| `TaxClassification6` | MLAN-TAXM6 | - | copy |  |
| `TaxClassification7` | MLAN-TAXM7 | - | copy |  |
| `TaxClassification8` | MLAN-TAXM8 | - | copy |  |
| `TaxClassification9` | MLAN-TAXM9 | - | copy |  |

## `ZMMX_C_MaterialMRPAreaMig`

- Source: `ZMMX_I_MaterialMRPArea`
- Keys: `Product`, `MRPArea`
- Scope: `all rows`
- Delivery mode: **posting**
- Before posting: Preserve full keys and the selected parent population. Technical source IDs are references; SAP generates target IDs. Use supported SAP business interfaces; system statuses and address versions are reference data, not direct table posting payloads.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Product` | MDMA-MATNR | - | copy |  |
| `MRPArea` | MDMA-BERID | - | copy |  |
| `MRPType` | MDMA-DISMM | - | copy |  |
| `MRPController` | MDMA-DISPO | - | copy |  |
| `LotSizingProcedure` | MDMA-DISLS | - | copy |  |
| `SpecialProcurementType` | MDMA-SOBSL | - | copy |  |
| `DeletionFlag` | MDMA-LOEKZ | - | copy |  |

## `ZMMX_C_MaterialEANMig`

- Source: `ZMMX_I_MaterialEAN`
- Keys: `Product`, `AlternativeUnit`, `EANCounter`
- Scope: `all rows`
- Delivery mode: **posting**
- Before posting: Preserve full keys and the selected parent population. Technical source IDs are references; SAP generates target IDs. Use supported SAP business interfaces; system statuses and address versions are reference data, not direct table posting payloads.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Product` | MEAN-MATNR | - | copy |  |
| `AlternativeUnit` | MEAN-MEINH | - | copy |  |
| `EANCounter` | MEAN-LFNUM | - | copy |  |
| `EAN` | MEAN-EAN11 | - | copy |  |
| `EANCategory` | MEAN-EANTP | - | copy |  |
| `MainEAN` | MEAN-HPEAN | - | copy |  |

## `ZMMX_C_MaterialLongTextMig`

- Source: `ZMMX_I_MaterialLongText`
- Keys: `TextObject`, `TextName`, `TextID`, `Language`
- Scope: `all rows`
- Delivery mode: **reference**
- Before posting: SAPscript index only. Populate the explicit full text-key to business-owner link file from the source text editor/application metadata, run the text_scope preparation step against selected masters, then READ_TEXT to retrieve ordered formatted lines. Never infer the business owner from a TDNAME substring or post compressed STXL data.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `TextObject` | STXH-TDOBJECT | - | copy |  |
| `TextName` | STXH-TDNAME | - | copy |  |
| `TextID` | STXH-TDID | - | copy |  |
| `Language` | STXH-TDSPRAS | - | copy |  |

## `ZMMX_C_ClassObjectMig`

- Source: `ZMMX_I_ClassObject`
- Keys: `ClassificationInternalID`
- Scope: `all rows`
- Delivery mode: **reference**
- Before posting: Preserve full keys and the selected parent population. Technical source IDs are references; SAP generates target IDs. Use supported SAP business interfaces; system statuses and address versions are reference data, not direct table posting payloads.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `ClassificationInternalID` | INOB-CUOBJ | - | copy |  |
| `ClassType` | INOB-KLART | - | copy |  |
| `ObjectTable` | INOB-OBTAB | - | copy |  |
| `ClassifiedObject` | INOB-OBJEK | - | copy |  |

## `ZMMX_C_MaterialClassMig`

- Source: `ZMMX_I_MaterialClass`
- Keys: `ClassifiedObject`, `ClassType`, `Class`
- Scope: `all rows`
- Delivery mode: **posting**
- Before posting: Preserve complete native classification/ECM keys. Use the explicit full-key business-owner link file and INOB where the class type uses internal CUOBJ; do not assume OBJEK equals MATNR or concatenate an external batch label. Resolve class/characteristic names and target object IDs; evaluate source ECM effectivity before posting through supported classification interfaces.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `ClassifiedObject` | KSSK-OBJEK | - | copy |  |
| `ClassType` | KSSK-KLART | - | copy |  |
| `Class` | KLAH-CLASS | - | copy |  |
| `ClassificationStatus` | KSSK-STATU | - | copy |  |

## `ZMMX_C_BatchClassMig`

- Source: `ZMMX_I_BatchClass`
- Keys: `ClassifiedObject`, `ClassType`, `Class`
- Scope: `all rows`
- Delivery mode: **posting**
- Before posting: Preserve complete native classification/ECM keys. Use the explicit full-key business-owner link file and INOB where the class type uses internal CUOBJ; do not assume OBJEK equals MATNR or concatenate an external batch label. Resolve class/characteristic names and target object IDs; evaluate source ECM effectivity before posting through supported classification interfaces.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `ClassifiedObject` | KSSK-OBJEK | - | copy |  |
| `ClassType` | KSSK-KLART | - | copy |  |
| `Class` | KLAH-CLASS | - | copy |  |
| `ClassificationStatus` | KSSK-STATU | - | copy |  |

## `ZMMX_C_MaterialCharcMig`

- Source: `ZMMX_I_MaterialCharc`
- Keys: `ClassifiedObject`, `ClassType`, `Characteristic`, `CharcValuePositionNumber`
- Scope: `all rows`
- Delivery mode: **posting**
- Before posting: Preserve complete native classification/ECM keys. Use the explicit full-key business-owner link file and INOB where the class type uses internal CUOBJ; do not assume OBJEK equals MATNR or concatenate an external batch label. Resolve class/characteristic names and target object IDs; evaluate source ECM effectivity before posting through supported classification interfaces.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `ClassifiedObject` | AUSP-OBJEK | - | copy |  |
| `ClassType` | AUSP-KLART | - | copy |  |
| `Characteristic` | CABN-ATNAM | - | copy |  |
| `CharcValuePositionNumber` | AUSP-ATZHL | - | copy |  |
| `CharcValue` | AUSP-ATWRT | - | copy |  |
| `CharcFromNumericValue` | AUSP-ATFLV | - | copy |  |
| `CharcToNumericValue` | AUSP-ATFLB | - | copy |  |
| `CharcValueDependency` | AUSP-ATCOD | - | copy |  |

## `ZMMX_C_BatchCharcMig`

- Source: `ZMMX_I_BatchCharc`
- Keys: `ClassifiedObject`, `ClassType`, `Characteristic`, `CharcValuePositionNumber`
- Scope: `all rows`
- Delivery mode: **posting**
- Before posting: Preserve complete native classification/ECM keys. Use the explicit full-key business-owner link file and INOB where the class type uses internal CUOBJ; do not assume OBJEK equals MATNR or concatenate an external batch label. Resolve class/characteristic names and target object IDs; evaluate source ECM effectivity before posting through supported classification interfaces.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `ClassifiedObject` | AUSP-OBJEK | - | copy |  |
| `ClassType` | AUSP-KLART | - | copy |  |
| `Characteristic` | CABN-ATNAM | - | copy |  |
| `CharcValuePositionNumber` | AUSP-ATZHL | - | copy |  |
| `CharcValue` | AUSP-ATWRT | - | copy |  |
| `CharcFromNumericValue` | AUSP-ATFLV | - | copy |  |
| `CharcToNumericValue` | AUSP-ATFLB | - | copy |  |
| `CharcValueDependency` | AUSP-ATCOD | - | copy |  |

## Reconciliation

- Counts: `ZMMX_C_MaterialMigCount` (ECC) vs `ZMMT_I_MaterialCount` (S/4HANA) per `Product`
- Records and fields: `ZMMX_C_MaterialMig` vs `ZMMT_B_MaterialCompare` on `Product`; compared: `ProductType`, `ProductGroup`, `BaseUnit`, `GrossWeight`, `NetWeight`, `WeightUnit`

```bash
python3 tools/mig_reconcile.py counts --product mm_mig_ecc --module product --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --product mm_mig_ecc --module product --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- Stock is a frozen, reconciled inventory population, including batch and special stock. MARD quantities alone do not establish complete inventory. Physical inventory, valuation, units and currency conversion need business sign-off. Historical goods movements are reference data. Open purchasing scope requires item status, receipts, invoices, deletion, returns and remaining quantities; it is not inferred from the header alone.
