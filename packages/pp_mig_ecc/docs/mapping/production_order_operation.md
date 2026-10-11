# Migration interface: production_order_operation

> Version **1.0.0**

- **Read by:** customer-selected supported posting interface; reference data is not posted
- **Load after:** `production_order`
- **Business key:** `OperationRoutingNumber`, `OperationInternalID` · numbering **keep**
- **Key rule:** Preserve source identifiers in an audit ledger; map regenerated internal IDs and target numbering. Never assume internal IDs survive migration.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZPPX_C_ProductionOperMig`

- Source: `ZPPX_I_ProductionOper`
- Keys: `OperationRoutingNumber`, `OperationInternalID`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. BOMs and routings need key date, engineering change, usage, alternative and selected-node resolution. Preserve alternative sequences and dependencies. Production orders are process references unless the chosen target interface explicitly supports their state; confirmations, goods movements and costs must not be reposted as master data.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `OperationRoutingNumber` | AFVC-AUFPL | customer interface field: OperationRoutingNumber (unconfirmed) | information only | yes |
| `OperationInternalID` | AFVC-APLZL | customer interface field: OperationInternalID (unconfirmed) | information only | yes |
| `Operation` | AFVC-VORNR | customer interface field: Operation (unconfirmed) | information only | yes |
| `OperationText` | AFVC-LTXA1 | customer interface field: OperationText (unconfirmed) | information only | yes |
| `WorkCenterInternalID` | AFVC-ARBID | customer interface field: WorkCenterInternalID (unconfirmed) | information only | yes |
| `Plant` | AFVC-WERKS | customer interface field: Plant (unconfirmed) | information only | yes |
| `ControlKey` | AFVC-STEUS | - | copy |  |
| `SubOperation` | AFVC-UVORN | - | copy |  |

## `ZPPX_C_OperationQuantMig`

- Source: `ZPPX_I_OperationQuant`
- Keys: `OperationRoutingNumber`, `OperationInternalID`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. BOMs and routings need key date, engineering change, usage, alternative and selected-node resolution. Preserve alternative sequences and dependencies. Production orders are process references unless the chosen target interface explicitly supports their state; confirmations, goods movements and costs must not be reposted as master data.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `OperationRoutingNumber` | AFVV-AUFPL | customer interface field: OperationRoutingNumber (unconfirmed) | information only | yes |
| `OperationInternalID` | AFVV-APLZL | customer interface field: OperationInternalID (unconfirmed) | information only | yes |
| `OperationQuantity` | AFVV-MGVRG | customer interface field: OperationQuantity (unconfirmed) | information only | yes |
| `Unit` | AFVV-MEINH | customer interface field: Unit (unconfirmed) | information only | yes |
| `StandardValue1` | AFVV-VGW01 | customer interface field: StandardValue1 (unconfirmed) | information only | yes |
| `StandardValueUnit1` | AFVV-VGE01 | customer interface field: StandardValueUnit1 (unconfirmed) | information only | yes |

## `ZPPX_C_OrderComponentMig`

- Source: `ZPPX_I_OrderComponent`
- Keys: `Reservation`, `ReservationItem`, `RecordType`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. BOMs and routings need key date, engineering change, usage, alternative and selected-node resolution. Preserve alternative sequences and dependencies. Production orders are process references unless the chosen target interface explicitly supports their state; confirmations, goods movements and costs must not be reposted as master data.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Reservation` | RESB-RSNUM | customer interface field: Reservation (unconfirmed) | information only | yes |
| `ReservationItem` | RESB-RSPOS | customer interface field: ReservationItem (unconfirmed) | information only | yes |
| `RecordType` | RESB-RSART | customer interface field: RecordType (unconfirmed) | information only | yes |
| `ManufacturingOrder` | RESB-AUFNR | customer interface field: ManufacturingOrder (unconfirmed) | information only | yes |
| `Material` | RESB-MATNR | customer interface field: Material (unconfirmed) | information only | yes |
| `Plant` | RESB-WERKS | customer interface field: Plant (unconfirmed) | information only | yes |
| `StorageLocation` | RESB-LGORT | customer interface field: StorageLocation (unconfirmed) | information only | yes |
| `RequiredQuantity` | RESB-BDMNG | customer interface field: RequiredQuantity (unconfirmed) | information only | yes |
| `Unit` | RESB-MEINS | customer interface field: Unit (unconfirmed) | information only | yes |
| `DeletionFlag` | RESB-XLOEK | customer interface field: DeletionFlag (unconfirmed) | information only | yes |

## Reconciliation

- Counts: `ZPPX_C_ProductionOperMigCount` (ECC) vs `-` (S/4HANA) per `OperationRoutingNumber`

```bash
python3 tools/mig_reconcile.py counts --product pp_mig_ecc --module production_order_operation --source ecc_counts.csv --target s4_counts.csv
```

## Open gaps

- BOMs and routings need key date, engineering change, usage, alternative and selected-node resolution. Preserve alternative sequences and dependencies. Production orders are process references unless the chosen target interface explicitly supports their state; confirmations, goods movements and costs must not be reposted as master data.
