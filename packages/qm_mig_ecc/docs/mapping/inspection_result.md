# Migration interface: inspection_result

> Version **1.0.0**

- **Read by:** customer-selected supported posting interface; reference data is not posted
- **Load after:** `inspection_lot`
- **Business key:** `InspectionLot`, `OperationInternalID`, `CharacteristicNumber` · numbering **keep**
- **Key rule:** Preserve source identifiers in an audit ledger; map regenerated internal IDs and target numbering. Never assume internal IDs survive migration.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZQMX_C_InspectCharactMig`

- Source: `ZQMX_I_InspectCharact`
- Keys: `InspectionLot`, `OperationInternalID`, `CharacteristicNumber`
- Scope: `all rows`
- Delivery mode: **reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Lots, results and usage decisions have process and status prerequisites. Results are reference data until a supported transfer interface is selected. Inspection plans require task-list effectivity, selected operations, characteristics, sampling and material assignments; plain PLKO rows are not an effective plan. Notifications require catalogs, partners and status decisions.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `InspectionLot` | QAMV-PRUEFLOS | customer interface field: InspectionLot (unconfirmed) | information only | yes |
| `OperationInternalID` | QAMV-VORGLFNR | customer interface field: OperationInternalID (unconfirmed) | information only | yes |
| `CharacteristicNumber` | QAMV-MERKNR | customer interface field: CharacteristicNumber (unconfirmed) | information only | yes |
| `CharacteristicDescription` | QAMV-KURZTEXT | customer interface field: CharacteristicDescription (unconfirmed) | information only | yes |

## `ZQMX_C_CharacteristicMig`

- Source: `ZQMX_I_Characteristic`
- Keys: `InspectionLot`, `OperationInternalID`, `CharacteristicNumber`
- Scope: `all rows`
- Delivery mode: **reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Lots, results and usage decisions have process and status prerequisites. Results are reference data until a supported transfer interface is selected. Inspection plans require task-list effectivity, selected operations, characteristics, sampling and material assignments; plain PLKO rows are not an effective plan. Notifications require catalogs, partners and status decisions.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `InspectionLot` | QAMR-PRUEFLOS | customer interface field: InspectionLot (unconfirmed) | information only | yes |
| `OperationInternalID` | QAMR-VORGLFNR | customer interface field: OperationInternalID (unconfirmed) | information only | yes |
| `CharacteristicNumber` | QAMR-MERKNR | customer interface field: CharacteristicNumber (unconfirmed) | information only | yes |
| `MeanValue` | QAMR-MITTELWERT | customer interface field: MeanValue (unconfirmed) | information only | yes |
| `MinimumValue` | QAMR-MIN | customer interface field: MinimumValue (unconfirmed) | information only | yes |
| `MaximumValue` | QAMR-MAX | customer interface field: MaximumValue (unconfirmed) | information only | yes |

## `ZQMX_C_SingleResultMig`

- Source: `ZQMX_I_SingleResult`
- Keys: `InspectionLot`, `OperationInternalID`, `CharacteristicNumber`, `SampleNumber`, `ResultNumber`
- Scope: `all rows`
- Delivery mode: **reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Lots, results and usage decisions have process and status prerequisites. Results are reference data until a supported transfer interface is selected. Inspection plans require task-list effectivity, selected operations, characteristics, sampling and material assignments; plain PLKO rows are not an effective plan. Notifications require catalogs, partners and status decisions.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `InspectionLot` | QASE-PRUEFLOS | customer interface field: InspectionLot (unconfirmed) | information only | yes |
| `OperationInternalID` | QASE-VORGLFNR | customer interface field: OperationInternalID (unconfirmed) | information only | yes |
| `CharacteristicNumber` | QASE-MERKNR | customer interface field: CharacteristicNumber (unconfirmed) | information only | yes |
| `SampleNumber` | QASE-PROBENR | customer interface field: SampleNumber (unconfirmed) | information only | yes |
| `ResultNumber` | QASE-DETAILERG | customer interface field: ResultNumber (unconfirmed) | information only | yes |
| `MeasuredValue` | QASE-MESSWERT | customer interface field: MeasuredValue (unconfirmed) | information only | yes |

## Reconciliation

- Counts: `ZQMX_C_InspectCharactMigCount` (ECC) vs `-` (S/4HANA) per `InspectionLot`

```bash
python3 tools/mig_reconcile.py counts --product qm_mig_ecc --module inspection_result --source ecc_counts.csv --target s4_counts.csv
```

## Open gaps

- Lots, results and usage decisions have process and status prerequisites. Results are reference data until a supported transfer interface is selected. Inspection plans require task-list effectivity, selected operations, characteristics, sampling and material assignments; plain PLKO rows are not an effective plan. Notifications require catalogs, partners and status decisions.
