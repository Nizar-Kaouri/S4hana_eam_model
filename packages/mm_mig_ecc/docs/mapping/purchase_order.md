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

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `PurchaseOrder` | EKKO-EBELN | customer interface field: PurchaseOrder (unconfirmed) | copy | yes |
| `CompanyCode` | EKKO-BUKRS | customer interface field: CompanyCode (unconfirmed) | copy | yes |
| `PurchaseOrderType` | EKKO-BSART | customer interface field: PurchaseOrderType (unconfirmed) | copy | yes |
| `Supplier` | EKKO-LIFNR | customer interface field: Supplier (unconfirmed) | copy | yes |
| `PurchasingOrganization` | EKKO-EKORG | customer interface field: PurchasingOrganization (unconfirmed) | copy | yes |
| `PurchasingGroup` | EKKO-EKGRP | customer interface field: PurchasingGroup (unconfirmed) | copy | yes |
| `DocumentCurrency` | EKKO-WAERS | customer interface field: DocumentCurrency (unconfirmed) | copy | yes |

## `ZMMX_C_PurchaseItemMig`

- Source: `ZMMX_I_PurchaseItem`
- Keys: `PurchaseOrder`, `PurchaseOrderItem`
- Scope: `all rows`
- Delivery mode: **open-document**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Stock is a frozen, reconciled inventory population, including batch and special stock. MARD quantities alone do not establish complete inventory. Physical inventory, valuation, units and currency conversion need business sign-off. Historical goods movements are reference data. Open purchasing scope requires item status, receipts, invoices, deletion, returns and remaining quantities; it is not inferred from the header alone.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `PurchaseOrder` | EKPO-EBELN | customer interface field: PurchaseOrder (unconfirmed) | copy | yes |
| `PurchaseOrderItem` | EKPO-EBELP | customer interface field: PurchaseOrderItem (unconfirmed) | copy | yes |
| `Material` | EKPO-MATNR | customer interface field: Material (unconfirmed) | copy | yes |
| `Plant` | EKPO-WERKS | customer interface field: Plant (unconfirmed) | copy | yes |
| `OrderQuantity` | EKPO-MENGE | customer interface field: OrderQuantity (unconfirmed) | copy | yes |
| `OrderUnit` | EKPO-MEINS | customer interface field: OrderUnit (unconfirmed) | copy | yes |
| `DeletionFlag` | EKPO-LOEKZ | customer interface field: DeletionFlag (unconfirmed) | copy | yes |
| `DeliveryCompleted` | EKPO-ELIKZ | customer interface field: DeliveryCompleted (unconfirmed) | copy | yes |
| `FinalInvoice` | EKPO-EREKZ | customer interface field: FinalInvoice (unconfirmed) | copy | yes |

## `ZMMX_C_PurchaseScheduMig`

- Source: `ZMMX_I_PurchaseSchedu`
- Keys: `PurchaseOrder`, `PurchaseOrderItem`, `ScheduleLine`
- Scope: `all rows`
- Delivery mode: **open-document**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Stock is a frozen, reconciled inventory population, including batch and special stock. MARD quantities alone do not establish complete inventory. Physical inventory, valuation, units and currency conversion need business sign-off. Historical goods movements are reference data. Open purchasing scope requires item status, receipts, invoices, deletion, returns and remaining quantities; it is not inferred from the header alone.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `PurchaseOrder` | EKET-EBELN | customer interface field: PurchaseOrder (unconfirmed) | copy | yes |
| `PurchaseOrderItem` | EKET-EBELP | customer interface field: PurchaseOrderItem (unconfirmed) | copy | yes |
| `ScheduleLine` | EKET-ETENR | customer interface field: ScheduleLine (unconfirmed) | copy | yes |
| `DeliveryDate` | EKET-EINDT | customer interface field: DeliveryDate (unconfirmed) | copy | yes |
| `ScheduledQuantity` | EKET-MENGE | customer interface field: ScheduledQuantity (unconfirmed) | copy | yes |
| `ReceivedQuantity` | EKET-WEMNG | customer interface field: ReceivedQuantity (unconfirmed) | copy | yes |

## `ZMMX_C_PurchaseAssignMig`

- Source: `ZMMX_I_PurchaseAssign`
- Keys: `PurchaseOrder`, `PurchaseOrderItem`, `AccountAssignmentNumber`
- Scope: `all rows`
- Delivery mode: **open-document**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Stock is a frozen, reconciled inventory population, including batch and special stock. MARD quantities alone do not establish complete inventory. Physical inventory, valuation, units and currency conversion need business sign-off. Historical goods movements are reference data. Open purchasing scope requires item status, receipts, invoices, deletion, returns and remaining quantities; it is not inferred from the header alone.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `PurchaseOrder` | EKKN-EBELN | customer interface field: PurchaseOrder (unconfirmed) | copy | yes |
| `PurchaseOrderItem` | EKKN-EBELP | customer interface field: PurchaseOrderItem (unconfirmed) | copy | yes |
| `AccountAssignmentNumber` | EKKN-ZEKKN | customer interface field: AccountAssignmentNumber (unconfirmed) | copy | yes |
| `CostCenter` | EKKN-KOSTL | customer interface field: CostCenter (unconfirmed) | copy | yes |
| `OrderID` | EKKN-AUFNR | customer interface field: OrderID (unconfirmed) | copy | yes |
| `GLAccount` | EKKN-SAKTO | customer interface field: GLAccount (unconfirmed) | copy | yes |
| `WBSElementInternalID` | EKKN-PS_PSP_PNR | customer interface field: WBSElementInternalID (unconfirmed) | copy | yes |

## `ZMMX_C_PurchaseHistorMig`

- Source: `ZMMX_I_PurchaseHistor`
- Keys: `PurchaseOrder`, `PurchaseOrderItem`, `AccountAssignmentNumber`, `HistoryCategory`, `FiscalYear`, `DocumentNumber`, `DocumentItem`
- Scope: `all rows`
- Delivery mode: **open-document**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Stock is a frozen, reconciled inventory population, including batch and special stock. MARD quantities alone do not establish complete inventory. Physical inventory, valuation, units and currency conversion need business sign-off. Historical goods movements are reference data. Open purchasing scope requires item status, receipts, invoices, deletion, returns and remaining quantities; it is not inferred from the header alone.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `PurchaseOrder` | EKBE-EBELN | customer interface field: PurchaseOrder (unconfirmed) | copy | yes |
| `PurchaseOrderItem` | EKBE-EBELP | customer interface field: PurchaseOrderItem (unconfirmed) | copy | yes |
| `AccountAssignmentNumber` | EKBE-ZEKKN | customer interface field: AccountAssignmentNumber (unconfirmed) | copy | yes |
| `HistoryCategory` | EKBE-VGABE | customer interface field: HistoryCategory (unconfirmed) | copy | yes |
| `FiscalYear` | EKBE-GJAHR | customer interface field: FiscalYear (unconfirmed) | copy | yes |
| `DocumentNumber` | EKBE-BELNR | customer interface field: DocumentNumber (unconfirmed) | copy | yes |
| `DocumentItem` | EKBE-BUZEI | customer interface field: DocumentItem (unconfirmed) | copy | yes |
| `PostingDate` | EKBE-BUDAT | customer interface field: PostingDate (unconfirmed) | copy | yes |
| `Quantity` | EKBE-MENGE | customer interface field: Quantity (unconfirmed) | copy | yes |
| `DebitCreditCode` | EKBE-SHKZG | customer interface field: DebitCreditCode (unconfirmed) | copy | yes |

## Reconciliation

- Counts: `ZMMX_C_PurchaseOrderMigCount` (ECC) vs `ZMMT_I_PurchaseOrderCount` (S/4HANA) per `PurchaseOrder`
- Records and fields: `ZMMX_C_PurchaseOrderMig` vs `ZMMT_I_PurchaseOrderCompare` on `PurchaseOrder`; compared: `CompanyCode`, `PurchaseOrderType`, `Supplier`, `PurchasingOrganization`, `PurchasingGroup`, `DocumentCurrency`

```bash
python3 tools/mig_reconcile.py counts --product mm_mig_ecc --module purchase_order --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --product mm_mig_ecc --module purchase_order --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- Stock is a frozen, reconciled inventory population, including batch and special stock. MARD quantities alone do not establish complete inventory. Physical inventory, valuation, units and currency conversion need business sign-off. Historical goods movements are reference data. Open purchasing scope requires item status, receipts, invoices, deletion, returns and remaining quantities; it is not inferred from the header alone.
