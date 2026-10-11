# Migration interface: purchase_order

> Version **1.0.0**

- **Read by:** customer-selected supported posting interface; reference data is not posted
- **Load after:** `product`
- **Business key:** `PurchaseOrder` · numbering **keep**
- **Key rule:** Preserve source identifiers in an audit ledger; map regenerated internal IDs and target numbering. Never assume internal IDs survive migration.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZMMX_C_PurchaseOrderMig`

- Source: `ZMMX_I_PurchaseOrder`
- Keys: `PurchaseOrder`
- Scope: `all rows`
- Delivery mode: **open-document**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Stock is a frozen, reconciled inventory population, including batch and special stock. MARD quantities alone do not establish complete inventory. Physical inventory, valuation, units and currency conversion need business sign-off. Historical goods movements are reference data. Open purchasing scope requires item status, receipts, invoices, deletion, returns and remaining quantities; it is not inferred from the header alone.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `PurchaseOrder` | EKKO-EBELN | customer interface field: PurchaseOrder (unconfirmed) | copy |
| `CompanyCode` | EKKO-BUKRS | customer interface field: CompanyCode (unconfirmed) | copy |
| `PurchaseOrderType` | EKKO-BSART | customer interface field: PurchaseOrderType (unconfirmed) | copy |
| `Supplier` | EKKO-LIFNR | customer interface field: Supplier (unconfirmed) | copy |
| `PurchasingOrganization` | EKKO-EKORG | customer interface field: PurchasingOrganization (unconfirmed) | copy |
| `PurchasingGroup` | EKKO-EKGRP | customer interface field: PurchasingGroup (unconfirmed) | copy |
| `DocumentCurrency` | EKKO-WAERS | customer interface field: DocumentCurrency (unconfirmed) | copy |

## `ZMMX_C_PurchaseItemMig`

- Source: `ZMMX_I_PurchaseItem`
- Keys: `PurchaseOrder`, `PurchaseOrderItem`
- Scope: `all rows`
- Delivery mode: **open-document**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Stock is a frozen, reconciled inventory population, including batch and special stock. MARD quantities alone do not establish complete inventory. Physical inventory, valuation, units and currency conversion need business sign-off. Historical goods movements are reference data. Open purchasing scope requires item status, receipts, invoices, deletion, returns and remaining quantities; it is not inferred from the header alone.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `PurchaseOrder` | EKPO-EBELN | customer interface field: PurchaseOrder (unconfirmed) | copy |
| `PurchaseOrderItem` | EKPO-EBELP | customer interface field: PurchaseOrderItem (unconfirmed) | copy |
| `Material` | EKPO-MATNR | customer interface field: Material (unconfirmed) | copy |
| `Plant` | EKPO-WERKS | customer interface field: Plant (unconfirmed) | copy |
| `OrderQuantity` | EKPO-MENGE | customer interface field: OrderQuantity (unconfirmed) | copy |
| `OrderUnit` | EKPO-MEINS | customer interface field: OrderUnit (unconfirmed) | copy |
| `DeletionFlag` | EKPO-LOEKZ | customer interface field: DeletionFlag (unconfirmed) | copy |
| `DeliveryCompleted` | EKPO-ELIKZ | customer interface field: DeliveryCompleted (unconfirmed) | copy |
| `FinalInvoice` | EKPO-EREKZ | customer interface field: FinalInvoice (unconfirmed) | copy |

## `ZMMX_C_PurchaseScheduMig`

- Source: `ZMMX_I_PurchaseSchedu`
- Keys: `PurchaseOrder`, `PurchaseOrderItem`, `ScheduleLine`
- Scope: `all rows`
- Delivery mode: **open-document**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Stock is a frozen, reconciled inventory population, including batch and special stock. MARD quantities alone do not establish complete inventory. Physical inventory, valuation, units and currency conversion need business sign-off. Historical goods movements are reference data. Open purchasing scope requires item status, receipts, invoices, deletion, returns and remaining quantities; it is not inferred from the header alone.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `PurchaseOrder` | EKET-EBELN | customer interface field: PurchaseOrder (unconfirmed) | copy |
| `PurchaseOrderItem` | EKET-EBELP | customer interface field: PurchaseOrderItem (unconfirmed) | copy |
| `ScheduleLine` | EKET-ETENR | customer interface field: ScheduleLine (unconfirmed) | copy |
| `DeliveryDate` | EKET-EINDT | customer interface field: DeliveryDate (unconfirmed) | copy |
| `ScheduledQuantity` | EKET-MENGE | customer interface field: ScheduledQuantity (unconfirmed) | copy |
| `ReceivedQuantity` | EKET-WEMNG | customer interface field: ReceivedQuantity (unconfirmed) | copy |

## `ZMMX_C_PurchaseAssignMig`

- Source: `ZMMX_I_PurchaseAssign`
- Keys: `PurchaseOrder`, `PurchaseOrderItem`, `AccountAssignmentNumber`
- Scope: `all rows`
- Delivery mode: **open-document**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Stock is a frozen, reconciled inventory population, including batch and special stock. MARD quantities alone do not establish complete inventory. Physical inventory, valuation, units and currency conversion need business sign-off. Historical goods movements are reference data. Open purchasing scope requires item status, receipts, invoices, deletion, returns and remaining quantities; it is not inferred from the header alone.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `PurchaseOrder` | EKKN-EBELN | customer interface field: PurchaseOrder (unconfirmed) | copy |
| `PurchaseOrderItem` | EKKN-EBELP | customer interface field: PurchaseOrderItem (unconfirmed) | copy |
| `AccountAssignmentNumber` | EKKN-ZEKKN | customer interface field: AccountAssignmentNumber (unconfirmed) | copy |
| `CostCenter` | EKKN-KOSTL | customer interface field: CostCenter (unconfirmed) | copy |
| `OrderID` | EKKN-AUFNR | customer interface field: OrderID (unconfirmed) | copy |
| `GLAccount` | EKKN-SAKTO | customer interface field: GLAccount (unconfirmed) | copy |
| `WBSElementInternalID` | EKKN-PS_PSP_PNR | customer interface field: WBSElementInternalID (unconfirmed) | copy |

## `ZMMX_C_PurchaseHistorMig`

- Source: `ZMMX_I_PurchaseHistor`
- Keys: `PurchaseOrder`, `PurchaseOrderItem`, `AccountAssignmentNumber`, `HistoryCategory`, `FiscalYear`, `DocumentNumber`, `DocumentItem`
- Scope: `all rows`
- Delivery mode: **open-document**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Stock is a frozen, reconciled inventory population, including batch and special stock. MARD quantities alone do not establish complete inventory. Physical inventory, valuation, units and currency conversion need business sign-off. Historical goods movements are reference data. Open purchasing scope requires item status, receipts, invoices, deletion, returns and remaining quantities; it is not inferred from the header alone.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `PurchaseOrder` | EKBE-EBELN | customer interface field: PurchaseOrder (unconfirmed) | copy |
| `PurchaseOrderItem` | EKBE-EBELP | customer interface field: PurchaseOrderItem (unconfirmed) | copy |
| `AccountAssignmentNumber` | EKBE-ZEKKN | customer interface field: AccountAssignmentNumber (unconfirmed) | copy |
| `HistoryCategory` | EKBE-VGABE | customer interface field: HistoryCategory (unconfirmed) | copy |
| `FiscalYear` | EKBE-GJAHR | customer interface field: FiscalYear (unconfirmed) | copy |
| `DocumentNumber` | EKBE-BELNR | customer interface field: DocumentNumber (unconfirmed) | copy |
| `DocumentItem` | EKBE-BUZEI | customer interface field: DocumentItem (unconfirmed) | copy |
| `PostingDate` | EKBE-BUDAT | customer interface field: PostingDate (unconfirmed) | copy |
| `Quantity` | EKBE-MENGE | customer interface field: Quantity (unconfirmed) | copy |
| `DebitCreditCode` | EKBE-SHKZG | customer interface field: DebitCreditCode (unconfirmed) | copy |

## `ZMMX_C_PurchasePartnerMig`

- Source: `ZMMX_I_PurchasePartner`
- Keys: `PurchaseOrder`, `PurchasingOrganization`, `SupplierSubrange`, `Plant`, `PartnerFunction`, `PartnerCounter`
- Scope: `all rows`
- Delivery mode: **posting**
- Before posting: Preserve full keys and the selected parent population. Technical source IDs are references; SAP generates target IDs. Use supported SAP business interfaces; system statuses and address versions are reference data, not direct table posting payloads.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `PurchaseOrder` | EKPA-EBELN | - | copy |
| `PurchasingOrganization` | EKPA-EKORG | - | copy |
| `SupplierSubrange` | EKPA-LTSNR | - | copy |
| `Plant` | EKPA-WERKS | - | copy |
| `PartnerFunction` | EKPA-PARVW | - | copy |
| `PartnerCounter` | EKPA-PARZA | - | copy |
| `PartnerSupplier` | EKPA-LIFN2 | - | copy |
| `PartnerContact` | EKPA-PARNR | - | copy |
| `DefaultPartner` | EKPA-DEFPA | - | copy |

## `ZMMX_C_PurchaseLongTextMig`

- Source: `ZMMX_I_PurchaseLongText`
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

- Source count view: `ZMMX_C_PurchaseOrderMigCount`

## Open gaps

- Stock is a frozen, reconciled inventory population, including batch and special stock. MARD quantities alone do not establish complete inventory. Physical inventory, valuation, units and currency conversion need business sign-off. Historical goods movements are reference data. Open purchasing scope requires item status, receipts, invoices, deletion, returns and remaining quantities; it is not inferred from the header alone.
