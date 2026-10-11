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

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `InspectionLot` | QAMV-PRUEFLOS | customer interface field: InspectionLot (unconfirmed) | information only |
| `OperationInternalID` | QAMV-VORGLFNR | customer interface field: OperationInternalID (unconfirmed) | information only |
| `CharacteristicNumber` | QAMV-MERKNR | customer interface field: CharacteristicNumber (unconfirmed) | information only |
| `CharacteristicDescription` | QAMV-KURZTEXT | customer interface field: CharacteristicDescription (unconfirmed) | information only |

## `ZQMX_C_CharacteristicMig`

- Source: `ZQMX_I_Characteristic`
- Keys: `InspectionLot`, `OperationInternalID`, `CharacteristicNumber`
- Scope: `all rows`
- Delivery mode: **reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Lots, results and usage decisions have process and status prerequisites. Results are reference data until a supported transfer interface is selected. Inspection plans require task-list effectivity, selected operations, characteristics, sampling and material assignments; plain PLKO rows are not an effective plan. Notifications require catalogs, partners and status decisions.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `InspectionLot` | QAMR-PRUEFLOS | customer interface field: InspectionLot (unconfirmed) | information only |
| `OperationInternalID` | QAMR-VORGLFNR | customer interface field: OperationInternalID (unconfirmed) | information only |
| `CharacteristicNumber` | QAMR-MERKNR | customer interface field: CharacteristicNumber (unconfirmed) | information only |
| `MeanValue` | QAMR-MITTELWERT | customer interface field: MeanValue (unconfirmed) | information only |
| `MinimumValue` | QAMR-MIN | customer interface field: MinimumValue (unconfirmed) | information only |
| `MaximumValue` | QAMR-MAX | customer interface field: MaximumValue (unconfirmed) | information only |

## `ZQMX_C_SingleResultMig`

- Source: `ZQMX_I_SingleResult`
- Keys: `InspectionLot`, `OperationInternalID`, `CharacteristicNumber`, `SampleNumber`, `ResultNumber`
- Scope: `all rows`
- Delivery mode: **reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Lots, results and usage decisions have process and status prerequisites. Results are reference data until a supported transfer interface is selected. Inspection plans require task-list effectivity, selected operations, characteristics, sampling and material assignments; plain PLKO rows are not an effective plan. Notifications require catalogs, partners and status decisions.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `InspectionLot` | QASE-PRUEFLOS | customer interface field: InspectionLot (unconfirmed) | information only |
| `OperationInternalID` | QASE-VORGLFNR | customer interface field: OperationInternalID (unconfirmed) | information only |
| `CharacteristicNumber` | QASE-MERKNR | customer interface field: CharacteristicNumber (unconfirmed) | information only |
| `SampleNumber` | QASE-PROBENR | customer interface field: SampleNumber (unconfirmed) | information only |
| `ResultNumber` | QASE-DETAILERG | customer interface field: ResultNumber (unconfirmed) | information only |
| `MeasuredValue` | QASE-MESSWERT | customer interface field: MeasuredValue (unconfirmed) | information only |

## Source controls

- Source count view: `ZQMX_C_InspectCharactMigCount`

## Open gaps

- Lots, results and usage decisions have process and status prerequisites. Results are reference data until a supported transfer interface is selected. Inspection plans require task-list effectivity, selected operations, characteristics, sampling and material assignments; plain PLKO rows are not an effective plan. Notifications require catalogs, partners and status decisions.
