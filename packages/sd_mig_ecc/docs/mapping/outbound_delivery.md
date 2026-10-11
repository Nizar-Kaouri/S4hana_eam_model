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
| `ItemShortText` | LIPS-ARKTX | - | copy |  |
| `Batch` | LIPS-CHARG | - | copy |  |

## `ZSDX_C_DeliveryPartnerMig`

- Source: `ZSDX_I_DeliveryPartner`
- Keys: `DeliveryDocument`, `DeliveryDocumentItem`, `PartnerFunction`
- Scope: `all rows`
- Delivery mode: **posting**
- Before posting: Preserve full keys and the selected parent population. Technical source IDs are references; SAP generates target IDs. Use supported SAP business interfaces; system statuses and address versions are reference data, not direct table posting payloads.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `DeliveryDocument` | VBPA-VBELN | - | copy |  |
| `DeliveryDocumentItem` | VBPA-POSNR | - | copy |  |
| `PartnerFunction` | VBPA-PARVW | - | copy |  |
| `Customer` | VBPA-KUNNR | - | copy |  |
| `Supplier` | VBPA-LIFNR | - | copy |  |
| `PersonnelNumber` | VBPA-PERNR | - | copy |  |
| `AddressNumber` | VBPA-ADRNR | - | information only |  |
| `AddressValidTo` | ADRC-DATE_TO | - | copy |  |
| `AddressName1` | ADRC-NAME1 | - | copy |  |
| `AddressName2` | ADRC-NAME2 | - | copy |  |
| `AddressName3` | ADRC-NAME3 | - | copy |  |
| `AddressName4` | ADRC-NAME4 | - | copy |  |
| `AddressStreet` | ADRC-STREET | - | copy |  |
| `AddressHouseNumber` | ADRC-HOUSE_NUM1 | - | copy |  |
| `AddressHouseNumberSupplement` | ADRC-HOUSE_NUM2 | - | copy |  |
| `AddressCity` | ADRC-CITY1 | - | copy |  |
| `AddressDistrict` | ADRC-CITY2 | - | copy |  |
| `AddressPostalCode` | ADRC-POST_CODE1 | - | copy |  |
| `AddressPOBox` | ADRC-PO_BOX | - | copy |  |
| `AddressPOBoxPostalCode` | ADRC-POST_CODE2 | - | copy |  |
| `AddressCountry` | ADRC-COUNTRY | - | copy |  |
| `AddressRegion` | ADRC-REGION | - | copy |  |
| `AddressLanguage` | ADRC-LANGU | - | copy |  |
| `HasStandardAddress` | derived: presence of the standard ADRC record | - | information only |  |

## `ZSDX_C_DeliveryPartnerAddrMig`

- Source: `ZSDX_I_DeliveryPartnerAddr`
- Keys: `DeliveryDocument`, `DeliveryDocumentItem`, `PartnerFunction`, `AddressValidFrom`, `AddressVersion`
- Scope: `all rows`
- Delivery mode: **reference**
- Before posting: Preserve full keys and the selected parent population. Technical source IDs are references; SAP generates target IDs. Use supported SAP business interfaces; system statuses and address versions are reference data, not direct table posting payloads.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `DeliveryDocument` | VBPA-VBELN | - | copy |  |
| `DeliveryDocumentItem` | VBPA-POSNR | - | copy |  |
| `PartnerFunction` | VBPA-PARVW | - | copy |  |
| `AddressNumber` | ADRC-ADDRNUMBER | - | information only |  |
| `AddressValidFrom` | ADRC-DATE_FROM | - | copy |  |
| `AddressVersion` | ADRC-NATION | - | copy |  |
| `AddressValidTo` | ADRC-DATE_TO | - | copy |  |
| `AddressName1` | ADRC-NAME1 | - | copy |  |
| `AddressName2` | ADRC-NAME2 | - | copy |  |
| `AddressName3` | ADRC-NAME3 | - | copy |  |
| `AddressName4` | ADRC-NAME4 | - | copy |  |
| `AddressStreet` | ADRC-STREET | - | copy |  |
| `AddressHouseNumber` | ADRC-HOUSE_NUM1 | - | copy |  |
| `AddressHouseNumberSupplement` | ADRC-HOUSE_NUM2 | - | copy |  |
| `AddressCity` | ADRC-CITY1 | - | copy |  |
| `AddressDistrict` | ADRC-CITY2 | - | copy |  |
| `AddressPostalCode` | ADRC-POST_CODE1 | - | copy |  |
| `AddressPOBox` | ADRC-PO_BOX | - | copy |  |
| `AddressPOBoxPostalCode` | ADRC-POST_CODE2 | - | copy |  |
| `AddressCountry` | ADRC-COUNTRY | - | copy |  |
| `AddressRegion` | ADRC-REGION | - | copy |  |
| `AddressLanguage` | ADRC-LANGU | - | copy |  |

## `ZSDX_C_DeliveryStatusMig`

- Source: `ZSDX_I_DeliveryStatus`
- Keys: `DeliveryDocument`
- Scope: `all rows`
- Delivery mode: **reference**
- Before posting: Preserve full keys and the selected parent population. Technical source IDs are references; SAP generates target IDs. Use supported SAP business interfaces; system statuses and address versions are reference data, not direct table posting payloads.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `DeliveryDocument` | VBUK-VBELN | - | copy |  |
| `OverallProcessingStatus` | VBUK-GBSTK | - | copy |  |
| `GoodsMovementStatus` | VBUK-WBSTK | - | copy |  |
| `PickingStatus` | VBUK-KOSTK | - | copy |  |
| `BillingStatus` | VBUK-FKSTK | - | copy |  |

## `ZSDX_C_DlvItemStatusMig`

- Source: `ZSDX_I_DlvItemStatus`
- Keys: `DeliveryDocument`, `DeliveryDocumentItem`
- Scope: `all rows`
- Delivery mode: **reference**
- Before posting: Preserve full keys and the selected parent population. Technical source IDs are references; SAP generates target IDs. Use supported SAP business interfaces; system statuses and address versions are reference data, not direct table posting payloads.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `DeliveryDocument` | VBUP-VBELN | - | copy |  |
| `DeliveryDocumentItem` | VBUP-POSNR | - | copy |  |
| `OverallProcessingStatus` | VBUP-GBSTA | - | copy |  |
| `GoodsMovementStatus` | VBUP-WBSTA | - | copy |  |
| `PickingStatus` | VBUP-KOSTA | - | copy |  |
| `BillingStatus` | VBUP-FKSTA | - | copy |  |

## `ZSDX_C_DeliveryLongTextMig`

- Source: `ZSDX_I_DeliveryLongText`
- Keys: `TextObject`, `TextName`, `TextID`, `Language`
- Scope: `all rows`
- Delivery mode: **reference**
- Before posting: SAPscript index only. Populate the explicit full text-key to business-owner link file from the source text editor/application metadata, run the text_scope preparation step against selected masters, then READ_TEXT to retrieve ordered formatted lines. Never infer the business owner from a TDNAME substring or post compressed STXL data.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `TextObject` | STXH-TDOBJECT | - | copy |  |
| `TextName` | STXH-TDNAME | - | copy |  |
| `TextID` | STXH-TDID | - | copy |  |
| `Language` | STXH-TDSPRAS | - | copy |  |

## Reconciliation

- Counts: `ZSDX_C_DeliveryMigCount` (ECC) vs `ZSDT_I_DeliveryCount` (S/4HANA) per `DeliveryDocument`
- Records and fields: `ZSDX_C_DeliveryMig` vs `ZSDT_B_DeliveryCompare` on `DeliveryDocument`; compared: `DeliveryDocumentType`, `ShippingPoint`, `ShipToParty`

```bash
python3 tools/mig_reconcile.py counts --product sd_mig_ecc --module outbound_delivery --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --product sd_mig_ecc --module outbound_delivery --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- Open sales scope must resolve item rejection, delivery and billing status, document flow and remaining quantities. Historical deliveries and billing documents are reference data; recreating them can trigger accounting or logistics. Partners, pricing, texts and tax need explicit target interfaces and agreed key maps. Do not infer open status from VBAK alone.
