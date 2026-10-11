# Migration interface: production_confirmation

> Version **1.0.0**

- **Read by:** Customer-verified business interface; process-reference restrictions apply
- **Load after:** `production_order`, `production_order_operation`
- **Business key:** `ConfirmationNumber`, `ConfirmationCounter` · numbering **keep**
- **Key rule:** Preserve source identifiers in an audit ledger; map regenerated internal IDs and target numbering. Never assume internal IDs survive migration.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZPPX_C_ConfirmationMig`

- Source: `ZPPX_I_Confirmation`
- Keys: `ConfirmationNumber`, `ConfirmationCounter`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. BOMs and routings need key date, engineering change, usage, alternative and selected-node resolution. Preserve alternative sequences and dependencies. Production orders are process references unless the chosen target interface explicitly supports their state; confirmations, goods movements and costs must not be reposted as master data. Preserve confirmation/counter identity and reversal relationships; do not delete reversals and assume the remaining history is net yield. Target order/operation mapping and posting periods must be approved. Reposting confirmations can trigger backflush, goods movements, activity allocations and accounting; confirmation history is reference-only unless a supported process migration explicitly authorizes those effects.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `ConfirmationNumber` | AFRU-RUECK | customer interface field: ConfirmationNumber (unconfirmed) | information only | yes |
| `ConfirmationCounter` | AFRU-RMZHL | customer interface field: ConfirmationCounter (unconfirmed) | information only | yes |
| `ManufacturingOrder` | AFRU-AUFNR | customer interface field: ManufacturingOrder (unconfirmed) | information only | yes |
| `Operation` | AFRU-VORNR | customer interface field: Operation (unconfirmed) | information only | yes |
| `PostingDate` | AFRU-BUDAT | customer interface field: PostingDate (unconfirmed) | information only | yes |
| `FinalConfirmation` | AFRU-AUERU | customer interface field: FinalConfirmation (unconfirmed) | information only | yes |
| `ReversalFlag` | AFRU-STOKZ | customer interface field: ReversalFlag (unconfirmed) | information only | yes |
| `ReversalCounter` | AFRU-STZHL | customer interface field: ReversalCounter (unconfirmed) | information only | yes |
| `YieldQuantity` | AFRU-LMNGA | customer interface field: YieldQuantity (unconfirmed) | information only | yes |
| `ScrapQuantity` | AFRU-XMNGA | customer interface field: ScrapQuantity (unconfirmed) | information only | yes |
| `ConfirmationUnit` | AFRU-GMEIN | customer interface field: ConfirmationUnit (unconfirmed) | information only | yes |

## Reconciliation

- Counts: `ZPPX_C_ConfirmationMigCount` (ECC) vs `-` (S/4HANA) per `ConfirmationNumber`

```bash
python3 tools/mig_reconcile.py counts --product pp_mig_ecc --module production_confirmation --source ecc_counts.csv --target s4_counts.csv
```

## Open gaps

- BOMs and routings need key date, engineering change, usage, alternative and selected-node resolution. Preserve alternative sequences and dependencies. Production orders are process references unless the chosen target interface explicitly supports their state; confirmations, goods movements and costs must not be reposted as master data.
- Preserve confirmation/counter identity and reversal relationships; do not delete reversals and assume the remaining history is net yield. Target order/operation mapping and posting periods must be approved. Reposting confirmations can trigger backflush, goods movements, activity allocations and accounting; confirmation history is reference-only unless a supported process migration explicitly authorizes those effects.
