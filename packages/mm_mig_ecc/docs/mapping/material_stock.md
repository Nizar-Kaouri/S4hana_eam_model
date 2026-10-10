# Migration interface: material_stock

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been run on a system.

- **Read by:** customer-selected supported posting interface; reference data is not posted
- **Load after:** `product`
- **Business key:** `Product`, `Plant`, `StorageLocation` · numbering **keep**
- **Key rule:** Preserve source identifiers in an audit ledger; map regenerated internal IDs and target numbering. Never assume internal IDs survive migration.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZMMX_C_LocationStockMig`

- Source: `ZMMX_I_LocationStock`
- Keys: `Product`, `Plant`, `StorageLocation`
- Scope: `all rows`
- Delivery mode: **balance**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Stock is a frozen, reconciled inventory population, including batch and special stock. MARD quantities alone do not establish complete inventory. Physical inventory, valuation, units and currency conversion need business sign-off. Historical goods movements are reference data. Open purchasing scope requires item status, receipts, invoices, deletion, returns and remaining quantities; it is not inferred from the header alone.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Product` | MARD-MATNR | customer interface field: Product (unconfirmed) | copy | yes |
| `Plant` | MARD-WERKS | customer interface field: Plant (unconfirmed) | copy | yes |
| `StorageLocation` | MARD-LGORT | customer interface field: StorageLocation (unconfirmed) | copy | yes |
| `UnrestrictedStock` | MARD-LABST | customer interface field: UnrestrictedStock (unconfirmed) | copy | yes |
| `QualityInspectionStock` | MARD-INSME | customer interface field: QualityInspectionStock (unconfirmed) | copy | yes |
| `BlockedStock` | MARD-SPEME | customer interface field: BlockedStock (unconfirmed) | copy | yes |
| `TransferStock` | MARD-UMLME | customer interface field: TransferStock (unconfirmed) | copy | yes |

## `ZMMX_C_BatchStockMig`

- Source: `ZMMX_I_BatchStock`
- Keys: `Product`, `Plant`, `StorageLocation`, `Batch`
- Scope: `all rows`
- Delivery mode: **balance**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Stock is a frozen, reconciled inventory population, including batch and special stock. MARD quantities alone do not establish complete inventory. Physical inventory, valuation, units and currency conversion need business sign-off. Historical goods movements are reference data. Open purchasing scope requires item status, receipts, invoices, deletion, returns and remaining quantities; it is not inferred from the header alone.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Product` | MCHB-MATNR | customer interface field: Product (unconfirmed) | copy | yes |
| `Plant` | MCHB-WERKS | customer interface field: Plant (unconfirmed) | copy | yes |
| `StorageLocation` | MCHB-LGORT | customer interface field: StorageLocation (unconfirmed) | copy | yes |
| `Batch` | MCHB-CHARG | customer interface field: Batch (unconfirmed) | copy | yes |
| `UnrestrictedStock` | MCHB-CLABS | customer interface field: UnrestrictedStock (unconfirmed) | copy | yes |
| `QualityInspectionStock` | MCHB-CINSM | customer interface field: QualityInspectionStock (unconfirmed) | copy | yes |
| `BlockedStock` | MCHB-CSPEM | customer interface field: BlockedStock (unconfirmed) | copy | yes |

## `ZMMX_C_SalesOrderStocMig`

- Source: `ZMMX_I_SalesOrderStoc`
- Keys: `Product`, `Plant`, `StorageLocation`, `Batch`, `SpecialStock`, `SalesOrder`, `SalesOrderItem`
- Scope: `all rows`
- Delivery mode: **balance**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Stock is a frozen, reconciled inventory population, including batch and special stock. MARD quantities alone do not establish complete inventory. Physical inventory, valuation, units and currency conversion need business sign-off. Historical goods movements are reference data. Open purchasing scope requires item status, receipts, invoices, deletion, returns and remaining quantities; it is not inferred from the header alone.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Product` | MSKA-MATNR | customer interface field: Product (unconfirmed) | copy | yes |
| `Plant` | MSKA-WERKS | customer interface field: Plant (unconfirmed) | copy | yes |
| `StorageLocation` | MSKA-LGORT | customer interface field: StorageLocation (unconfirmed) | copy | yes |
| `Batch` | MSKA-CHARG | customer interface field: Batch (unconfirmed) | copy | yes |
| `SpecialStock` | MSKA-SOBKZ | customer interface field: SpecialStock (unconfirmed) | copy | yes |
| `SalesOrder` | MSKA-VBELN | customer interface field: SalesOrder (unconfirmed) | copy | yes |
| `SalesOrderItem` | MSKA-POSNR | customer interface field: SalesOrderItem (unconfirmed) | copy | yes |
| `UnrestrictedStock` | MSKA-KALAB | customer interface field: UnrestrictedStock (unconfirmed) | copy | yes |
| `QualityInspectionStock` | MSKA-KAINS | customer interface field: QualityInspectionStock (unconfirmed) | copy | yes |

## `ZMMX_C_SupplierStockMig`

- Source: `ZMMX_I_SupplierStock`
- Keys: `Product`, `Plant`, `Batch`, `SpecialStock`, `Supplier`
- Scope: `all rows`
- Delivery mode: **balance**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Stock is a frozen, reconciled inventory population, including batch and special stock. MARD quantities alone do not establish complete inventory. Physical inventory, valuation, units and currency conversion need business sign-off. Historical goods movements are reference data. Open purchasing scope requires item status, receipts, invoices, deletion, returns and remaining quantities; it is not inferred from the header alone.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Product` | MSLB-MATNR | customer interface field: Product (unconfirmed) | copy | yes |
| `Plant` | MSLB-WERKS | customer interface field: Plant (unconfirmed) | copy | yes |
| `Batch` | MSLB-CHARG | customer interface field: Batch (unconfirmed) | copy | yes |
| `SpecialStock` | MSLB-SOBKZ | customer interface field: SpecialStock (unconfirmed) | copy | yes |
| `Supplier` | MSLB-LIFNR | customer interface field: Supplier (unconfirmed) | copy | yes |
| `UnrestrictedStock` | MSLB-LBLAB | customer interface field: UnrestrictedStock (unconfirmed) | copy | yes |
| `QualityInspectionStock` | MSLB-LBINS | customer interface field: QualityInspectionStock (unconfirmed) | copy | yes |

## Reconciliation

- Counts: `ZMMX_C_LocationStockMigCount` (ECC) vs `-` (S/4HANA) per `Product`

```bash
python3 tools/mig_reconcile.py counts --product mm_mig_ecc --module material_stock --source ecc_counts.csv --target s4_counts.csv
```

## Open gaps

- Stock is a frozen, reconciled inventory population, including batch and special stock. MARD quantities alone do not establish complete inventory. Physical inventory, valuation, units and currency conversion need business sign-off. Historical goods movements are reference data. Open purchasing scope requires item status, receipts, invoices, deletion, returns and remaining quantities; it is not inferred from the header alone.
