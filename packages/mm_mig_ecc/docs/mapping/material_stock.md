# Migration interface: material_stock

> Version **1.0.0**

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

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `Product` | MARD-MATNR | customer interface field: Product (unconfirmed) | copy |
| `Plant` | MARD-WERKS | customer interface field: Plant (unconfirmed) | copy |
| `StorageLocation` | MARD-LGORT | customer interface field: StorageLocation (unconfirmed) | copy |
| `UnrestrictedStock` | MARD-LABST | customer interface field: UnrestrictedStock (unconfirmed) | copy |
| `QualityInspectionStock` | MARD-INSME | customer interface field: QualityInspectionStock (unconfirmed) | copy |
| `BlockedStock` | MARD-SPEME | customer interface field: BlockedStock (unconfirmed) | copy |
| `TransferStock` | MARD-UMLME | customer interface field: TransferStock (unconfirmed) | copy |

## `ZMMX_C_BatchStockMig`

- Source: `ZMMX_I_BatchStock`
- Keys: `Product`, `Plant`, `StorageLocation`, `Batch`
- Scope: `all rows`
- Delivery mode: **balance**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Stock is a frozen, reconciled inventory population, including batch and special stock. MARD quantities alone do not establish complete inventory. Physical inventory, valuation, units and currency conversion need business sign-off. Historical goods movements are reference data. Open purchasing scope requires item status, receipts, invoices, deletion, returns and remaining quantities; it is not inferred from the header alone.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `Product` | MCHB-MATNR | customer interface field: Product (unconfirmed) | copy |
| `Plant` | MCHB-WERKS | customer interface field: Plant (unconfirmed) | copy |
| `StorageLocation` | MCHB-LGORT | customer interface field: StorageLocation (unconfirmed) | copy |
| `Batch` | MCHB-CHARG | customer interface field: Batch (unconfirmed) | copy |
| `UnrestrictedStock` | MCHB-CLABS | customer interface field: UnrestrictedStock (unconfirmed) | copy |
| `QualityInspectionStock` | MCHB-CINSM | customer interface field: QualityInspectionStock (unconfirmed) | copy |
| `BlockedStock` | MCHB-CSPEM | customer interface field: BlockedStock (unconfirmed) | copy |

## `ZMMX_C_SalesOrderStocMig`

- Source: `ZMMX_I_SalesOrderStoc`
- Keys: `Product`, `Plant`, `StorageLocation`, `Batch`, `SpecialStock`, `SalesOrder`, `SalesOrderItem`
- Scope: `all rows`
- Delivery mode: **balance**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Stock is a frozen, reconciled inventory population, including batch and special stock. MARD quantities alone do not establish complete inventory. Physical inventory, valuation, units and currency conversion need business sign-off. Historical goods movements are reference data. Open purchasing scope requires item status, receipts, invoices, deletion, returns and remaining quantities; it is not inferred from the header alone.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `Product` | MSKA-MATNR | customer interface field: Product (unconfirmed) | copy |
| `Plant` | MSKA-WERKS | customer interface field: Plant (unconfirmed) | copy |
| `StorageLocation` | MSKA-LGORT | customer interface field: StorageLocation (unconfirmed) | copy |
| `Batch` | MSKA-CHARG | customer interface field: Batch (unconfirmed) | copy |
| `SpecialStock` | MSKA-SOBKZ | customer interface field: SpecialStock (unconfirmed) | copy |
| `SalesOrder` | MSKA-VBELN | customer interface field: SalesOrder (unconfirmed) | copy |
| `SalesOrderItem` | MSKA-POSNR | customer interface field: SalesOrderItem (unconfirmed) | copy |
| `UnrestrictedStock` | MSKA-KALAB | customer interface field: UnrestrictedStock (unconfirmed) | copy |
| `QualityInspectionStock` | MSKA-KAINS | customer interface field: QualityInspectionStock (unconfirmed) | copy |

## `ZMMX_C_SupplierStockMig`

- Source: `ZMMX_I_SupplierStock`
- Keys: `Product`, `Plant`, `Batch`, `SpecialStock`, `Supplier`
- Scope: `all rows`
- Delivery mode: **balance**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Stock is a frozen, reconciled inventory population, including batch and special stock. MARD quantities alone do not establish complete inventory. Physical inventory, valuation, units and currency conversion need business sign-off. Historical goods movements are reference data. Open purchasing scope requires item status, receipts, invoices, deletion, returns and remaining quantities; it is not inferred from the header alone.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `Product` | MSLB-MATNR | customer interface field: Product (unconfirmed) | copy |
| `Plant` | MSLB-WERKS | customer interface field: Plant (unconfirmed) | copy |
| `Batch` | MSLB-CHARG | customer interface field: Batch (unconfirmed) | copy |
| `SpecialStock` | MSLB-SOBKZ | customer interface field: SpecialStock (unconfirmed) | copy |
| `Supplier` | MSLB-LIFNR | customer interface field: Supplier (unconfirmed) | copy |
| `UnrestrictedStock` | MSLB-LBLAB | customer interface field: UnrestrictedStock (unconfirmed) | copy |
| `QualityInspectionStock` | MSLB-LBINS | customer interface field: QualityInspectionStock (unconfirmed) | copy |

## Source controls

- Source count view: `ZMMX_C_LocationStockMigCount`

## Open gaps

- Stock is a frozen, reconciled inventory population, including batch and special stock. MARD quantities alone do not establish complete inventory. Physical inventory, valuation, units and currency conversion need business sign-off. Historical goods movements are reference data. Open purchasing scope requires item status, receipts, invoices, deletion, returns and remaining quantities; it is not inferred from the header alone.
