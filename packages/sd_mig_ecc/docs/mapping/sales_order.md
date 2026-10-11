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

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `SalesDocument` | VBAK-VBELN | customer interface field: SalesDocument (unconfirmed) | copy |
| `SalesDocumentType` | VBAK-AUART | customer interface field: SalesDocumentType (unconfirmed) | copy |
| `SalesOrganization` | VBAK-VKORG | customer interface field: SalesOrganization (unconfirmed) | copy |
| `DistributionChannel` | VBAK-VTWEG | customer interface field: DistributionChannel (unconfirmed) | copy |
| `Division` | VBAK-SPART | customer interface field: Division (unconfirmed) | copy |
| `SoldToParty` | VBAK-KUNNR | customer interface field: SoldToParty (unconfirmed) | copy |
| `TransactionCurrency` | VBAK-WAERK | customer interface field: TransactionCurrency (unconfirmed) | copy |

## `ZSDX_C_SalesItemMig`

- Source: `ZSDX_I_SalesItem`
- Keys: `SalesDocument`, `SalesDocumentItem`
- Scope: `all rows`
- Delivery mode: **open-document**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Open sales scope must resolve item rejection, delivery and billing status, document flow and remaining quantities. Historical deliveries and billing documents are reference data; recreating them can trigger accounting or logistics. Partners, pricing, texts and tax need explicit target interfaces and agreed key maps. Do not infer open status from VBAK alone.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `SalesDocument` | VBAP-VBELN | customer interface field: SalesDocument (unconfirmed) | copy |
| `SalesDocumentItem` | VBAP-POSNR | customer interface field: SalesDocumentItem (unconfirmed) | copy |
| `Material` | VBAP-MATNR | customer interface field: Material (unconfirmed) | copy |
| `Plant` | VBAP-WERKS | customer interface field: Plant (unconfirmed) | copy |
| `OrderQuantity` | VBAP-KWMENG | customer interface field: OrderQuantity (unconfirmed) | copy |
| `SalesUnit` | VBAP-VRKME | customer interface field: SalesUnit (unconfirmed) | copy |
| `RejectionReason` | VBAP-ABGRU | customer interface field: RejectionReason (unconfirmed) | copy |
| `ItemShortText` | VBAP-ARKTX | - | copy |
| `ItemCategory` | VBAP-PSTYV | - | copy |

## `ZSDX_C_SalesScheduleMig`

- Source: `ZSDX_I_SalesSchedule`
- Keys: `SalesDocument`, `SalesDocumentItem`, `ScheduleLine`
- Scope: `all rows`
- Delivery mode: **open-document**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Open sales scope must resolve item rejection, delivery and billing status, document flow and remaining quantities. Historical deliveries and billing documents are reference data; recreating them can trigger accounting or logistics. Partners, pricing, texts and tax need explicit target interfaces and agreed key maps. Do not infer open status from VBAK alone.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `SalesDocument` | VBEP-VBELN | customer interface field: SalesDocument (unconfirmed) | copy |
| `SalesDocumentItem` | VBEP-POSNR | customer interface field: SalesDocumentItem (unconfirmed) | copy |
| `ScheduleLine` | VBEP-ETENR | customer interface field: ScheduleLine (unconfirmed) | copy |
| `DeliveryDate` | VBEP-EDATU | customer interface field: DeliveryDate (unconfirmed) | copy |
| `OrderQuantity` | VBEP-WMENG | customer interface field: OrderQuantity (unconfirmed) | copy |
| `ConfirmedQuantity` | VBEP-BMENG | customer interface field: ConfirmedQuantity (unconfirmed) | copy |

## `ZSDX_C_SalesBusinessMig`

- Source: `ZSDX_I_SalesBusiness`
- Keys: `SalesDocument`, `SalesDocumentItem`
- Scope: `all rows`
- Delivery mode: **open-document**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Open sales scope must resolve item rejection, delivery and billing status, document flow and remaining quantities. Historical deliveries and billing documents are reference data; recreating them can trigger accounting or logistics. Partners, pricing, texts and tax need explicit target interfaces and agreed key maps. Do not infer open status from VBAK alone.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `SalesDocument` | VBKD-VBELN | customer interface field: SalesDocument (unconfirmed) | copy |
| `SalesDocumentItem` | VBKD-POSNR | customer interface field: SalesDocumentItem (unconfirmed) | copy |
| `CustomerPurchaseOrder` | VBKD-BSTKD | customer interface field: CustomerPurchaseOrder (unconfirmed) | copy |
| `PaymentTerms` | VBKD-ZTERM | customer interface field: PaymentTerms (unconfirmed) | copy |
| `IncotermsClassification` | VBKD-INCO1 | customer interface field: IncotermsClassification (unconfirmed) | copy |
| `IncotermsLocation` | VBKD-INCO2 | customer interface field: IncotermsLocation (unconfirmed) | copy |

## `ZSDX_C_SalesPartnerMig`

- Source: `ZSDX_I_SalesPartner`
- Keys: `SalesDocument`, `SalesDocumentItem`, `PartnerFunction`
- Scope: `all rows`
- Delivery mode: **open-document**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Open sales scope must resolve item rejection, delivery and billing status, document flow and remaining quantities. Historical deliveries and billing documents are reference data; recreating them can trigger accounting or logistics. Partners, pricing, texts and tax need explicit target interfaces and agreed key maps. Do not infer open status from VBAK alone.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `SalesDocument` | VBPA-VBELN | customer interface field: SalesDocument (unconfirmed) | copy |
| `SalesDocumentItem` | VBPA-POSNR | customer interface field: SalesDocumentItem (unconfirmed) | copy |
| `PartnerFunction` | VBPA-PARVW | customer interface field: PartnerFunction (unconfirmed) | copy |
| `Customer` | VBPA-KUNNR | customer interface field: Customer (unconfirmed) | copy |
| `Supplier` | VBPA-LIFNR | customer interface field: Supplier (unconfirmed) | copy |
| `PersonnelNumber` | VBPA-PERNR | customer interface field: PersonnelNumber (unconfirmed) | copy |
| `AddressNumber` | VBPA-ADRNR | - | information only |
| `AddressValidTo` | ADRC-DATE_TO | - | copy |
| `AddressName1` | ADRC-NAME1 | - | copy |
| `AddressName2` | ADRC-NAME2 | - | copy |
| `AddressName3` | ADRC-NAME3 | - | copy |
| `AddressName4` | ADRC-NAME4 | - | copy |
| `AddressStreet` | ADRC-STREET | - | copy |
| `AddressHouseNumber` | ADRC-HOUSE_NUM1 | - | copy |
| `AddressHouseNumberSupplement` | ADRC-HOUSE_NUM2 | - | copy |
| `AddressCity` | ADRC-CITY1 | - | copy |
| `AddressDistrict` | ADRC-CITY2 | - | copy |
| `AddressPostalCode` | ADRC-POST_CODE1 | - | copy |
| `AddressPOBox` | ADRC-PO_BOX | - | copy |
| `AddressPOBoxPostalCode` | ADRC-POST_CODE2 | - | copy |
| `AddressCountry` | ADRC-COUNTRY | - | copy |
| `AddressRegion` | ADRC-REGION | - | copy |
| `AddressLanguage` | ADRC-LANGU | - | copy |
| `HasStandardAddress` | derived: presence of the standard ADRC record | - | information only |

## `ZSDX_C_SalesHeaderStaMig`

- Source: `ZSDX_I_SalesHeaderSta`
- Keys: `SalesDocument`
- Scope: `all rows`
- Delivery mode: **open-document**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Open sales scope must resolve item rejection, delivery and billing status, document flow and remaining quantities. Historical deliveries and billing documents are reference data; recreating them can trigger accounting or logistics. Partners, pricing, texts and tax need explicit target interfaces and agreed key maps. Do not infer open status from VBAK alone.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `SalesDocument` | VBUK-VBELN | customer interface field: SalesDocument (unconfirmed) | copy |
| `OverallProcessingStatus` | VBUK-GBSTK | customer interface field: OverallProcessingStatus (unconfirmed) | copy |
| `DeliveryStatus` | VBUK-LFSTK | customer interface field: DeliveryStatus (unconfirmed) | copy |
| `BillingStatus` | VBUK-FKSTK | customer interface field: BillingStatus (unconfirmed) | copy |

## `ZSDX_C_SalesItemStatuMig`

- Source: `ZSDX_I_SalesItemStatu`
- Keys: `SalesDocument`, `SalesDocumentItem`
- Scope: `all rows`
- Delivery mode: **open-document**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Open sales scope must resolve item rejection, delivery and billing status, document flow and remaining quantities. Historical deliveries and billing documents are reference data; recreating them can trigger accounting or logistics. Partners, pricing, texts and tax need explicit target interfaces and agreed key maps. Do not infer open status from VBAK alone.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `SalesDocument` | VBUP-VBELN | customer interface field: SalesDocument (unconfirmed) | copy |
| `SalesDocumentItem` | VBUP-POSNR | customer interface field: SalesDocumentItem (unconfirmed) | copy |
| `OverallProcessingStatus` | VBUP-GBSTA | customer interface field: OverallProcessingStatus (unconfirmed) | copy |
| `DeliveryStatus` | VBUP-LFSTA | customer interface field: DeliveryStatus (unconfirmed) | copy |
| `BillingStatus` | VBUP-FKSTA | customer interface field: BillingStatus (unconfirmed) | copy |

## `ZSDX_C_SalesFlowMig`

- Source: `ZSDX_I_SalesFlow`
- Keys: `PrecedingDocument`, `PrecedingDocumentItem`, `SubsequentDocument`, `SubsequentDocumentItem`, `SubsequentDocumentCategory`
- Scope: `all rows`
- Delivery mode: **open-document**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Open sales scope must resolve item rejection, delivery and billing status, document flow and remaining quantities. Historical deliveries and billing documents are reference data; recreating them can trigger accounting or logistics. Partners, pricing, texts and tax need explicit target interfaces and agreed key maps. Do not infer open status from VBAK alone.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `PrecedingDocument` | VBFA-VBELV | customer interface field: PrecedingDocument (unconfirmed) | copy |
| `PrecedingDocumentItem` | VBFA-POSNV | customer interface field: PrecedingDocumentItem (unconfirmed) | copy |
| `SubsequentDocument` | VBFA-VBELN | customer interface field: SubsequentDocument (unconfirmed) | copy |
| `SubsequentDocumentItem` | VBFA-POSNN | customer interface field: SubsequentDocumentItem (unconfirmed) | copy |
| `SubsequentDocumentCategory` | VBFA-VBTYP_N | customer interface field: SubsequentDocumentCategory (unconfirmed) | copy |
| `PrecedingDocumentCategory` | VBFA-VBTYP_V | customer interface field: PrecedingDocumentCategory (unconfirmed) | copy |
| `ReferencedQuantity` | VBFA-RFMNG | customer interface field: ReferencedQuantity (unconfirmed) | copy |

## `ZSDX_C_SalesPartnerAddressMig`

- Source: `ZSDX_I_SalesPartnerAddress`
- Keys: `SalesDocument`, `SalesDocumentItem`, `PartnerFunction`, `AddressValidFrom`, `AddressVersion`
- Scope: `all rows`
- Delivery mode: **reference**
- Before posting: Preserve full keys and the selected parent population. Technical source IDs are references; SAP generates target IDs. Use supported SAP business interfaces; system statuses and address versions are reference data, not direct table posting payloads.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `SalesDocument` | VBPA-VBELN | - | copy |
| `SalesDocumentItem` | VBPA-POSNR | - | copy |
| `PartnerFunction` | VBPA-PARVW | - | copy |
| `AddressNumber` | ADRC-ADDRNUMBER | - | information only |
| `AddressValidFrom` | ADRC-DATE_FROM | - | copy |
| `AddressVersion` | ADRC-NATION | - | copy |
| `AddressValidTo` | ADRC-DATE_TO | - | copy |
| `AddressName1` | ADRC-NAME1 | - | copy |
| `AddressName2` | ADRC-NAME2 | - | copy |
| `AddressName3` | ADRC-NAME3 | - | copy |
| `AddressName4` | ADRC-NAME4 | - | copy |
| `AddressStreet` | ADRC-STREET | - | copy |
| `AddressHouseNumber` | ADRC-HOUSE_NUM1 | - | copy |
| `AddressHouseNumberSupplement` | ADRC-HOUSE_NUM2 | - | copy |
| `AddressCity` | ADRC-CITY1 | - | copy |
| `AddressDistrict` | ADRC-CITY2 | - | copy |
| `AddressPostalCode` | ADRC-POST_CODE1 | - | copy |
| `AddressPOBox` | ADRC-PO_BOX | - | copy |
| `AddressPOBoxPostalCode` | ADRC-POST_CODE2 | - | copy |
| `AddressCountry` | ADRC-COUNTRY | - | copy |
| `AddressRegion` | ADRC-REGION | - | copy |
| `AddressLanguage` | ADRC-LANGU | - | copy |

## `ZSDX_C_SalesLongTextMig`

- Source: `ZSDX_I_SalesLongText`
- Keys: `TextObject`, `TextName`, `TextID`, `Language`
- Scope: `all rows`
- Delivery mode: **reference**
- Before posting: SAPscript index only. Populate the explicit full text-key to business-owner link file from the source text editor/application metadata, run the text_scope preparation step against selected masters, then READ_TEXT to retrieve ordered formatted lines. Never infer the business owner from a TDNAME substring or post compressed STXL data.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `TextObject` | STXH-TDOBJECT | - | copy |
| `TextName` | STXH-TDNAME | - | copy |
| `TextID` | STXH-TDID | - | copy |
| `Language` | STXH-TDSPRAS | - | copy |

## Source controls

- Source count view: `ZSDX_C_SalesOrderMigCount`

## Open gaps

- Open sales scope must resolve item rejection, delivery and billing status, document flow and remaining quantities. Historical deliveries and billing documents are reference data; recreating them can trigger accounting or logistics. Partners, pricing, texts and tax need explicit target interfaces and agreed key maps. Do not infer open status from VBAK alone.
