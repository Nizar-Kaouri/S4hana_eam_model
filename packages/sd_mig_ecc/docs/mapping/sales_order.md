# Migration interface: sales_order

> Version **1.0.0**

- **Read by:** customer-selected supported posting interface; reference data is not posted
- **Load after:** - (first level)
- **Business key:** `SalesDocument` · numbering **keep**
- **Key rule:** Preserve source identifiers in an audit ledger; map regenerated internal IDs and target numbering. Never assume internal IDs survive migration.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZSDX_C_SalesOrderMig`

- Source: `ZSDX_I_SalesOrder`
- Keys: `SalesDocument`
- Scope: `all rows`
- Delivery mode: **open-document**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Open sales scope must resolve item rejection, delivery and billing status, document flow and remaining quantities. Historical deliveries and billing documents are reference data; recreating them can trigger accounting or logistics. Partners, pricing, texts and tax need explicit target interfaces and agreed key maps. Do not infer open status from VBAK alone.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SalesDocument` | VBAK-VBELN | customer interface field: SalesDocument (unconfirmed) | copy | yes |
| `SalesDocumentType` | VBAK-AUART | customer interface field: SalesDocumentType (unconfirmed) | copy | yes |
| `SalesOrganization` | VBAK-VKORG | customer interface field: SalesOrganization (unconfirmed) | copy | yes |
| `DistributionChannel` | VBAK-VTWEG | customer interface field: DistributionChannel (unconfirmed) | copy | yes |
| `Division` | VBAK-SPART | customer interface field: Division (unconfirmed) | copy | yes |
| `SoldToParty` | VBAK-KUNNR | customer interface field: SoldToParty (unconfirmed) | copy | yes |
| `TransactionCurrency` | VBAK-WAERK | customer interface field: TransactionCurrency (unconfirmed) | copy | yes |

## `ZSDX_C_SalesItemMig`

- Source: `ZSDX_I_SalesItem`
- Keys: `SalesDocument`, `SalesDocumentItem`
- Scope: `all rows`
- Delivery mode: **open-document**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Open sales scope must resolve item rejection, delivery and billing status, document flow and remaining quantities. Historical deliveries and billing documents are reference data; recreating them can trigger accounting or logistics. Partners, pricing, texts and tax need explicit target interfaces and agreed key maps. Do not infer open status from VBAK alone.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SalesDocument` | VBAP-VBELN | customer interface field: SalesDocument (unconfirmed) | copy | yes |
| `SalesDocumentItem` | VBAP-POSNR | customer interface field: SalesDocumentItem (unconfirmed) | copy | yes |
| `Material` | VBAP-MATNR | customer interface field: Material (unconfirmed) | copy | yes |
| `Plant` | VBAP-WERKS | customer interface field: Plant (unconfirmed) | copy | yes |
| `OrderQuantity` | VBAP-KWMENG | customer interface field: OrderQuantity (unconfirmed) | copy | yes |
| `SalesUnit` | VBAP-VRKME | customer interface field: SalesUnit (unconfirmed) | copy | yes |
| `RejectionReason` | VBAP-ABGRU | customer interface field: RejectionReason (unconfirmed) | copy | yes |

## `ZSDX_C_SalesScheduleMig`

- Source: `ZSDX_I_SalesSchedule`
- Keys: `SalesDocument`, `SalesDocumentItem`, `ScheduleLine`
- Scope: `all rows`
- Delivery mode: **open-document**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Open sales scope must resolve item rejection, delivery and billing status, document flow and remaining quantities. Historical deliveries and billing documents are reference data; recreating them can trigger accounting or logistics. Partners, pricing, texts and tax need explicit target interfaces and agreed key maps. Do not infer open status from VBAK alone.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SalesDocument` | VBEP-VBELN | customer interface field: SalesDocument (unconfirmed) | copy | yes |
| `SalesDocumentItem` | VBEP-POSNR | customer interface field: SalesDocumentItem (unconfirmed) | copy | yes |
| `ScheduleLine` | VBEP-ETENR | customer interface field: ScheduleLine (unconfirmed) | copy | yes |
| `DeliveryDate` | VBEP-EDATU | customer interface field: DeliveryDate (unconfirmed) | copy | yes |
| `OrderQuantity` | VBEP-WMENG | customer interface field: OrderQuantity (unconfirmed) | copy | yes |
| `ConfirmedQuantity` | VBEP-BMENG | customer interface field: ConfirmedQuantity (unconfirmed) | copy | yes |

## `ZSDX_C_SalesBusinessMig`

- Source: `ZSDX_I_SalesBusiness`
- Keys: `SalesDocument`, `SalesDocumentItem`
- Scope: `all rows`
- Delivery mode: **open-document**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Open sales scope must resolve item rejection, delivery and billing status, document flow and remaining quantities. Historical deliveries and billing documents are reference data; recreating them can trigger accounting or logistics. Partners, pricing, texts and tax need explicit target interfaces and agreed key maps. Do not infer open status from VBAK alone.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SalesDocument` | VBKD-VBELN | customer interface field: SalesDocument (unconfirmed) | copy | yes |
| `SalesDocumentItem` | VBKD-POSNR | customer interface field: SalesDocumentItem (unconfirmed) | copy | yes |
| `CustomerPurchaseOrder` | VBKD-BSTKD | customer interface field: CustomerPurchaseOrder (unconfirmed) | copy | yes |
| `PaymentTerms` | VBKD-ZTERM | customer interface field: PaymentTerms (unconfirmed) | copy | yes |
| `IncotermsClassification` | VBKD-INCO1 | customer interface field: IncotermsClassification (unconfirmed) | copy | yes |
| `IncotermsLocation` | VBKD-INCO2 | customer interface field: IncotermsLocation (unconfirmed) | copy | yes |

## `ZSDX_C_SalesPartnerMig`

- Source: `ZSDX_I_SalesPartner`
- Keys: `SalesDocument`, `SalesDocumentItem`, `PartnerFunction`
- Scope: `all rows`
- Delivery mode: **open-document**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Open sales scope must resolve item rejection, delivery and billing status, document flow and remaining quantities. Historical deliveries and billing documents are reference data; recreating them can trigger accounting or logistics. Partners, pricing, texts and tax need explicit target interfaces and agreed key maps. Do not infer open status from VBAK alone.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SalesDocument` | VBPA-VBELN | customer interface field: SalesDocument (unconfirmed) | copy | yes |
| `SalesDocumentItem` | VBPA-POSNR | customer interface field: SalesDocumentItem (unconfirmed) | copy | yes |
| `PartnerFunction` | VBPA-PARVW | customer interface field: PartnerFunction (unconfirmed) | copy | yes |
| `Customer` | VBPA-KUNNR | customer interface field: Customer (unconfirmed) | copy | yes |
| `Supplier` | VBPA-LIFNR | customer interface field: Supplier (unconfirmed) | copy | yes |
| `PersonnelNumber` | VBPA-PERNR | customer interface field: PersonnelNumber (unconfirmed) | copy | yes |

## `ZSDX_C_SalesHeaderStaMig`

- Source: `ZSDX_I_SalesHeaderSta`
- Keys: `SalesDocument`
- Scope: `all rows`
- Delivery mode: **open-document**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Open sales scope must resolve item rejection, delivery and billing status, document flow and remaining quantities. Historical deliveries and billing documents are reference data; recreating them can trigger accounting or logistics. Partners, pricing, texts and tax need explicit target interfaces and agreed key maps. Do not infer open status from VBAK alone.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SalesDocument` | VBUK-VBELN | customer interface field: SalesDocument (unconfirmed) | copy | yes |
| `OverallProcessingStatus` | VBUK-GBSTK | customer interface field: OverallProcessingStatus (unconfirmed) | copy | yes |
| `DeliveryStatus` | VBUK-LFSTK | customer interface field: DeliveryStatus (unconfirmed) | copy | yes |
| `BillingStatus` | VBUK-FKSTK | customer interface field: BillingStatus (unconfirmed) | copy | yes |

## `ZSDX_C_SalesItemStatuMig`

- Source: `ZSDX_I_SalesItemStatu`
- Keys: `SalesDocument`, `SalesDocumentItem`
- Scope: `all rows`
- Delivery mode: **open-document**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Open sales scope must resolve item rejection, delivery and billing status, document flow and remaining quantities. Historical deliveries and billing documents are reference data; recreating them can trigger accounting or logistics. Partners, pricing, texts and tax need explicit target interfaces and agreed key maps. Do not infer open status from VBAK alone.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SalesDocument` | VBUP-VBELN | customer interface field: SalesDocument (unconfirmed) | copy | yes |
| `SalesDocumentItem` | VBUP-POSNR | customer interface field: SalesDocumentItem (unconfirmed) | copy | yes |
| `OverallProcessingStatus` | VBUP-GBSTA | customer interface field: OverallProcessingStatus (unconfirmed) | copy | yes |
| `DeliveryStatus` | VBUP-LFSTA | customer interface field: DeliveryStatus (unconfirmed) | copy | yes |
| `BillingStatus` | VBUP-FKSTA | customer interface field: BillingStatus (unconfirmed) | copy | yes |

## `ZSDX_C_SalesFlowMig`

- Source: `ZSDX_I_SalesFlow`
- Keys: `PrecedingDocument`, `PrecedingDocumentItem`, `SubsequentDocument`, `SubsequentDocumentItem`, `SubsequentDocumentCategory`
- Scope: `all rows`
- Delivery mode: **open-document**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Open sales scope must resolve item rejection, delivery and billing status, document flow and remaining quantities. Historical deliveries and billing documents are reference data; recreating them can trigger accounting or logistics. Partners, pricing, texts and tax need explicit target interfaces and agreed key maps. Do not infer open status from VBAK alone.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `PrecedingDocument` | VBFA-VBELV | customer interface field: PrecedingDocument (unconfirmed) | copy | yes |
| `PrecedingDocumentItem` | VBFA-POSNV | customer interface field: PrecedingDocumentItem (unconfirmed) | copy | yes |
| `SubsequentDocument` | VBFA-VBELN | customer interface field: SubsequentDocument (unconfirmed) | copy | yes |
| `SubsequentDocumentItem` | VBFA-POSNN | customer interface field: SubsequentDocumentItem (unconfirmed) | copy | yes |
| `SubsequentDocumentCategory` | VBFA-VBTYP_N | customer interface field: SubsequentDocumentCategory (unconfirmed) | copy | yes |
| `PrecedingDocumentCategory` | VBFA-VBTYP_V | customer interface field: PrecedingDocumentCategory (unconfirmed) | copy | yes |
| `ReferencedQuantity` | VBFA-RFMNG | customer interface field: ReferencedQuantity (unconfirmed) | copy | yes |

## Reconciliation

- Counts: `ZSDX_C_SalesOrderMigCount` (ECC) vs `ZSDT_I_SalesOrderCount` (S/4HANA) per `SalesDocument`
- Records and fields: `ZSDX_C_SalesOrderMig` vs `ZSDT_I_SalesOrderCompare` on `SalesDocument`; compared: `SalesDocumentType`, `SalesOrganization`, `DistributionChannel`, `Division`, `SoldToParty`, `TransactionCurrency`

```bash
python3 tools/mig_reconcile.py counts --product sd_mig_ecc --module sales_order --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --product sd_mig_ecc --module sales_order --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- Open sales scope must resolve item rejection, delivery and billing status, document flow and remaining quantities. Historical deliveries and billing documents are reference data; recreating them can trigger accounting or logistics. Partners, pricing, texts and tax need explicit target interfaces and agreed key maps. Do not infer open status from VBAK alone.
