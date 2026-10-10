# Mapping: measuring_point

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been run on a system.

- **Target:** SAP S/4HANA Migration Cockpit - migration object *Measuring point*
- **Load after:** `equipment`, `functional_location`
- **Business key:** `MeasuringPoint` · numbering **new**
- **Key rule:** Measuring point numbers are usually assigned internally on S/4HANA: keep the key map 'measuring_point' (old,new) from the load log; maintenance plan cycles and measurement documents use it.
- **Scope filter:** `IsMarkedForDeletion = ''` - Measuring points flagged for deletion are not migrated.

> TODO-VERIFY[H] XMP-M01: Migration Cockpit object for 'Measuring point' (name, approach staging tables / direct transfer) and its structure field names; targets below are the S/4HANA table fields, assumed unchanged from ECC for Plant Maintenance

## Fields

| View | Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|---|
| `ZEMX_I_MeasuringPoint` | `MeasuringPoint` | IMPTT-POINT | IMPTT-POINT | key map: `measuring_point` | yes |
| `ZEMX_I_MeasuringPoint` | `MeasuringPointDescription` | IMPTT-PTTXT | IMPTT-PTTXT | copy |  |
| `ZEMX_I_MeasuringPoint` | `MeasuringPointCategory` | IMPTT-MPTYP | IMPTT-MPTYP | value map: `measuring_point_category` | yes |
| `ZEMX_I_MeasuringPoint` | `MeasuringPointPositionNumber` | IMPTT-PSORT | IMPTT-PSORT | copy |  |
| `ZEMX_I_MeasuringPoint` | `MeasuringPointObjectType` | substring( imptt.mpobj, 1, 2 ) | - | derive: IE = equipment, IF = functional location |  |
| `ZEMX_I_MeasuringPoint` | `TechnicalObjectKey` | substring( imptt.mpobj, 3, 30 ) | IMPTT-MPOBJ (rebuilt from the new key) | key map: `equipment\|functional_location` |  |
| `ZEMX_I_MeasuringPoint` | `Characteristic` | CABN-ATNAM | IMPTT-ATINN (via characteristic name) | copy |  |
| `ZEMX_I_MeasuringPoint` | `MeasuringPointIsCounter` | IMPTT-INDCT | IMPTT-INDCT | copy | yes |
| `ZEMX_I_MeasuringPoint` | `MeasuringPointDecimalPlaces` | IMPTT-DECIM | IMPTT-DECIM | copy |  |
| `ZEMX_I_MeasuringPoint` | `MeasurementRangeUnit` | IMPTT-MRNGU | IMPTT-MRNGU | value map: `unit_of_measure` |  |
| `ZEMX_I_MeasuringPoint` | `LowerRangeLimit` | IMPTT-MRMIN | IMPTT-MRMIN | convert: `float_si_to_unit` |  |
| `ZEMX_I_MeasuringPoint` | `UpperRangeLimit` | IMPTT-MRMAX | IMPTT-MRMAX | convert: `float_si_to_unit` |  |
| `ZEMX_I_MeasuringPoint` | `TargetValue` | IMPTT-DESIR | IMPTT-DESIR | convert: `float_si_to_unit` |  |
| `ZEMX_I_MeasuringPoint` | `CodeGroup` | IMPTT-CODGR | IMPTT-CODGR | value map: `code_group` |  |
| `ZEMX_I_MeasuringPoint` | `MeasuringPointIsInactive` | IMPTT-INACT | IMPTT-INACT | copy |  |
| `ZEMX_I_MeasuringPoint` | `AuthorizationGroup` | IMPTT-BEGRU | IMPTT-BEGRU | value map: `authorization_group` |  |
| `ZEMX_I_MeasuringPoint` | `IsMarkedForDeletion` | IMPTT-LVORM | - | scope filter |  |
| `ZEMX_I_MeasuringPoint` | `CreationDate` | IMPTT-ERDAT | - | information only |  |
| `ZEMX_I_MeasuringPoint` | `CreatedByUser` | IMPTT-ERNAM | - | information only |  |
| `ZEMX_I_MeasuringPoint` | `LastChangeDate` | IMPTT-AEDAT | - | information only |  |

## Value maps and key maps

Templates: `docs/mapping/templates/` (columns `source,target,comment`). An empty map means "same value on S/4HANA".

- value map `authorization_group`
- value map `code_group`
- value map `measuring_point_category`
- value map `unit_of_measure`
- key map `equipment`
- key map `functional_location`
- key map `measuring_point`

This object's load provides the key map(s) `measuring_point` (old key, new key from the load log).

## Reconciliation

- Counts: `ZEMX_R_MeasPointCount` (ECC) vs `ZEMT_R_MeasPointCount` (S/4HANA) per `MeasuringPointCategory` (value map `measuring_point_category`), `MeasuringPointIsCounter`
- Records and fields: `ZEMX_I_MeasuringPoint` vs `ZEMT_I_MeasPointCompare` on `MeasuringPoint` (key map `measuring_point`); compared fields: `MeasuringPointCategory`, `MeasuringPointIsCounter`

```bash
python3 tools/mig_reconcile.py counts --module measuring_point --source ecc_counts.csv --target s4_counts.csv --maps <folder>
python3 tools/mig_reconcile.py records --module measuring_point --source ecc_extract.csv --target s4_compare.csv --maps <folder>
```

## Open gaps

- TODO-VERIFY[M] XMP-G01: characteristics (CABN) must exist on S/4HANA with the same name and unit before the load
