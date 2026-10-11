# Migration interface: outbound_delivery

> Version **1.0.0**

- **Read by:** customer-selected supported posting interface; reference data is not posted
- **Load after:** `sales_order`
- **Business key:** `DeliveryDocument` · numbering **keep**
- **Key rule:** Preserve source identifiers in an audit ledger; map regenerated internal IDs and target numbering. Never assume internal IDs survive migration.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZSDX_C_DeliveryMig`

- Source: `ZSDX_I_Delivery`
- Keys: `DeliveryDocument`
- Scope: `all rows`
- Delivery mode: **reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Open sales scope must resolve item rejection, delivery and billing status, document flow and remaining quantities. Historical deliveries and billing documents are reference data; recreating them can trigger accounting or logistics. Partners, pricing, texts and tax need explicit target interfaces and agreed key maps. Do not infer open status from VBAK alone.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `DeliveryDocument` | LIKP-VBELN | customer interface field: DeliveryDocument (unconfirmed) | information only | yes |
| `DeliveryDocumentType` | LIKP-LFART | customer interface field: DeliveryDocumentType (unconfirmed) | information only | yes |
| `ShippingPoint` | LIKP-VSTEL | customer interface field: ShippingPoint (unconfirmed) | information only | yes |
| `ShipToParty` | LIKP-KUNNR | customer interface field: ShipToParty (unconfirmed) | information only | yes |
| `PlannedGoodsIssueDate` | LIKP-WADAT | customer interface field: PlannedGoodsIssueDate (unconfirmed) | information only | yes |
| `ActualGoodsIssueDate` | LIKP-WADAT_IST | customer interface field: ActualGoodsIssueDate (unconfirmed) | information only | yes |

## `ZSDX_C_DeliveryItemMig`

- Source: `ZSDX_I_DeliveryItem`
- Keys: `DeliveryDocument`, `DeliveryDocumentItem`
- Scope: `all rows`
- Delivery mode: **reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Open sales scope must resolve item rejection, delivery and billing status, document flow and remaining quantities. Historical deliveries and billing documents are reference data; recreating them can trigger accounting or logistics. Partners, pricing, texts and tax need explicit target interfaces and agreed key maps. Do not infer open status from VBAK alone.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `DeliveryDocument` | LIPS-VBELN | customer interface field: DeliveryDocument (unconfirmed) | information only | yes |
| `DeliveryDocumentItem` | LIPS-POSNR | customer interface field: DeliveryDocumentItem (unconfirmed) | information only | yes |
| `Material` | LIPS-MATNR | customer interface field: Material (unconfirmed) | information only | yes |
| `Plant` | LIPS-WERKS | customer interface field: Plant (unconfirmed) | information only | yes |
| `StorageLocation` | LIPS-LGORT | customer interface field: StorageLocation (unconfirmed) | information only | yes |
| `DeliveryQuantity` | LIPS-LFIMG | customer interface field: DeliveryQuantity (unconfirmed) | information only | yes |
| `SalesUnit` | LIPS-VRKME | customer interface field: SalesUnit (unconfirmed) | information only | yes |
| `ReferenceDocument` | LIPS-VGBEL | customer interface field: ReferenceDocument (unconfirmed) | information only | yes |
| `ReferenceDocumentItem` | LIPS-VGPOS | customer interface field: ReferenceDocumentItem (unconfirmed) | information only | yes |

## Reconciliation

- Counts: `ZSDX_C_DeliveryMigCount` (ECC) vs `ZSDT_I_DeliveryCount` (S/4HANA) per `DeliveryDocument`
- Records and fields: `ZSDX_C_DeliveryMig` vs `ZSDT_I_DeliveryCompare` on `DeliveryDocument`; compared: `DeliveryDocumentType`, `ShippingPoint`, `ShipToParty`

```bash
python3 tools/mig_reconcile.py counts --product sd_mig_ecc --module outbound_delivery --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --product sd_mig_ecc --module outbound_delivery --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- Open sales scope must resolve item rejection, delivery and billing status, document flow and remaining quantities. Historical deliveries and billing documents are reference data; recreating them can trigger accounting or logistics. Partners, pricing, texts and tax need explicit target interfaces and agreed key maps. Do not infer open status from VBAK alone.
