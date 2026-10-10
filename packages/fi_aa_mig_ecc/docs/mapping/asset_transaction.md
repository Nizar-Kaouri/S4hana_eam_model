# Migration interface: asset_transaction

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been run on a system.

- **Read by:** customer-selected supported posting interface; reference data is not posted
- **Load after:** `fixed_asset`
- **Business key:** `CompanyCode`, `MasterFixedAsset`, `FixedAsset`, `FiscalYear`, `AssetLineItem`, `DepreciationArea` · numbering **keep**
- **Key rule:** Preserve source identifiers in an audit ledger; map regenerated internal IDs and target numbering. Never assume internal IDs survive migration.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZFAX_C_AssetPostingMig`

- Source: `ZFAX_I_AssetPosting`
- Keys: `CompanyCode`, `MasterFixedAsset`, `FixedAsset`, `FiscalYear`, `AssetLineItem`, `DepreciationArea`
- Scope: `all rows`
- Delivery mode: **reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Depreciation areas, currencies, fiscal years and transfer dates must be agreed. ANLC values are fiscal-year accumulations, not a ready-made posting file. Asset balances must not also enter the general ledger opening balance. Asset transaction history is reconciliation reference data; Universal Parallel Accounting requires a separate supported interface assessment.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `CompanyCode` | ANEP-BUKRS | customer interface field: CompanyCode (unconfirmed) | information only | yes |
| `MasterFixedAsset` | ANEP-ANLN1 | customer interface field: MasterFixedAsset (unconfirmed) | information only | yes |
| `FixedAsset` | ANEP-ANLN2 | customer interface field: FixedAsset (unconfirmed) | information only | yes |
| `FiscalYear` | ANEP-GJAHR | customer interface field: FiscalYear (unconfirmed) | information only | yes |
| `AssetLineItem` | ANEP-LNRAN | customer interface field: AssetLineItem (unconfirmed) | information only | yes |
| `DepreciationArea` | ANEP-AFABE | customer interface field: DepreciationArea (unconfirmed) | information only | yes |
| `AssetValueDate` | ANEP-BZDAT | customer interface field: AssetValueDate (unconfirmed) | information only | yes |
| `AssetTransactionType` | ANEP-BWASL | customer interface field: AssetTransactionType (unconfirmed) | information only | yes |
| `AssetAmount` | ANEP-ANBTR | customer interface field: AssetAmount (unconfirmed) | information only | yes |
| `AccountingDocument` | ANEP-BELNR | customer interface field: AccountingDocument (unconfirmed) | information only | yes |

## Reconciliation

- Counts: `ZFAX_C_AssetPostingMigCount` (ECC) vs `-` (S/4HANA) per `CompanyCode`

```bash
python3 tools/mig_reconcile.py counts --product fi_aa_mig_ecc --module asset_transaction --source ecc_counts.csv --target s4_counts.csv
```

## Open gaps

- Depreciation areas, currencies, fiscal years and transfer dates must be agreed. ANLC values are fiscal-year accumulations, not a ready-made posting file. Asset balances must not also enter the general ledger opening balance. Asset transaction history is reconciliation reference data; Universal Parallel Accounting requires a separate supported interface assessment.
