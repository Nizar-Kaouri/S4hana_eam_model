# Migration interface: measurement_document

> Version **1.0.0**

- **Read by:** customer load program (reads the consumption views, posts on S/4HANA)
- **Load after:** `measuring_point`
- **Business key:** `MeasuringPoint` · numbering **new**
- **Key rule:** New document numbers on S/4HANA; one initial reading per measuring point.

> Compatibility note: target fields are the S/4HANA table fields, assumed unchanged from ECC for Plant Maintenance; confirm them against the posting interface (BAPI / API) the load program uses

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZEMX_C_MeasReadingMig`

- Source: `ZEMX_I_MeasPointLastReading`
- Keys: `MeasuringPoint`
- Scope: `all rows`

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `MeasuringPoint` | IMRG-POINT | IMRG-POINT | copy |
| `MsmtRdngDate` | IMRG-IDATE | IMRG-IDATE | copy |
| `MsmtRdngTime` | IMRG-ITIME | IMRG-ITIME | copy |
| `MsmtRdngByUser` | IMRG-READR | IMRG-READR | copy |
| `MeasurementReading` | IMRG-READG | IMRG-READG | convert (load program): float_si_to_unit |
| `MeasurementCounterReading` | IMRG-CNTRR | IMRG-CNTRR | convert (load program): float_si_to_unit |
| `MsmtReadingInEntryUnit` | IMRG-RECDV | IMRG-RECDV | copy |
| `MsmtEntryUnit` | IMRG-RECDU | IMRG-RECDU | copy |
| `MsmtValuationCode` | IMRG-VLCOD | IMRG-VLCOD | copy |
| `MeasurementDocumentText` | IMRG-MDTXT | IMRG-MDTXT | copy |

## Not delivered

| View | Element | Source | Reason |
|---|---|---|---|
| `ZEMX_I_MeasPointLastReading` | `MeasurementDocument` | IMRG-MDOCM | information only |

## Source controls

- Source count view: `ZEMX_C_MeasReadingMigCount`

## Open gaps

- Compatibility note: full reading history is not migrated (stays in the old system / archive); ZEMX_B_MeasurementDocument can feed a history load if required
