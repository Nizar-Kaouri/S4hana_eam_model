# Migration interface: measuring_point

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been run on a system.

- **Read by:** customer load program (reads the consumption views, posts on S/4HANA)
- **Load after:** `equipment`, `functional_location`
- **Business key:** `MeasuringPoint` · numbering **new**
- **Key rule:** Measuring point numbers are usually assigned internally on S/4HANA: the load program writes old -> new into the key map 'MEASURING_POINT' for the later objects.

> TODO-VERIFY[M] XMP-M01: target fields are the S/4HANA table fields, assumed unchanged from ECC for Plant Maintenance; confirm them against the posting interface (BAPI / API) the load program uses

Values are delivered **translated**: every field marked *value map* / *key map* is looked up in the mapping table `ZEMX_MAP` (map name in capitals); without an entry the old value is delivered. `Legacy*` key fields carry the old key of the record.

## `ZEMX_C_MeasuringPointMig`

- Source: `ZEMX_I_MeasuringPoint`
- Keys: `LegacyMeasuringPoint`
- Scope: `src.IsMarkedForDeletion = ''`

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `MeasuringPoint` | IMPTT-POINT | IMPTT-POINT | key map: `MEASURING_POINT` | yes |
| `MeasuringPointDescription` | IMPTT-PTTXT | IMPTT-PTTXT | copy |  |
| `MeasuringPointCategory` | IMPTT-MPTYP | IMPTT-MPTYP | value map: `MEASURING_POINT_CATEGORY` | yes |
| `MeasuringPointPositionNumber` | IMPTT-PSORT | IMPTT-PSORT | copy |  |
| `MeasuringPointObjectType` | IMPTT: substring( imptt.mpobj, 1, 2 ) | - | derived: IE = equipment, IF = functional location |  |
| `TechnicalObjectKey` | IMPTT: substring( imptt.mpobj, 3, 30 ) | - | key map: `EQUIPMENT`, `FUNCTIONAL_LOCATION` |  |
| `Characteristic` | CABN-ATNAM | CABN-ATNAM | copy |  |
| `MeasuringPointIsCounter` | IMPTT-INDCT | IMPTT-INDCT | copy | yes |
| `MeasuringPointDecimalPlaces` | IMPTT-DECIM | IMPTT-DECIM | copy |  |
| `MeasurementRangeUnit` | IMPTT-MRNGU | IMPTT-MRNGU | value map: `UNIT_OF_MEASURE` |  |
| `LowerRangeLimit` | IMPTT-MRMIN | IMPTT-MRMIN | convert (load program): float_si_to_unit |  |
| `UpperRangeLimit` | IMPTT-MRMAX | IMPTT-MRMAX | convert (load program): float_si_to_unit |  |
| `TargetValue` | IMPTT-DESIR | IMPTT-DESIR | convert (load program): float_si_to_unit |  |
| `CodeGroup` | IMPTT-CODGR | IMPTT-CODGR | value map: `CODE_GROUP` |  |
| `MeasuringPointIsInactive` | IMPTT-INACT | IMPTT-INACT | copy |  |
| `AuthorizationGroup` | IMPTT-BEGRU | IMPTT-BEGRU | value map: `AUTHORIZATION_GROUP` |  |
| `LastChangeDate` | IMPTT-AEDAT | - | information only |  |

## Not delivered

| View | Element | Source | Reason |
|---|---|---|---|
| `ZEMX_I_MeasuringPoint` | `MeasuringPointObjectNumber` | IMPTT-MPOBJ | not migrated: rebuilt from the translated technical object key |
| `ZEMX_I_MeasuringPoint` | `CharcInternalID` | IMPTT-ATINN | not migrated: internal characteristic number - mapped by name |
| `ZEMX_I_MeasuringPoint` | `IsMarkedForDeletion` | IMPTT-LVORM | scope flag |
| `ZEMX_I_MeasuringPoint` | `CreationDate` | IMPTT-ERDAT | information only |
| `ZEMX_I_MeasuringPoint` | `CreatedByUser` | IMPTT-ERNAM | information only |

## Maps

- value map `AUTHORIZATION_GROUP`
- value map `CODE_GROUP`
- value map `MEASURING_POINT_CATEGORY`
- value map `UNIT_OF_MEASURE`
- key map `EQUIPMENT`
- key map `FUNCTIONAL_LOCATION`
- key map `MEASURING_POINT`

After loading this object, the key map(s) `MEASURING_POINT` (old key, new key from the load log) must be written into `ZEMX_MAP` on the ECC system (by the load program via RFC or by uploading the load log) before the objects that use them are extracted.

## Reconciliation

- Counts: `ZEMX_C_MeasPointMigCount` (ECC, translated values) vs `ZEMT_I_MeasPointCount` (S/4HANA) per `MeasuringPointCategory`, `MeasuringPointIsCounter`
- Records and fields: `ZEMX_C_MeasuringPointMig` vs `ZEMT_I_MeasPointCompare` on `MeasuringPoint`; compared: `MeasuringPointCategory`, `MeasuringPointIsCounter`

```bash
python3 tools/mig_reconcile.py counts --module measuring_point --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --module measuring_point --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- TODO-VERIFY[M] XMP-G01: characteristics (CABN) must exist on S/4HANA with the same name and unit before the load
