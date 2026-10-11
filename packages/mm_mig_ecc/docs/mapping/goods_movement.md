# Migration interface: goods_movement

> Version **1.0.0**

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

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `MaterialDocument` | MKPF-MBLNR | customer interface field: MaterialDocument (unconfirmed) | information only |
| `MaterialDocumentYear` | MKPF-MJAHR | customer interface field: MaterialDocumentYear (unconfirmed) | information only |
| `DocumentDate` | MKPF-BLDAT | customer interface field: DocumentDate (unconfirmed) | information only |
| `PostingDate` | MKPF-BUDAT | customer interface field: PostingDate (unconfirmed) | information only |
| `ReferenceDocument` | MKPF-XBLNR | customer interface field: ReferenceDocument (unconfirmed) | information only |

## `ZMMX_C_MatDocItemMig`

- Source: `ZMMX_I_MatDocItem`
- Keys: `MaterialDocument`, `MaterialDocumentYear`, `MaterialDocumentItem`
- Scope: `all rows`
- Delivery mode: **reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Stock is a frozen, reconciled inventory population, including batch and special stock. MARD quantities alone do not establish complete inventory. Physical inventory, valuation, units and currency conversion need business sign-off. Historical goods movements are reference data. Open purchasing scope requires item status, receipts, invoices, deletion, returns and remaining quantities; it is not inferred from the header alone.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `MaterialDocument` | MSEG-MBLNR | customer interface field: MaterialDocument (unconfirmed) | information only |
| `MaterialDocumentYear` | MSEG-MJAHR | customer interface field: MaterialDocumentYear (unconfirmed) | information only |
| `MaterialDocumentItem` | MSEG-ZEILE | customer interface field: MaterialDocumentItem (unconfirmed) | information only |
| `Product` | MSEG-MATNR | customer interface field: Product (unconfirmed) | information only |
| `Plant` | MSEG-WERKS | customer interface field: Plant (unconfirmed) | information only |
| `StorageLocation` | MSEG-LGORT | customer interface field: StorageLocation (unconfirmed) | information only |
| `GoodsMovementType` | MSEG-BWART | customer interface field: GoodsMovementType (unconfirmed) | information only |
| `Quantity` | MSEG-MENGE | customer interface field: Quantity (unconfirmed) | information only |
| `Unit` | MSEG-MEINS | customer interface field: Unit (unconfirmed) | information only |
| `LocalAmount` | MSEG-DMBTR | customer interface field: LocalAmount (unconfirmed) | information only |
| `DebitCreditCode` | MSEG-SHKZG | customer interface field: DebitCreditCode (unconfirmed) | information only |

## Source controls

- Source count view: `ZMMX_C_MatDocHeaderMigCount`

## Open gaps

- Stock is a frozen, reconciled inventory population, including batch and special stock. MARD quantities alone do not establish complete inventory. Physical inventory, valuation, units and currency conversion need business sign-off. Historical goods movements are reference data. Open purchasing scope requires item status, receipts, invoices, deletion, returns and remaining quantities; it is not inferred from the header alone.
