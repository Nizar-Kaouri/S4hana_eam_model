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

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `CompanyCode` | ANLA-BUKRS | customer interface field: CompanyCode (unconfirmed) | copy | yes |
| `MasterFixedAsset` | ANLA-ANLN1 | customer interface field: MasterFixedAsset (unconfirmed) | copy | yes |
| `FixedAsset` | ANLA-ANLN2 | customer interface field: FixedAsset (unconfirmed) | copy | yes |
| `AssetClass` | ANLA-ANLKL | customer interface field: AssetClass (unconfirmed) | copy | yes |
| `FixedAssetDescription` | ANLA-TXT50 | customer interface field: FixedAssetDescription (unconfirmed) | copy | yes |
| `InventoryNumber` | ANLA-INVNR | customer interface field: InventoryNumber (unconfirmed) | copy | yes |
| `AssetCapitalizationDate` | ANLA-AKTIV | customer interface field: AssetCapitalizationDate (unconfirmed) | copy | yes |
| `AssetDeactivationDate` | ANLA-DEAKT | customer interface field: AssetDeactivationDate (unconfirmed) | copy | yes |

## `ZFAX_C_AssetAssignmenMig`

- Source: `ZFAX_I_AssetAssignmen`
- Keys: `CompanyCode`, `MasterFixedAsset`, `FixedAsset`, `ValidityEndDate`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Depreciation areas, currencies, fiscal years and transfer dates must be agreed. ANLC values are fiscal-year accumulations, not a ready-made posting file. Asset balances must not also enter the general ledger opening balance. Asset transaction history is reconciliation reference data; Universal Parallel Accounting requires a separate supported interface assessment.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `CompanyCode` | ANLZ-BUKRS | customer interface field: CompanyCode (unconfirmed) | copy | yes |
| `MasterFixedAsset` | ANLZ-ANLN1 | customer interface field: MasterFixedAsset (unconfirmed) | copy | yes |
| `FixedAsset` | ANLZ-ANLN2 | customer interface field: FixedAsset (unconfirmed) | copy | yes |
| `ValidityEndDate` | ANLZ-BDATU | customer interface field: ValidityEndDate (unconfirmed) | copy | yes |
| `ValidityStartDate` | ANLZ-ADATU | customer interface field: ValidityStartDate (unconfirmed) | copy | yes |
| `CostCenter` | ANLZ-KOSTL | customer interface field: CostCenter (unconfirmed) | copy | yes |
| `Plant` | ANLZ-WERKS | customer interface field: Plant (unconfirmed) | copy | yes |
| `AssetLocation` | ANLZ-STORT | customer interface field: AssetLocation (unconfirmed) | copy | yes |
| `BusinessArea` | ANLZ-GSBER | customer interface field: BusinessArea (unconfirmed) | copy | yes |

## `ZFAX_C_DepreciationMig`

- Source: `ZFAX_I_Depreciation`
- Keys: `CompanyCode`, `MasterFixedAsset`, `FixedAsset`, `DepreciationArea`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Depreciation areas, currencies, fiscal years and transfer dates must be agreed. ANLC values are fiscal-year accumulations, not a ready-made posting file. Asset balances must not also enter the general ledger opening balance. Asset transaction history is reconciliation reference data; Universal Parallel Accounting requires a separate supported interface assessment.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `CompanyCode` | ANLB-BUKRS | customer interface field: CompanyCode (unconfirmed) | copy | yes |
| `MasterFixedAsset` | ANLB-ANLN1 | customer interface field: MasterFixedAsset (unconfirmed) | copy | yes |
| `FixedAsset` | ANLB-ANLN2 | customer interface field: FixedAsset (unconfirmed) | copy | yes |
| `DepreciationArea` | ANLB-AFABE | customer interface field: DepreciationArea (unconfirmed) | copy | yes |
| `DepreciationKey` | ANLB-AFASL | customer interface field: DepreciationKey (unconfirmed) | copy | yes |
| `UsefulLifeYears` | ANLB-NDJAR | customer interface field: UsefulLifeYears (unconfirmed) | copy | yes |
| `UsefulLifePeriods` | ANLB-NDPER | customer interface field: UsefulLifePeriods (unconfirmed) | copy | yes |
| `DepreciationStartDate` | ANLB-AFABG | customer interface field: DepreciationStartDate (unconfirmed) | copy | yes |

## Reconciliation

- Counts: `ZFAX_C_AssetMigCount` (ECC) vs `ZFAT_I_AssetCount` (S/4HANA) per `CompanyCode`
- Records and fields: `ZFAX_C_AssetMig` vs `ZFAT_B_AssetCompare` on `CompanyCode`, `MasterFixedAsset`, `FixedAsset`; compared: `AssetClass`, `FixedAssetDescription`, `InventoryNumber`, `AssetCapitalizationDate`, `AssetDeactivationDate`

```bash
python3 tools/mig_reconcile.py counts --product fi_aa_mig_ecc --module fixed_asset --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --product fi_aa_mig_ecc --module fixed_asset --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- Depreciation areas, currencies, fiscal years and transfer dates must be agreed. ANLC values are fiscal-year accumulations, not a ready-made posting file. Asset balances must not also enter the general ledger opening balance. Asset transaction history is reconciliation reference data; Universal Parallel Accounting requires a separate supported interface assessment.
