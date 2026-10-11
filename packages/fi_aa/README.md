# Asset Accounting (FI-AA) - CDS virtual data model

Naming: **B_ = Basic, I_ = Interface (Composite), C_ = Consumption**. See [naming guidance](../../docs/NAMING.md).

> **Status: draft-unverified.** Written without an SAP system; nothing has been activated or tested.
> Every uncertain element carries a `TODO-VERIFY` marker, ranked in [`BATCH_REPORT.md`](BATCH_REPORT.md).

| | |
|---|---|
| Product folder | `packages/fi_aa` |
| Object prefix | `ZFAA_` (replaced per customer by the build) |
| ABAP package | `ZFAA_VDM` |
| Target release | SAP S/4HANA 2025 (on-premise / Private Cloud Edition) |
| Entity map | [`docs/model_map.html`](docs/model_map.html) |

Same architecture and rules as the EAM product (see `packages/eam/README.md`): basic `ZFAA_B_*`,
composite `ZFAA_I_*` (cubes), consumption `ZFAA_C_*Q` (analytical queries); one self-contained module
per business object; cross-object associations only in link views; hard dependencies added by the build.

## Data model in one paragraph

Asset **master data** comes from `I_FixedAsset`. Asset **values** come from the Universal Journal
(`I_JournalEntryItem`): every line item with an asset number is an asset posting. A derived
**value category** classifies it as acquisition, retirement, transfer, depreciation or other.
**Net book value** at a key date is the sum of all balance-sheet postings on the asset up to that
date. Planned (not yet posted) depreciation is not part of the model.

## Modules

| Module | Batch | Hard dependencies | Views |
|---|---|---|---|
| `fixed_asset` | 1 | - | `ZFAA_B_FixedAsset` (dimension), `ZFAA_B_FixedAssetVH`, `ZFAA_I_FixedAsset` (+ DDLX), `ZFAA_C_FixedAssetQ` |
| `asset_transaction` | 2 | - | `ZFAA_B_AssetJournalItem`, `ZFAA_I_AssetTransaction`, `ZFAA_C_AssetTransactionQ` |
| `rpt_asset_balance` | 3 | `asset_transaction` | `ZFAA_I_AssetBalance` (parameter key date), `ZFAA_C_AssetBalanceQ` |

### Link views (ship only when all listed modules are selected)

| Link view | Requires | Purpose |
|---|---|---|
| `ZFAA_B_AssetWithJournalItem` | fixed_asset + asset_transaction | asset → all its postings |
| `ZFAA_I_AssetTransWithAsset` + `ZFAA_C_AssetTransAssetQ` | fixed_asset + asset_transaction | acquisitions / depreciation by asset class and plant |
| `ZFAA_I_AssetBalanceWithAsset` + `ZFAA_C_AssetBalanceAssetQ` | fixed_asset + rpt_asset_balance | **asset balance report**: net book value by asset class and cost center at a key date |

### Link to EAM (planned, not built)

Equipment ↔ fixed asset needs modules from two products (EAM `equipment` and FI-AA `fixed_asset`).
Cross-product link views are not supported by the build yet; see the open design item in
`PRODUCT_CHECKLIST.md`.

## Commands

```bash
python3 tools/check_all.py --only fi_aa
python3 build_package.py --product fi_aa --list
python3 build_package.py --product fi_aa fixed_asset rpt_asset_balance --prefix ZACME_ --package ZACME_FAA
```
