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

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `PurchaseRequisition` | EBAN-BANFN | customer interface field: PurchaseRequisition (unconfirmed) | copy | yes |
| `PurchaseRequisitionItem` | EBAN-BNFPO | customer interface field: PurchaseRequisitionItem (unconfirmed) | copy | yes |
| `Material` | EBAN-MATNR | customer interface field: Material (unconfirmed) | copy | yes |
| `Plant` | EBAN-WERKS | customer interface field: Plant (unconfirmed) | copy | yes |
| `RequestedQuantity` | EBAN-MENGE | customer interface field: RequestedQuantity (unconfirmed) | copy | yes |
| `Unit` | EBAN-MEINS | customer interface field: Unit (unconfirmed) | copy | yes |
| `DeletionFlag` | EBAN-LOEKZ | customer interface field: DeletionFlag (unconfirmed) | copy | yes |
| `ClosedFlag` | EBAN-EBAKZ | customer interface field: ClosedFlag (unconfirmed) | copy | yes |

## `ZMMX_C_ReqAssignmentMig`

- Source: `ZMMX_I_ReqAssignment`
- Keys: `PurchaseRequisition`, `PurchaseRequisitionItem`, `AccountAssignmentNumber`
- Scope: `all rows`
- Delivery mode: **open-document**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Stock is a frozen, reconciled inventory population, including batch and special stock. MARD quantities alone do not establish complete inventory. Physical inventory, valuation, units and currency conversion need business sign-off. Historical goods movements are reference data. Open purchasing scope requires item status, receipts, invoices, deletion, returns and remaining quantities; it is not inferred from the header alone.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `PurchaseRequisition` | EBKN-BANFN | customer interface field: PurchaseRequisition (unconfirmed) | copy | yes |
| `PurchaseRequisitionItem` | EBKN-BNFPO | customer interface field: PurchaseRequisitionItem (unconfirmed) | copy | yes |
| `AccountAssignmentNumber` | EBKN-ZEBKN | customer interface field: AccountAssignmentNumber (unconfirmed) | copy | yes |
| `CostCenter` | EBKN-KOSTL | customer interface field: CostCenter (unconfirmed) | copy | yes |
| `OrderID` | EBKN-AUFNR | customer interface field: OrderID (unconfirmed) | copy | yes |
| `GLAccount` | EBKN-SAKTO | customer interface field: GLAccount (unconfirmed) | copy | yes |
| `WBSElementInternalID` | EBKN-PS_PSP_PNR | customer interface field: WBSElementInternalID (unconfirmed) | copy | yes |

## Reconciliation

- Counts: `ZMMX_C_RequisitionMigCount` (ECC) vs `ZMMT_I_RequisitionCount` (S/4HANA) per `PurchaseRequisition`
- Records and fields: `ZMMX_C_RequisitionMig` vs `ZMMT_I_RequisitionCompare` on `PurchaseRequisition`, `PurchaseRequisitionItem`; compared: `Material`, `Plant`

```bash
python3 tools/mig_reconcile.py counts --product mm_mig_ecc --module purchase_requisition --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --product mm_mig_ecc --module purchase_requisition --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- Stock is a frozen, reconciled inventory population, including batch and special stock. MARD quantities alone do not establish complete inventory. Physical inventory, valuation, units and currency conversion need business sign-off. Historical goods movements are reference data. Open purchasing scope requires item status, receipts, invoices, deletion, returns and remaining quantities; it is not inferred from the header alone.
