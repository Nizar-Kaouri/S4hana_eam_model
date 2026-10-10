# Migration interface: billing_document

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been run on a system.

- **Read by:** customer-selected supported posting interface; reference data is not posted
- **Load after:** `sales_order`
- **Business key:** `BillingDocument` · numbering **keep**
- **Key rule:** Preserve source identifiers in an audit ledger; map regenerated internal IDs and target numbering. Never assume internal IDs survive migration.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZSDX_C_BillingMig`

- Source: `ZSDX_I_Billing`
- Keys: `BillingDocument`
- Scope: `all rows`
- Delivery mode: **reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Open sales scope must resolve item rejection, delivery and billing status, document flow and remaining quantities. Historical deliveries and billing documents are reference data; recreating them can trigger accounting or logistics. Partners, pricing, texts and tax need explicit target interfaces and agreed key maps. Do not infer open status from VBAK alone.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `BillingDocument` | VBRK-VBELN | customer interface field: BillingDocument (unconfirmed) | information only | yes |
| `BillingDocumentType` | VBRK-FKART | customer interface field: BillingDocumentType (unconfirmed) | information only | yes |
| `BillingDocumentDate` | VBRK-FKDAT | customer interface field: BillingDocumentDate (unconfirmed) | information only | yes |
| `CompanyCode` | VBRK-BUKRS | customer interface field: CompanyCode (unconfirmed) | information only | yes |
| `TransactionCurrency` | VBRK-WAERK | customer interface field: TransactionCurrency (unconfirmed) | information only | yes |
| `Payer` | VBRK-KUNRG | customer interface field: Payer (unconfirmed) | information only | yes |

## `ZSDX_C_BillingItemMig`

- Source: `ZSDX_I_BillingItem`
- Keys: `BillingDocument`, `BillingDocumentItem`
- Scope: `all rows`
- Delivery mode: **reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Open sales scope must resolve item rejection, delivery and billing status, document flow and remaining quantities. Historical deliveries and billing documents are reference data; recreating them can trigger accounting or logistics. Partners, pricing, texts and tax need explicit target interfaces and agreed key maps. Do not infer open status from VBAK alone.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `BillingDocument` | VBRP-VBELN | customer interface field: BillingDocument (unconfirmed) | information only | yes |
| `BillingDocumentItem` | VBRP-POSNR | customer interface field: BillingDocumentItem (unconfirmed) | information only | yes |
| `Material` | VBRP-MATNR | customer interface field: Material (unconfirmed) | information only | yes |
| `BillingQuantity` | VBRP-FKIMG | customer interface field: BillingQuantity (unconfirmed) | information only | yes |
| `SalesUnit` | VBRP-VRKME | customer interface field: SalesUnit (unconfirmed) | information only | yes |
| `NetAmount` | VBRP-NETWR | customer interface field: NetAmount (unconfirmed) | information only | yes |
| `ReferenceDocument` | VBRP-VGBEL | customer interface field: ReferenceDocument (unconfirmed) | information only | yes |
| `ReferenceDocumentItem` | VBRP-VGPOS | customer interface field: ReferenceDocumentItem (unconfirmed) | information only | yes |

## Reconciliation

- Counts: `ZSDX_C_BillingMigCount` (ECC) vs `ZSDT_I_BillingCount` (S/4HANA) per `BillingDocument`
- Records and fields: `ZSDX_C_BillingMig` vs `ZSDT_I_BillingCompare` on `BillingDocument`; compared: `BillingDocumentType`, `BillingDocumentDate`, `CompanyCode`, `TransactionCurrency`, `Payer`

```bash
python3 tools/mig_reconcile.py counts --product sd_mig_ecc --module billing_document --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --product sd_mig_ecc --module billing_document --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- Open sales scope must resolve item rejection, delivery and billing status, document flow and remaining quantities. Historical deliveries and billing documents are reference data; recreating them can trigger accounting or logistics. Partners, pricing, texts and tax need explicit target interfaces and agreed key maps. Do not infer open status from VBAK alone.
