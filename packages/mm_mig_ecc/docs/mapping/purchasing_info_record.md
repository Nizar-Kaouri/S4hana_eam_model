# Migration interface: purchasing_info_record

> Version **1.0.0**

- **Read by:** Customer-verified business interface; master restrictions apply
- **Load after:** `product`
- **Business key:** `PurchasingInfoRecord` · numbering **keep**
- **Key rule:** Preserve source identifiers in an audit ledger; map regenerated internal IDs and target numbering. Never assume internal IDs survive migration.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZMMX_C_InfoRecordMig`

- Source: `ZMMX_I_InfoRecord`
- Keys: `PurchasingInfoRecord`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Stock is a frozen, reconciled inventory population, including batch and special stock. MARD quantities alone do not establish complete inventory. Physical inventory, valuation, units and currency conversion need business sign-off. Historical goods movements are reference data. Open purchasing scope requires item status, receipts, invoices, deletion, returns and remaining quantities; it is not inferred from the header alone. Migrate general and purchasing-organization data at their separate grains. Supplier/business-partner mapping and units are prerequisites. EINE current net price does not supply complete time-dependent conditions: export the configured purchasing condition tables, KONH/KONP and scales as a linked set with validity, access key and deletion checks. Do not claim complete condition coverage from EINA/EINE alone.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `PurchasingInfoRecord` | EINA-INFNR | customer interface field: PurchasingInfoRecord (unconfirmed) | copy | yes |
| `Product` | EINA-MATNR | customer interface field: Product (unconfirmed) | copy | yes |
| `Supplier` | EINA-LIFNR | customer interface field: Supplier (unconfirmed) | copy | yes |
| `ProductGroup` | EINA-MATKL | customer interface field: ProductGroup (unconfirmed) | copy | yes |
| `OrderUnit` | EINA-MEINS | customer interface field: OrderUnit (unconfirmed) | copy | yes |
| `DeletionFlag` | EINA-LOEKZ | customer interface field: DeletionFlag (unconfirmed) | copy | yes |

## `ZMMX_C_InfoPurchOrgMig`

- Source: `ZMMX_I_InfoPurchOrg`
- Keys: `PurchasingInfoRecord`, `PurchasingOrganization`, `InfoRecordCategory`, `Plant`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Stock is a frozen, reconciled inventory population, including batch and special stock. MARD quantities alone do not establish complete inventory. Physical inventory, valuation, units and currency conversion need business sign-off. Historical goods movements are reference data. Open purchasing scope requires item status, receipts, invoices, deletion, returns and remaining quantities; it is not inferred from the header alone. Migrate general and purchasing-organization data at their separate grains. Supplier/business-partner mapping and units are prerequisites. EINE current net price does not supply complete time-dependent conditions: export the configured purchasing condition tables, KONH/KONP and scales as a linked set with validity, access key and deletion checks. Do not claim complete condition coverage from EINA/EINE alone.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `PurchasingInfoRecord` | EINE-INFNR | customer interface field: PurchasingInfoRecord (unconfirmed) | copy | yes |
| `PurchasingOrganization` | EINE-EKORG | customer interface field: PurchasingOrganization (unconfirmed) | copy | yes |
| `InfoRecordCategory` | EINE-ESOKZ | customer interface field: InfoRecordCategory (unconfirmed) | copy | yes |
| `Plant` | EINE-WERKS | customer interface field: Plant (unconfirmed) | copy | yes |
| `PurchasingGroup` | EINE-EKGRP | customer interface field: PurchasingGroup (unconfirmed) | copy | yes |
| `Currency` | EINE-WAERS | customer interface field: Currency (unconfirmed) | copy | yes |
| `NetPrice` | EINE-NETPR | customer interface field: NetPrice (unconfirmed) | copy | yes |
| `PriceUnit` | EINE-PEINH | customer interface field: PriceUnit (unconfirmed) | copy | yes |
| `PriceUnitOfMeasure` | EINE-BPRME | customer interface field: PriceUnitOfMeasure (unconfirmed) | copy | yes |
| `DeletionFlag` | EINE-LOEKZ | customer interface field: DeletionFlag (unconfirmed) | copy | yes |

## Reconciliation

- Counts: `ZMMX_C_InfoRecordMigCount` (ECC) vs `-` (S/4HANA) per `PurchasingInfoRecord`

```bash
python3 tools/mig_reconcile.py counts --product mm_mig_ecc --module purchasing_info_record --source ecc_counts.csv --target s4_counts.csv
```

## Open gaps

- Stock is a frozen, reconciled inventory population, including batch and special stock. MARD quantities alone do not establish complete inventory. Physical inventory, valuation, units and currency conversion need business sign-off. Historical goods movements are reference data. Open purchasing scope requires item status, receipts, invoices, deletion, returns and remaining quantities; it is not inferred from the header alone.
- Migrate general and purchasing-organization data at their separate grains. Supplier/business-partner mapping and units are prerequisites. EINE current net price does not supply complete time-dependent conditions: export the configured purchasing condition tables, KONH/KONP and scales as a linked set with validity, access key and deletion checks. Do not claim complete condition coverage from EINA/EINE alone.
