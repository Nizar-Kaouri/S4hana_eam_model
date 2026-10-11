# Migration interface: inspection_lot

> Version **1.0.0**

- **Read by:** customer-selected supported posting interface; reference data is not posted
- **Load after:** - (first level)
- **Business key:** `InspectionLot` · numbering **keep**
- **Key rule:** Preserve source identifiers in an audit ledger; map regenerated internal IDs and target numbering. Never assume internal IDs survive migration.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZQMX_C_InspectionLotMig`

- Source: `ZQMX_I_InspectionLot`
- Keys: `InspectionLot`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Lots, results and usage decisions have process and status prerequisites. Results are reference data until a supported transfer interface is selected. Inspection plans require task-list effectivity, selected operations, characteristics, sampling and material assignments; plain PLKO rows are not an effective plan. Notifications require catalogs, partners and status decisions.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `InspectionLot` | QALS-PRUEFLOS | customer interface field: InspectionLot (unconfirmed) | information only | yes |
| `Plant` | QALS-WERK | customer interface field: Plant (unconfirmed) | information only | yes |
| `Material` | QALS-MATNR | customer interface field: Material (unconfirmed) | information only | yes |
| `Batch` | QALS-CHARG | customer interface field: Batch (unconfirmed) | information only | yes |
| `InspectionType` | QALS-ART | customer interface field: InspectionType (unconfirmed) | information only | yes |
| `InspectionLotOrigin` | QALS-HERKUNFT | customer interface field: InspectionLotOrigin (unconfirmed) | information only | yes |
| `InspectionLotQuantity` | QALS-LOSMENGE | customer interface field: InspectionLotQuantity (unconfirmed) | information only | yes |
| `Unit` | QALS-MENGENEINH | customer interface field: Unit (unconfirmed) | information only | yes |
| `ObjectNumber` | QALS-OBJNR | customer interface field: ObjectNumber (unconfirmed) | information only | yes |

## `ZQMX_C_UsageDecisionMig`

- Source: `ZQMX_I_UsageDecision`
- Keys: `InspectionLot`, `UsageDecisionType`, `UsageDecisionCounter`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Lots, results and usage decisions have process and status prerequisites. Results are reference data until a supported transfer interface is selected. Inspection plans require task-list effectivity, selected operations, characteristics, sampling and material assignments; plain PLKO rows are not an effective plan. Notifications require catalogs, partners and status decisions.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `InspectionLot` | QAVE-PRUEFLOS | customer interface field: InspectionLot (unconfirmed) | information only | yes |
| `UsageDecisionType` | QAVE-KZART | customer interface field: UsageDecisionType (unconfirmed) | information only | yes |
| `UsageDecisionCounter` | QAVE-ZAEHLER | customer interface field: UsageDecisionCounter (unconfirmed) | information only | yes |
| `UsageDecisionCode` | QAVE-VCODE | customer interface field: UsageDecisionCode (unconfirmed) | information only | yes |
| `UsageDecisionCodeGroup` | QAVE-VCODEGRP | customer interface field: UsageDecisionCodeGroup (unconfirmed) | information only | yes |
| `UsageDecisionDate` | QAVE-VDATUM | customer interface field: UsageDecisionDate (unconfirmed) | information only | yes |

## Reconciliation

- Counts: `ZQMX_C_InspectionLotMigCount` (ECC) vs `ZQMT_I_InspectionLotCount` (S/4HANA) per `InspectionLot`
- Records and fields: `ZQMX_C_InspectionLotMig` vs `ZQMT_B_InspectionLotCompare` on `InspectionLot`; compared: `Plant`, `Material`, `Batch`, `InspectionType`, `InspectionLotOrigin`

```bash
python3 tools/mig_reconcile.py counts --product qm_mig_ecc --module inspection_lot --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --product qm_mig_ecc --module inspection_lot --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- Lots, results and usage decisions have process and status prerequisites. Results are reference data until a supported transfer interface is selected. Inspection plans require task-list effectivity, selected operations, characteristics, sampling and material assignments; plain PLKO rows are not an effective plan. Notifications require catalogs, partners and status decisions.
