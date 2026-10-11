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

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `MeasuringPoint` | IMPTT-POINT | IMPTT-POINT | copy |
| `MeasuringPointDescription` | IMPTT-PTTXT | IMPTT-PTTXT | copy |
| `MeasuringPointCategory` | IMPTT-MPTYP | IMPTT-MPTYP | copy |
| `MeasuringPointPositionNumber` | IMPTT-PSORT | IMPTT-PSORT | copy |
| `MeasuringPointObjectType` | IMPTT: substring( imptt.mpobj, 1, 2 ) | - | derived: IE = equipment, IF = functional location |
| `TechnicalObjectKey` | IMPTT: substring( imptt.mpobj, 3, 30 ) | - | copy |
| `Characteristic` | CABN-ATNAM | CABN-ATNAM | copy |
| `MeasuringPointIsCounter` | IMPTT-INDCT | IMPTT-INDCT | copy |
| `MeasuringPointDecimalPlaces` | IMPTT-DECIM | IMPTT-DECIM | copy |
| `MeasurementRangeUnit` | IMPTT-MRNGU | IMPTT-MRNGU | copy |
| `LowerRangeLimit` | IMPTT-MRMIN | IMPTT-MRMIN | convert (load program): float_si_to_unit |
| `UpperRangeLimit` | IMPTT-MRMAX | IMPTT-MRMAX | convert (load program): float_si_to_unit |
| `TargetValue` | IMPTT-DESIR | IMPTT-DESIR | convert (load program): float_si_to_unit |
| `CodeGroup` | IMPTT-CODGR | IMPTT-CODGR | copy |
| `MeasuringPointIsInactive` | IMPTT-INACT | IMPTT-INACT | copy |
| `AuthorizationGroup` | IMPTT-BEGRU | IMPTT-BEGRU | copy |
| `LastChangeDate` | IMPTT-AEDAT | - | information only |

## `ZEMX_C_MeasPointLongTextMig`

- Source: `ZEMX_I_MeasPointLongText`
- Keys: `TextObject`, `TextName`, `TextID`, `Language`
- Scope: `all rows`
- Delivery mode: **reference**
- Before posting: SAPscript index only. Populate the explicit full text-key to business-owner link file from the source text editor/application metadata, run the text_scope preparation step against selected masters, then READ_TEXT to retrieve ordered formatted lines. Never infer the business owner from a TDNAME substring or post compressed STXL data.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `TextObject` | STXH-TDOBJECT | - | copy |
| `TextName` | STXH-TDNAME | - | copy |
| `TextID` | STXH-TDID | - | copy |
| `Language` | STXH-TDSPRAS | - | copy |

## Not delivered

| View | Element | Source | Reason |
|---|---|---|---|
| `ZEMX_I_MeasuringPoint` | `MeasuringPointObjectNumber` | IMPTT-MPOBJ | not migrated: rebuilt from the technical object key on S/4HANA |
| `ZEMX_I_MeasuringPoint` | `CharcInternalID` | IMPTT-ATINN | not migrated: internal characteristic number - mapped by name |
| `ZEMX_I_MeasuringPoint` | `IsMarkedForDeletion` | IMPTT-LVORM | scope flag |
| `ZEMX_I_MeasuringPoint` | `CreationDate` | IMPTT-ERDAT | information only |
| `ZEMX_I_MeasuringPoint` | `CreatedByUser` | IMPTT-ERNAM | information only |

## Source controls

- Source count view: `ZEMX_C_MeasPointMigCount`

## Open gaps

- Compatibility note: characteristics (CABN) must exist on S/4HANA with the same name and unit before the load
