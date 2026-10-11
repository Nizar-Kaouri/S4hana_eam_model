# Migration interface: asset_balance

> Version **1.0.0**

- **Read by:** customer-selected supported posting interface; reference data is not posted
- **Load after:** `fixed_asset`
- **Business key:** `CompanyCode`, `MasterFixedAsset`, `FixedAsset`, `FiscalYear`, `DepreciationArea` · numbering **keep**
- **Key rule:** Preserve source identifiers in an audit ledger; map regenerated internal IDs and target numbering. Never assume internal IDs survive migration.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZFAX_C_AssetBalanceMig`

- Source: `ZFAX_I_AssetBalance`
- Keys: `CompanyCode`, `MasterFixedAsset`, `FixedAsset`, `FiscalYear`, `DepreciationArea`
- Scope: `all rows`
- Delivery mode: **balance**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Depreciation areas, currencies, fiscal years and transfer dates must be agreed. ANLC values are fiscal-year accumulations, not a ready-made posting file. Asset balances must not also enter the general ledger opening balance. Asset transaction history is reconciliation reference data; Universal Parallel Accounting requires a separate supported interface assessment.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `CompanyCode` | ANLC-BUKRS | customer interface field: CompanyCode (unconfirmed) | copy |
| `MasterFixedAsset` | ANLC-ANLN1 | customer interface field: MasterFixedAsset (unconfirmed) | copy |
| `FixedAsset` | ANLC-ANLN2 | customer interface field: FixedAsset (unconfirmed) | copy |
| `FiscalYear` | ANLC-GJAHR | customer interface field: FiscalYear (unconfirmed) | copy |
| `DepreciationArea` | ANLC-AFABE | customer interface field: DepreciationArea (unconfirmed) | copy |
| `CumulativeAcquisition` | ANLC-KANSW | customer interface field: CumulativeAcquisition (unconfirmed) | copy |
| `CumulativeDepreciation` | ANLC-KNAFA | customer interface field: CumulativeDepreciation (unconfirmed) | copy |
| `CurrentYearAcquisition` | ANLC-ANSWL | customer interface field: CurrentYearAcquisition (unconfirmed) | copy |
| `PostedDepreciation` | ANLC-NAFAG | customer interface field: PostedDepreciation (unconfirmed) | copy |

## Source controls

- Source count view: `ZFAX_C_AssetBalanceMigCount`

## Open gaps

- Depreciation areas, currencies, fiscal years and transfer dates must be agreed. ANLC values are fiscal-year accumulations, not a ready-made posting file. Asset balances must not also enter the general ledger opening balance. Asset transaction history is reconciliation reference data; Universal Parallel Accounting requires a separate supported interface assessment.
