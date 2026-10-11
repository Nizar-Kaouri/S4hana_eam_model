# Migration interface: measuring_point

> Version **1.0.0**

- **Read by:** customer load program (reads the consumption views, posts on S/4HANA)
- **Load after:** `equipment`, `functional_location`
- **Business key:** `MeasuringPoint` · numbering **new**
- **Key rule:** Measuring point numbers are usually assigned internally on S/4HANA: the load program keeps the old -> new numbers for the objects loaded later.

> Compatibility note: target fields are the S/4HANA table fields, assumed unchanged from ECC for Plant Maintenance; confirm them against the posting interface (BAPI / API) the load program uses

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZEMX_C_MeasuringPointMig`

- Source: `ZEMX_I_MeasuringPoint`
- Keys: `MeasuringPoint`
- Scope: `src.IsMarkedForDeletion = ''`

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `MeasuringPoint` | IMPTT-POINT | IMPTT-POINT | copy | yes |
| `MeasuringPointDescription` | IMPTT-PTTXT | IMPTT-PTTXT | copy |  |
| `MeasuringPointCategory` | IMPTT-MPTYP | IMPTT-MPTYP | copy | yes |
| `MeasuringPointPositionNumber` | IMPTT-PSORT | IMPTT-PSORT | copy |  |
| `MeasuringPointObjectType` | IMPTT: substring( imptt.mpobj, 1, 2 ) | - | derived: IE = equipment, IF = functional location |  |
| `TechnicalObjectKey` | IMPTT: substring( imptt.mpobj, 3, 30 ) | - | copy |  |
| `Characteristic` | CABN-ATNAM | CABN-ATNAM | copy |  |
| `MeasuringPointIsCounter` | IMPTT-INDCT | IMPTT-INDCT | copy | yes |
| `MeasuringPointDecimalPlaces` | IMPTT-DECIM | IMPTT-DECIM | copy |  |
| `MeasurementRangeUnit` | IMPTT-MRNGU | IMPTT-MRNGU | copy |  |
| `LowerRangeLimit` | IMPTT-MRMIN | IMPTT-MRMIN | convert (load program): float_si_to_unit |  |
| `UpperRangeLimit` | IMPTT-MRMAX | IMPTT-MRMAX | convert (load program): float_si_to_unit |  |
| `TargetValue` | IMPTT-DESIR | IMPTT-DESIR | convert (load program): float_si_to_unit |  |
| `CodeGroup` | IMPTT-CODGR | IMPTT-CODGR | copy |  |
| `MeasuringPointIsInactive` | IMPTT-INACT | IMPTT-INACT | copy |  |
| `AuthorizationGroup` | IMPTT-BEGRU | IMPTT-BEGRU | copy |  |
| `LastChangeDate` | IMPTT-AEDAT | - | information only |  |

## Not delivered

| View | Element | Source | Reason |
|---|---|---|---|
| `ZEMX_I_MeasuringPoint` | `MeasuringPointObjectNumber` | IMPTT-MPOBJ | not migrated: rebuilt from the technical object key on S/4HANA |
| `ZEMX_I_MeasuringPoint` | `CharcInternalID` | IMPTT-ATINN | not migrated: internal characteristic number - mapped by name |
| `ZEMX_I_MeasuringPoint` | `IsMarkedForDeletion` | IMPTT-LVORM | scope flag |
| `ZEMX_I_MeasuringPoint` | `CreationDate` | IMPTT-ERDAT | information only |
| `ZEMX_I_MeasuringPoint` | `CreatedByUser` | IMPTT-ERNAM | information only |

## Reconciliation

- Counts: `ZEMX_C_MeasPointMigCount` (ECC) vs `ZEMT_I_MeasPointCount` (S/4HANA) per `MeasuringPointCategory`, `MeasuringPointIsCounter`
- Records and fields: `ZEMX_C_MeasuringPointMig` vs `ZEMT_I_MeasPointCompare` on `MeasuringPoint`; compared: `MeasuringPointCategory`, `MeasuringPointIsCounter`

```bash
python3 tools/mig_reconcile.py counts --product eam_mig_ecc --module measuring_point --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --product eam_mig_ecc --module measuring_point --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- Compatibility note: characteristics (CABN) must exist on S/4HANA with the same name and unit before the load
