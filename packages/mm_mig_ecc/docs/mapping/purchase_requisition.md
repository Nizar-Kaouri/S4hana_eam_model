# Migration interface: purchase_requisition

> Version **1.0.0**

- **Read by:** customer-selected supported posting interface; reference data is not posted
- **Load after:** `product`
- **Business key:** `PurchaseRequisition`, `PurchaseRequisitionItem` · numbering **keep**
- **Key rule:** Preserve source identifiers in an audit ledger; map regenerated internal IDs and target numbering. Never assume internal IDs survive migration.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZMMX_C_RequisitionMig`

- Source: `ZMMX_I_Requisition`
- Keys: `PurchaseRequisition`, `PurchaseRequisitionItem`
- Scope: `all rows`
- Delivery mode: **open-document**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Stock is a frozen, reconciled inventory population, including batch and special stock. MARD quantities alone do not establish complete inventory. Physical inventory, valuation, units and currency conversion need business sign-off. Historical goods movements are reference data. Open purchasing scope requires item status, receipts, invoices, deletion, returns and remaining quantities; it is not inferred from the header alone.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `PurchaseRequisition` | EBAN-BANFN | customer interface field: PurchaseRequisition (unconfirmed) | copy |
| `PurchaseRequisitionItem` | EBAN-BNFPO | customer interface field: PurchaseRequisitionItem (unconfirmed) | copy |
| `Material` | EBAN-MATNR | customer interface field: Material (unconfirmed) | copy |
| `Plant` | EBAN-WERKS | customer interface field: Plant (unconfirmed) | copy |
| `RequestedQuantity` | EBAN-MENGE | customer interface field: RequestedQuantity (unconfirmed) | copy |
| `Unit` | EBAN-MEINS | customer interface field: Unit (unconfirmed) | copy |
| `DeletionFlag` | EBAN-LOEKZ | customer interface field: DeletionFlag (unconfirmed) | copy |
| `ClosedFlag` | EBAN-EBAKZ | customer interface field: ClosedFlag (unconfirmed) | copy |

## `ZMMX_C_ReqAssignmentMig`

- Source: `ZMMX_I_ReqAssignment`
- Keys: `PurchaseRequisition`, `PurchaseRequisitionItem`, `AccountAssignmentNumber`
- Scope: `all rows`
- Delivery mode: **open-document**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Stock is a frozen, reconciled inventory population, including batch and special stock. MARD quantities alone do not establish complete inventory. Physical inventory, valuation, units and currency conversion need business sign-off. Historical goods movements are reference data. Open purchasing scope requires item status, receipts, invoices, deletion, returns and remaining quantities; it is not inferred from the header alone.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `PurchaseRequisition` | EBKN-BANFN | customer interface field: PurchaseRequisition (unconfirmed) | copy |
| `PurchaseRequisitionItem` | EBKN-BNFPO | customer interface field: PurchaseRequisitionItem (unconfirmed) | copy |
| `AccountAssignmentNumber` | EBKN-ZEBKN | customer interface field: AccountAssignmentNumber (unconfirmed) | copy |
| `CostCenter` | EBKN-KOSTL | customer interface field: CostCenter (unconfirmed) | copy |
| `OrderID` | EBKN-AUFNR | customer interface field: OrderID (unconfirmed) | copy |
| `GLAccount` | EBKN-SAKTO | customer interface field: GLAccount (unconfirmed) | copy |
| `WBSElementInternalID` | EBKN-PS_PSP_PNR | customer interface field: WBSElementInternalID (unconfirmed) | copy |

## `ZMMX_C_RequisitionLongTextMig`

- Source: `ZMMX_I_RequisitionLongText`
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

- Source count view: `ZMMX_C_RequisitionMigCount`

## Open gaps

- Stock is a frozen, reconciled inventory population, including batch and special stock. MARD quantities alone do not establish complete inventory. Physical inventory, valuation, units and currency conversion need business sign-off. Historical goods movements are reference data. Open purchasing scope requires item status, receipts, invoices, deletion, returns and remaining quantities; it is not inferred from the header alone.
