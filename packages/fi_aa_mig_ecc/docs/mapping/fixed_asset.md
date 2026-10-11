# Migration interface: fixed_asset

> Version **1.0.0**

- **Read by:** customer-selected supported posting interface; reference data is not posted
- **Load after:** - (first level)
- **Business key:** `CompanyCode`, `MasterFixedAsset`, `FixedAsset` · numbering **keep**
- **Key rule:** Preserve source identifiers in an audit ledger; map regenerated internal IDs and target numbering. Never assume internal IDs survive migration.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZFAX_C_AssetMig`

- Source: `ZFAX_I_Asset`
- Keys: `CompanyCode`, `MasterFixedAsset`, `FixedAsset`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Depreciation areas, currencies, fiscal years and transfer dates must be agreed. ANLC values are fiscal-year accumulations, not a ready-made posting file. Asset balances must not also enter the general ledger opening balance. Asset transaction history is reconciliation reference data; Universal Parallel Accounting requires a separate supported interface assessment.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `CompanyCode` | ANLA-BUKRS | customer interface field: CompanyCode (unconfirmed) | copy |
| `MasterFixedAsset` | ANLA-ANLN1 | customer interface field: MasterFixedAsset (unconfirmed) | copy |
| `FixedAsset` | ANLA-ANLN2 | customer interface field: FixedAsset (unconfirmed) | copy |
| `AssetClass` | ANLA-ANLKL | customer interface field: AssetClass (unconfirmed) | copy |
| `FixedAssetDescription` | ANLA-TXT50 | customer interface field: FixedAssetDescription (unconfirmed) | copy |
| `InventoryNumber` | ANLA-INVNR | customer interface field: InventoryNumber (unconfirmed) | copy |
| `AssetCapitalizationDate` | ANLA-AKTIV | customer interface field: AssetCapitalizationDate (unconfirmed) | copy |
| `AssetDeactivationDate` | ANLA-DEAKT | customer interface field: AssetDeactivationDate (unconfirmed) | copy |
| `AssetDescription2` | ANLA-TXA50 | - | copy |
| `SerialNumber` | ANLA-SERNR | - | copy |
| `Manufacturer` | ANLA-HERST | - | copy |
| `Quantity` | ANLA-MENGE | - | copy |
| `QuantityUnit` | ANLA-MEINS | - | copy |

## `ZFAX_C_AssetAssignmenMig`

- Source: `ZFAX_I_AssetAssignmen`
- Keys: `CompanyCode`, `MasterFixedAsset`, `FixedAsset`, `ValidityEndDate`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Depreciation areas, currencies, fiscal years and transfer dates must be agreed. ANLC values are fiscal-year accumulations, not a ready-made posting file. Asset balances must not also enter the general ledger opening balance. Asset transaction history is reconciliation reference data; Universal Parallel Accounting requires a separate supported interface assessment.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `CompanyCode` | ANLZ-BUKRS | customer interface field: CompanyCode (unconfirmed) | copy |
| `MasterFixedAsset` | ANLZ-ANLN1 | customer interface field: MasterFixedAsset (unconfirmed) | copy |
| `FixedAsset` | ANLZ-ANLN2 | customer interface field: FixedAsset (unconfirmed) | copy |
| `ValidityEndDate` | ANLZ-BDATU | customer interface field: ValidityEndDate (unconfirmed) | copy |
| `ValidityStartDate` | ANLZ-ADATU | customer interface field: ValidityStartDate (unconfirmed) | copy |
| `CostCenter` | ANLZ-KOSTL | customer interface field: CostCenter (unconfirmed) | copy |
| `Plant` | ANLZ-WERKS | customer interface field: Plant (unconfirmed) | copy |
| `AssetLocation` | ANLZ-STORT | customer interface field: AssetLocation (unconfirmed) | copy |
| `BusinessArea` | ANLZ-GSBER | customer interface field: BusinessArea (unconfirmed) | copy |

## `ZFAX_C_DepreciationMig`

- Source: `ZFAX_I_Depreciation`
- Keys: `CompanyCode`, `MasterFixedAsset`, `FixedAsset`, `DepreciationArea`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Depreciation areas, currencies, fiscal years and transfer dates must be agreed. ANLC values are fiscal-year accumulations, not a ready-made posting file. Asset balances must not also enter the general ledger opening balance. Asset transaction history is reconciliation reference data; Universal Parallel Accounting requires a separate supported interface assessment.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `CompanyCode` | ANLB-BUKRS | customer interface field: CompanyCode (unconfirmed) | copy |
| `MasterFixedAsset` | ANLB-ANLN1 | customer interface field: MasterFixedAsset (unconfirmed) | copy |
| `FixedAsset` | ANLB-ANLN2 | customer interface field: FixedAsset (unconfirmed) | copy |
| `DepreciationArea` | ANLB-AFABE | customer interface field: DepreciationArea (unconfirmed) | copy |
| `DepreciationKey` | ANLB-AFASL | customer interface field: DepreciationKey (unconfirmed) | copy |
| `UsefulLifeYears` | ANLB-NDJAR | customer interface field: UsefulLifeYears (unconfirmed) | copy |
| `UsefulLifePeriods` | ANLB-NDPER | customer interface field: UsefulLifePeriods (unconfirmed) | copy |
| `DepreciationStartDate` | ANLB-AFABG | customer interface field: DepreciationStartDate (unconfirmed) | copy |

## `ZFAX_C_AssetLongTextMig`

- Source: `ZFAX_I_AssetLongText`
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

- Source count view: `ZFAX_C_AssetMigCount`

## Open gaps

- Depreciation areas, currencies, fiscal years and transfer dates must be agreed. ANLC values are fiscal-year accumulations, not a ready-made posting file. Asset balances must not also enter the general ledger opening balance. Asset transaction history is reconciliation reference data; Universal Parallel Accounting requires a separate supported interface assessment.
