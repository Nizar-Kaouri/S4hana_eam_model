# Migration interface: purchasing_contract

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been run on a system.

- **Read by:** Customer-verified business interface; open-document restrictions apply
- **Load after:** `product`
- **Business key:** `PurchasingContract` · numbering **keep**
- **Key rule:** Preserve source identifiers in an audit ledger; map regenerated internal IDs and target numbering. Never assume internal IDs survive migration.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZMMX_C_ContractHeaderMig`

- Source: `ZMMX_I_ContractHeader`
- Keys: `PurchasingContract`
- Scope: `all rows`
- Delivery mode: **open-document**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Stock is a frozen, reconciled inventory population, including batch and special stock. MARD quantities alone do not establish complete inventory. Physical inventory, valuation, units and currency conversion need business sign-off. Historical goods movements are reference data. Open purchasing scope requires item status, receipts, invoices, deletion, returns and remaining quantities; it is not inferred from the header alone. Select EKKO document category K and approved contract types; exclude purchase orders and scheduling agreements. Verify validity, value versus quantity contract, remaining target obligation and releases against the contract. Link account assignments and time-dependent conditions; release history is evidence, not a second purchase-order load. Supplier, CO/PS and account mappings require cross-domain approval.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `PurchasingContract` | EKKO-EBELN | customer interface field: PurchasingContract (unconfirmed) | copy | yes |
| `PurchasingDocumentCategory` | EKKO-BSTYP | customer interface field: PurchasingDocumentCategory (unconfirmed) | copy | yes |
| `ContractType` | EKKO-BSART | customer interface field: ContractType (unconfirmed) | copy | yes |
| `CompanyCode` | EKKO-BUKRS | customer interface field: CompanyCode (unconfirmed) | copy | yes |
| `Supplier` | EKKO-LIFNR | customer interface field: Supplier (unconfirmed) | copy | yes |
| `PurchasingOrganization` | EKKO-EKORG | customer interface field: PurchasingOrganization (unconfirmed) | copy | yes |
| `PurchasingGroup` | EKKO-EKGRP | customer interface field: PurchasingGroup (unconfirmed) | copy | yes |
| `Currency` | EKKO-WAERS | customer interface field: Currency (unconfirmed) | copy | yes |
| `ValidityStartDate` | EKKO-KDATB | customer interface field: ValidityStartDate (unconfirmed) | copy | yes |
| `ValidityEndDate` | EKKO-KDATE | customer interface field: ValidityEndDate (unconfirmed) | copy | yes |

## `ZMMX_C_ContractItemMig`

- Source: `ZMMX_I_ContractItem`
- Keys: `PurchasingContract`, `PurchasingContractItem`
- Scope: `all rows`
- Delivery mode: **open-document**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Stock is a frozen, reconciled inventory population, including batch and special stock. MARD quantities alone do not establish complete inventory. Physical inventory, valuation, units and currency conversion need business sign-off. Historical goods movements are reference data. Open purchasing scope requires item status, receipts, invoices, deletion, returns and remaining quantities; it is not inferred from the header alone. Select EKKO document category K and approved contract types; exclude purchase orders and scheduling agreements. Verify validity, value versus quantity contract, remaining target obligation and releases against the contract. Link account assignments and time-dependent conditions; release history is evidence, not a second purchase-order load. Supplier, CO/PS and account mappings require cross-domain approval.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `PurchasingContract` | EKPO-EBELN | customer interface field: PurchasingContract (unconfirmed) | copy | yes |
| `PurchasingContractItem` | EKPO-EBELP | customer interface field: PurchasingContractItem (unconfirmed) | copy | yes |
| `Product` | EKPO-MATNR | customer interface field: Product (unconfirmed) | copy | yes |
| `Plant` | EKPO-WERKS | customer interface field: Plant (unconfirmed) | copy | yes |
| `TargetQuantity` | EKPO-KTMNG | customer interface field: TargetQuantity (unconfirmed) | copy | yes |
| `OrderUnit` | EKPO-MEINS | customer interface field: OrderUnit (unconfirmed) | copy | yes |
| `NetPrice` | EKPO-NETPR | customer interface field: NetPrice (unconfirmed) | copy | yes |
| `PriceUnit` | EKPO-PEINH | customer interface field: PriceUnit (unconfirmed) | copy | yes |
| `DeletionFlag` | EKPO-LOEKZ | customer interface field: DeletionFlag (unconfirmed) | copy | yes |

## `ZMMX_C_ContractAssignMig`

- Source: `ZMMX_I_ContractAssign`
- Keys: `PurchasingContract`, `PurchasingContractItem`, `AccountAssignmentNumber`
- Scope: `all rows`
- Delivery mode: **open-document**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Stock is a frozen, reconciled inventory population, including batch and special stock. MARD quantities alone do not establish complete inventory. Physical inventory, valuation, units and currency conversion need business sign-off. Historical goods movements are reference data. Open purchasing scope requires item status, receipts, invoices, deletion, returns and remaining quantities; it is not inferred from the header alone. Select EKKO document category K and approved contract types; exclude purchase orders and scheduling agreements. Verify validity, value versus quantity contract, remaining target obligation and releases against the contract. Link account assignments and time-dependent conditions; release history is evidence, not a second purchase-order load. Supplier, CO/PS and account mappings require cross-domain approval.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `PurchasingContract` | EKKN-EBELN | customer interface field: PurchasingContract (unconfirmed) | copy | yes |
| `PurchasingContractItem` | EKKN-EBELP | customer interface field: PurchasingContractItem (unconfirmed) | copy | yes |
| `AccountAssignmentNumber` | EKKN-ZEKKN | customer interface field: AccountAssignmentNumber (unconfirmed) | copy | yes |
| `CostCenter` | EKKN-KOSTL | customer interface field: CostCenter (unconfirmed) | copy | yes |
| `InternalOrder` | EKKN-AUFNR | customer interface field: InternalOrder (unconfirmed) | copy | yes |
| `WBSElementInternalID` | EKKN-PS_PSP_PNR | customer interface field: WBSElementInternalID (unconfirmed) | copy | yes |
| `GLAccount` | EKKN-SAKTO | customer interface field: GLAccount (unconfirmed) | copy | yes |
| `DistributionPercentage` | EKKN-VPROZ | customer interface field: DistributionPercentage (unconfirmed) | copy | yes |

## Reconciliation

- Counts: `ZMMX_C_ContractHeaderMigCount` (ECC) vs `-` (S/4HANA) per `PurchasingContract`

```bash
python3 tools/mig_reconcile.py counts --product mm_mig_ecc --module purchasing_contract --source ecc_counts.csv --target s4_counts.csv
```

## Open gaps

- Stock is a frozen, reconciled inventory population, including batch and special stock. MARD quantities alone do not establish complete inventory. Physical inventory, valuation, units and currency conversion need business sign-off. Historical goods movements are reference data. Open purchasing scope requires item status, receipts, invoices, deletion, returns and remaining quantities; it is not inferred from the header alone.
- Select EKKO document category K and approved contract types; exclude purchase orders and scheduling agreements. Verify validity, value versus quantity contract, remaining target obligation and releases against the contract. Link account assignments and time-dependent conditions; release history is evidence, not a second purchase-order load. Supplier, CO/PS and account mappings require cross-domain approval.
