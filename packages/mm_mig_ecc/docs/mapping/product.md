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

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `Product` | MARA-MATNR | customer interface field: Product (unconfirmed) | copy |
| `ProductType` | MARA-MTART | customer interface field: ProductType (unconfirmed) | copy |
| `ProductGroup` | MARA-MATKL | customer interface field: ProductGroup (unconfirmed) | copy |
| `BaseUnit` | MARA-MEINS | customer interface field: BaseUnit (unconfirmed) | copy |
| `GrossWeight` | MARA-BRGEW | customer interface field: GrossWeight (unconfirmed) | copy |
| `NetWeight` | MARA-NTGEW | customer interface field: NetWeight (unconfirmed) | copy |
| `WeightUnit` | MARA-GEWEI | customer interface field: WeightUnit (unconfirmed) | copy |
| `DeletionFlag` | MARA-LVORM | customer interface field: DeletionFlag (unconfirmed) | copy |
| `IndustrySector` | MARA-MBRSH | - | copy |
| `Division` | MARA-SPART | - | copy |
| `OldMaterialNumber` | MARA-BISMT | - | copy |
| `ExternalProductGroup` | MARA-EXTWG | - | copy |
| `CrossPlantMaterialStatus` | MARA-MSTAE | - | copy |
| `MaterialStatusValidFrom` | MARA-MSTDE | - | copy |
| `BatchManagementRequired` | MARA-XCHPF | - | copy |

## `ZMMX_C_MaterialTextMig`

- Source: `ZMMX_I_MaterialText`
- Keys: `Product`, `Language`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Stock is a frozen, reconciled inventory population, including batch and special stock. MARD quantities alone do not establish complete inventory. Physical inventory, valuation, units and currency conversion need business sign-off. Historical goods movements are reference data. Open purchasing scope requires item status, receipts, invoices, deletion, returns and remaining quantities; it is not inferred from the header alone.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `Product` | MAKT-MATNR | customer interface field: Product (unconfirmed) | copy |
| `Language` | MAKT-SPRAS | customer interface field: Language (unconfirmed) | copy |
| `ProductDescription` | MAKT-MAKTX | customer interface field: ProductDescription (unconfirmed) | copy |

## `ZMMX_C_MaterialPlantMig`

- Source: `ZMMX_I_MaterialPlant`
- Keys: `Product`, `Plant`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Stock is a frozen, reconciled inventory population, including batch and special stock. MARD quantities alone do not establish complete inventory. Physical inventory, valuation, units and currency conversion need business sign-off. Historical goods movements are reference data. Open purchasing scope requires item status, receipts, invoices, deletion, returns and remaining quantities; it is not inferred from the header alone. Safety stock and lot-size quantities use the selected material base unit from C_MaterialMig; processing/delivery times are days.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `Product` | MARC-MATNR | customer interface field: Product (unconfirmed) | copy |
| `Plant` | MARC-WERKS | customer interface field: Plant (unconfirmed) | copy |
| `MRPType` | MARC-DISMM | customer interface field: MRPType (unconfirmed) | copy |
| `MRPController` | MARC-DISPO | customer interface field: MRPController (unconfirmed) | copy |
| `ProcurementType` | MARC-BESKZ | customer interface field: ProcurementType (unconfirmed) | copy |
| `PurchasingGroup` | MARC-EKGRP | customer interface field: PurchasingGroup (unconfirmed) | copy |
| `DeletionFlag` | MARC-LVORM | customer interface field: DeletionFlag (unconfirmed) | copy |
| `MRPGroup` | MARC-DISGR | - | copy |
| `LotSizingProcedure` | MARC-DISLS | - | copy |
| `SpecialProcurementType` | MARC-SOBSL | - | copy |
| `AvailabilityCheck` | MARC-MTVFP | - | copy |
| `SafetyStock` | MARC-EISBE | - | copy |
| `MinimumLotSize` | MARC-BSTMI | - | copy |
| `MaximumLotSize` | MARC-BSTMA | - | copy |
| `FixedLotSize` | MARC-BSTFE | - | copy |
| `PlannedDeliveryTime` | MARC-PLIFZ | - | copy |
| `GoodsReceiptProcessingTime` | MARC-WEBAZ | - | copy |
| `InHouseProductionTime` | MARC-DZEIT | - | copy |
| `IssueStorageLocation` | MARC-LGPRO | - | copy |
| `ExternalProcStorageLocation` | MARC-LGFSB | - | copy |
| `SerialNumberProfile` | MARC-SERNP | - | copy |
| `BatchManagementRequired` | MARC-XCHPF | - | copy |

## `ZMMX_C_MaterialLocatiMig`

- Source: `ZMMX_I_MaterialLocati`
- Keys: `Product`, `Plant`, `StorageLocation`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Stock is a frozen, reconciled inventory population, including batch and special stock. MARD quantities alone do not establish complete inventory. Physical inventory, valuation, units and currency conversion need business sign-off. Historical goods movements are reference data. Open purchasing scope requires item status, receipts, invoices, deletion, returns and remaining quantities; it is not inferred from the header alone.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `Product` | MARD-MATNR | customer interface field: Product (unconfirmed) | copy |
| `Plant` | MARD-WERKS | customer interface field: Plant (unconfirmed) | copy |
| `StorageLocation` | MARD-LGORT | customer interface field: StorageLocation (unconfirmed) | copy |
| `DeletionFlag` | MARD-LVORM | customer interface field: DeletionFlag (unconfirmed) | copy |

## `ZMMX_C_MaterialUnitMig`

- Source: `ZMMX_I_MaterialUnit`
- Keys: `Product`, `AlternativeUnit`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Stock is a frozen, reconciled inventory population, including batch and special stock. MARD quantities alone do not establish complete inventory. Physical inventory, valuation, units and currency conversion need business sign-off. Historical goods movements are reference data. Open purchasing scope requires item status, receipts, invoices, deletion, returns and remaining quantities; it is not inferred from the header alone.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `Product` | MARM-MATNR | customer interface field: Product (unconfirmed) | copy |
| `AlternativeUnit` | MARM-MEINH | customer interface field: AlternativeUnit (unconfirmed) | copy |
| `Numerator` | MARM-UMREZ | customer interface field: Numerator (unconfirmed) | copy |
| `Denominator` | MARM-UMREN | customer interface field: Denominator (unconfirmed) | copy |
| `InternationalArticleNumber` | MARM-EAN11 | customer interface field: InternationalArticleNumber (unconfirmed) | copy |

## `ZMMX_C_MaterialValueMig`

- Source: `ZMMX_I_MaterialValue`
- Keys: `Product`, `ValuationArea`, `ValuationType`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Stock is a frozen, reconciled inventory population, including batch and special stock. MARD quantities alone do not establish complete inventory. Physical inventory, valuation, units and currency conversion need business sign-off. Historical goods movements are reference data. Open purchasing scope requires item status, receipts, invoices, deletion, returns and remaining quantities; it is not inferred from the header alone.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `Product` | MBEW-MATNR | customer interface field: Product (unconfirmed) | copy |
| `ValuationArea` | MBEW-BWKEY | customer interface field: ValuationArea (unconfirmed) | copy |
| `ValuationType` | MBEW-BWTAR | customer interface field: ValuationType (unconfirmed) | copy |
| `ValuationClass` | MBEW-BKLAS | customer interface field: ValuationClass (unconfirmed) | copy |
| `PriceControl` | MBEW-VPRSV | customer interface field: PriceControl (unconfirmed) | copy |
| `StandardPrice` | MBEW-STPRS | customer interface field: StandardPrice (unconfirmed) | copy |
| `MovingAveragePrice` | MBEW-VERPR | customer interface field: MovingAveragePrice (unconfirmed) | copy |
| `PriceUnit` | MBEW-PEINH | customer interface field: PriceUnit (unconfirmed) | copy |

## `ZMMX_C_BatchGeneralMig`

- Source: `ZMMX_I_BatchGeneral`
- Keys: `Product`, `Batch`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Stock is a frozen, reconciled inventory population, including batch and special stock. MARD quantities alone do not establish complete inventory. Physical inventory, valuation, units and currency conversion need business sign-off. Historical goods movements are reference data. Open purchasing scope requires item status, receipts, invoices, deletion, returns and remaining quantities; it is not inferred from the header alone.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `Product` | MCH1-MATNR | customer interface field: Product (unconfirmed) | copy |
| `Batch` | MCH1-CHARG | customer interface field: Batch (unconfirmed) | copy |
| `ManufactureDate` | MCH1-HSDAT | customer interface field: ManufactureDate (unconfirmed) | copy |
| `ExpirationDate` | MCH1-VFDAT | customer interface field: ExpirationDate (unconfirmed) | copy |

## `ZMMX_C_BatchPlantMig`

- Source: `ZMMX_I_BatchPlant`
- Keys: `Product`, `Plant`, `Batch`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Stock is a frozen, reconciled inventory population, including batch and special stock. MARD quantities alone do not establish complete inventory. Physical inventory, valuation, units and currency conversion need business sign-off. Historical goods movements are reference data. Open purchasing scope requires item status, receipts, invoices, deletion, returns and remaining quantities; it is not inferred from the header alone.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `Product` | MCHA-MATNR | customer interface field: Product (unconfirmed) | copy |
| `Plant` | MCHA-WERKS | customer interface field: Plant (unconfirmed) | copy |
| `Batch` | MCHA-CHARG | customer interface field: Batch (unconfirmed) | copy |
| `ManufactureDate` | MCHA-HSDAT | customer interface field: ManufactureDate (unconfirmed) | copy |
| `ExpirationDate` | MCHA-VFDAT | customer interface field: ExpirationDate (unconfirmed) | copy |

## `ZMMX_C_MaterialSalesMig`

- Source: `ZMMX_I_MaterialSales`
- Keys: `Product`, `SalesOrganization`, `DistributionChannel`
- Scope: `all rows`
- Delivery mode: **posting**
- Before posting: Preserve full keys and the selected parent population. Technical source IDs are references; SAP generates target IDs. Use supported SAP business interfaces; system statuses and address versions are reference data, not direct table posting payloads.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `Product` | MVKE-MATNR | - | copy |
| `SalesOrganization` | MVKE-VKORG | - | copy |
| `DistributionChannel` | MVKE-VTWEG | - | copy |
| `SalesUnit` | MVKE-VRKME | - | copy |
| `DeliveringPlant` | MVKE-DWERK | - | copy |
| `SalesStatus` | MVKE-VMSTA | - | copy |
| `SalesStatusValidFrom` | MVKE-VMSTD | - | copy |
| `ItemCategoryGroup` | MVKE-MTPOS | - | copy |
| `AccountAssignmentGroup` | MVKE-KTGRM | - | copy |
| `DeletionFlag` | MVKE-LVORM | - | copy |

## `ZMMX_C_MaterialTaxMig`

- Source: `ZMMX_I_MaterialTax`
- Keys: `Product`, `DepartureCountry`
- Scope: `all rows`
- Delivery mode: **posting**
- Before posting: Preserve full keys and the selected parent population. Technical source IDs are references; SAP generates target IDs. Use supported SAP business interfaces; system statuses and address versions are reference data, not direct table posting payloads.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `Product` | MLAN-MATNR | - | copy |
| `DepartureCountry` | MLAN-ALAND | - | copy |
| `TaxClassification1` | MLAN-TAXM1 | - | copy |
| `TaxClassification2` | MLAN-TAXM2 | - | copy |
| `TaxClassification3` | MLAN-TAXM3 | - | copy |
| `TaxClassification4` | MLAN-TAXM4 | - | copy |
| `TaxClassification5` | MLAN-TAXM5 | - | copy |
| `TaxClassification6` | MLAN-TAXM6 | - | copy |
| `TaxClassification7` | MLAN-TAXM7 | - | copy |
| `TaxClassification8` | MLAN-TAXM8 | - | copy |
| `TaxClassification9` | MLAN-TAXM9 | - | copy |

## `ZMMX_C_MaterialMRPAreaMig`

- Source: `ZMMX_I_MaterialMRPArea`
- Keys: `Product`, `MRPArea`
- Scope: `all rows`
- Delivery mode: **posting**
- Before posting: Preserve full keys and the selected parent population. Technical source IDs are references; SAP generates target IDs. Use supported SAP business interfaces; system statuses and address versions are reference data, not direct table posting payloads.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `Product` | MDMA-MATNR | - | copy |
| `MRPArea` | MDMA-BERID | - | copy |
| `MRPType` | MDMA-DISMM | - | copy |
| `MRPController` | MDMA-DISPO | - | copy |
| `LotSizingProcedure` | MDMA-DISLS | - | copy |
| `SpecialProcurementType` | MDMA-SOBSL | - | copy |
| `DeletionFlag` | MDMA-LOEKZ | - | copy |

## `ZMMX_C_MaterialEANMig`

- Source: `ZMMX_I_MaterialEAN`
- Keys: `Product`, `AlternativeUnit`, `EANCounter`
- Scope: `all rows`
- Delivery mode: **posting**
- Before posting: Preserve full keys and the selected parent population. Technical source IDs are references; SAP generates target IDs. Use supported SAP business interfaces; system statuses and address versions are reference data, not direct table posting payloads.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `Product` | MEAN-MATNR | - | copy |
| `AlternativeUnit` | MEAN-MEINH | - | copy |
| `EANCounter` | MEAN-LFNUM | - | copy |
| `EAN` | MEAN-EAN11 | - | copy |
| `EANCategory` | MEAN-EANTP | - | copy |
| `MainEAN` | MEAN-HPEAN | - | copy |

## `ZMMX_C_MaterialLongTextMig`

- Source: `ZMMX_I_MaterialLongText`
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

## `ZMMX_C_ClassObjectMig`

- Source: `ZMMX_I_ClassObject`
- Keys: `ClassificationInternalID`
- Scope: `all rows`
- Delivery mode: **reference**
- Before posting: Preserve full keys and the selected parent population. Technical source IDs are references; SAP generates target IDs. Use supported SAP business interfaces; system statuses and address versions are reference data, not direct table posting payloads.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `ClassificationInternalID` | INOB-CUOBJ | - | copy |
| `ClassType` | INOB-KLART | - | copy |
| `ObjectTable` | INOB-OBTAB | - | copy |
| `ClassifiedObject` | INOB-OBJEK | - | copy |

## `ZMMX_C_MaterialClassMig`

- Source: `ZMMX_I_MaterialClass`
- Keys: `ClassifiedObject`, `ClassType`, `Class`
- Scope: `all rows`
- Delivery mode: **posting**
- Before posting: Preserve complete native classification/ECM keys. Use the explicit full-key business-owner link file and INOB where the class type uses internal CUOBJ; do not assume OBJEK equals MATNR or concatenate an external batch label. Resolve class/characteristic names and target object IDs; evaluate source ECM effectivity before posting through supported classification interfaces.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `ClassifiedObject` | KSSK-OBJEK | - | copy |
| `ClassType` | KSSK-KLART | - | copy |
| `Class` | KLAH-CLASS | - | copy |
| `ClassificationStatus` | KSSK-STATU | - | copy |

## `ZMMX_C_BatchClassMig`

- Source: `ZMMX_I_BatchClass`
- Keys: `ClassifiedObject`, `ClassType`, `Class`
- Scope: `all rows`
- Delivery mode: **posting**
- Before posting: Preserve complete native classification/ECM keys. Use the explicit full-key business-owner link file and INOB where the class type uses internal CUOBJ; do not assume OBJEK equals MATNR or concatenate an external batch label. Resolve class/characteristic names and target object IDs; evaluate source ECM effectivity before posting through supported classification interfaces.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `ClassifiedObject` | KSSK-OBJEK | - | copy |
| `ClassType` | KSSK-KLART | - | copy |
| `Class` | KLAH-CLASS | - | copy |
| `ClassificationStatus` | KSSK-STATU | - | copy |

## `ZMMX_C_MaterialCharcMig`

- Source: `ZMMX_I_MaterialCharc`
- Keys: `ClassifiedObject`, `ClassType`, `Characteristic`, `CharcValuePositionNumber`
- Scope: `all rows`
- Delivery mode: **posting**
- Before posting: Preserve complete native classification/ECM keys. Use the explicit full-key business-owner link file and INOB where the class type uses internal CUOBJ; do not assume OBJEK equals MATNR or concatenate an external batch label. Resolve class/characteristic names and target object IDs; evaluate source ECM effectivity before posting through supported classification interfaces.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `ClassifiedObject` | AUSP-OBJEK | - | copy |
| `ClassType` | AUSP-KLART | - | copy |
| `Characteristic` | CABN-ATNAM | - | copy |
| `CharcValuePositionNumber` | AUSP-ATZHL | - | copy |
| `CharcValue` | AUSP-ATWRT | - | copy |
| `CharcFromNumericValue` | AUSP-ATFLV | - | copy |
| `CharcToNumericValue` | AUSP-ATFLB | - | copy |
| `CharcValueDependency` | AUSP-ATCOD | - | copy |

## `ZMMX_C_BatchCharcMig`

- Source: `ZMMX_I_BatchCharc`
- Keys: `ClassifiedObject`, `ClassType`, `Characteristic`, `CharcValuePositionNumber`
- Scope: `all rows`
- Delivery mode: **posting**
- Before posting: Preserve complete native classification/ECM keys. Use the explicit full-key business-owner link file and INOB where the class type uses internal CUOBJ; do not assume OBJEK equals MATNR or concatenate an external batch label. Resolve class/characteristic names and target object IDs; evaluate source ECM effectivity before posting through supported classification interfaces.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `ClassifiedObject` | AUSP-OBJEK | - | copy |
| `ClassType` | AUSP-KLART | - | copy |
| `Characteristic` | CABN-ATNAM | - | copy |
| `CharcValuePositionNumber` | AUSP-ATZHL | - | copy |
| `CharcValue` | AUSP-ATWRT | - | copy |
| `CharcFromNumericValue` | AUSP-ATFLV | - | copy |
| `CharcToNumericValue` | AUSP-ATFLB | - | copy |
| `CharcValueDependency` | AUSP-ATCOD | - | copy |

## Source controls

- Source count view: `ZMMX_C_MaterialMigCount`

## Open gaps

- Stock is a frozen, reconciled inventory population, including batch and special stock. MARD quantities alone do not establish complete inventory. Physical inventory, valuation, units and currency conversion need business sign-off. Historical goods movements are reference data. Open purchasing scope requires item status, receipts, invoices, deletion, returns and remaining quantities; it is not inferred from the header alone.
