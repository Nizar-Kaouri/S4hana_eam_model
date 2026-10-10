# Migration interface: goods_movement

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been run on a system.

- **Read by:** customer-selected supported posting interface; reference data is not posted
- **Load after:** `product`
- **Business key:** `MaterialDocument`, `MaterialDocumentYear` · numbering **keep**
- **Key rule:** Preserve source identifiers in an audit ledger; map regenerated internal IDs and target numbering. Never assume internal IDs survive migration.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZMMX_C_MatDocHeaderMig`

- Source: `ZMMX_I_MatDocHeader`
- Keys: `MaterialDocument`, `MaterialDocumentYear`
- Scope: `all rows`
- Delivery mode: **reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Stock is a frozen, reconciled inventory population, including batch and special stock. MARD quantities alone do not establish complete inventory. Physical inventory, valuation, units and currency conversion need business sign-off. Historical goods movements are reference data. Open purchasing scope requires item status, receipts, invoices, deletion, returns and remaining quantities; it is not inferred from the header alone.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `MaterialDocument` | MKPF-MBLNR | customer interface field: MaterialDocument (unconfirmed) | information only | yes |
| `MaterialDocumentYear` | MKPF-MJAHR | customer interface field: MaterialDocumentYear (unconfirmed) | information only | yes |
| `DocumentDate` | MKPF-BLDAT | customer interface field: DocumentDate (unconfirmed) | information only | yes |
| `PostingDate` | MKPF-BUDAT | customer interface field: PostingDate (unconfirmed) | information only | yes |
| `ReferenceDocument` | MKPF-XBLNR | customer interface field: ReferenceDocument (unconfirmed) | information only | yes |

## `ZMMX_C_MatDocItemMig`

- Source: `ZMMX_I_MatDocItem`
- Keys: `MaterialDocument`, `MaterialDocumentYear`, `MaterialDocumentItem`
- Scope: `all rows`
- Delivery mode: **reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Stock is a frozen, reconciled inventory population, including batch and special stock. MARD quantities alone do not establish complete inventory. Physical inventory, valuation, units and currency conversion need business sign-off. Historical goods movements are reference data. Open purchasing scope requires item status, receipts, invoices, deletion, returns and remaining quantities; it is not inferred from the header alone.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `MaterialDocument` | MSEG-MBLNR | customer interface field: MaterialDocument (unconfirmed) | information only | yes |
| `MaterialDocumentYear` | MSEG-MJAHR | customer interface field: MaterialDocumentYear (unconfirmed) | information only | yes |
| `MaterialDocumentItem` | MSEG-ZEILE | customer interface field: MaterialDocumentItem (unconfirmed) | information only | yes |
| `Product` | MSEG-MATNR | customer interface field: Product (unconfirmed) | information only | yes |
| `Plant` | MSEG-WERKS | customer interface field: Plant (unconfirmed) | information only | yes |
| `StorageLocation` | MSEG-LGORT | customer interface field: StorageLocation (unconfirmed) | information only | yes |
| `GoodsMovementType` | MSEG-BWART | customer interface field: GoodsMovementType (unconfirmed) | information only | yes |
| `Quantity` | MSEG-MENGE | customer interface field: Quantity (unconfirmed) | information only | yes |
| `Unit` | MSEG-MEINS | customer interface field: Unit (unconfirmed) | information only | yes |
| `LocalAmount` | MSEG-DMBTR | customer interface field: LocalAmount (unconfirmed) | information only | yes |
| `DebitCreditCode` | MSEG-SHKZG | customer interface field: DebitCreditCode (unconfirmed) | information only | yes |

## Reconciliation

- Counts: `ZMMX_C_MatDocHeaderMigCount` (ECC) vs `-` (S/4HANA) per `MaterialDocument`

```bash
python3 tools/mig_reconcile.py counts --product mm_mig_ecc --module goods_movement --source ecc_counts.csv --target s4_counts.csv
```

## Open gaps

- Stock is a frozen, reconciled inventory population, including batch and special stock. MARD quantities alone do not establish complete inventory. Physical inventory, valuation, units and currency conversion need business sign-off. Historical goods movements are reference data. Open purchasing scope requires item status, receipts, invoices, deletion, returns and remaining quantities; it is not inferred from the header alone.
