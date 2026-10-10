# Migration interface: measurement_document

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been run on a system.

- **Read by:** customer load program (reads the consumption views, posts on S/4HANA)
- **Load after:** `measuring_point`
- **Business key:** `MeasuringPoint` · numbering **new**
- **Key rule:** New document numbers on S/4HANA; one initial reading per measuring point.

> TODO-VERIFY[M] XMD-M01: target fields are the S/4HANA table fields, assumed unchanged from ECC for Plant Maintenance; confirm them against the posting interface (BAPI / API) the load program uses

Values are delivered **translated**: every field marked *value map* / *key map* is looked up in the mapping table `ZEMX_MAP` (map name in capitals); without an entry the old value is delivered. `Legacy*` key fields carry the old key of the record.

## `ZEMX_C_MeasReadingMig`

- Source: `ZEMX_I_MeasPointLastReading`
- Keys: `LegacyMeasuringPoint`
- Scope: `all rows`

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `MeasuringPoint` | IMRG-POINT | IMRG-POINT | key map: `MEASURING_POINT` |  |
| `MsmtRdngDate` | IMRG-IDATE | IMRG-IDATE | copy |  |
| `MsmtRdngTime` | IMRG-ITIME | IMRG-ITIME | copy |  |
| `MsmtRdngByUser` | IMRG-READR | IMRG-READR | copy |  |
| `MeasurementReading` | IMRG-READG | IMRG-READG | convert (load program): float_si_to_unit |  |
| `MeasurementCounterReading` | IMRG-CNTRR | IMRG-CNTRR | convert (load program): float_si_to_unit |  |
| `MsmtReadingInEntryUnit` | IMRG-RECDV | IMRG-RECDV | copy |  |
| `MsmtEntryUnit` | IMRG-RECDU | IMRG-RECDU | value map: `UNIT_OF_MEASURE` |  |
| `MsmtValuationCode` | IMRG-VLCOD | IMRG-VLCOD | value map: `CODE` |  |
| `MeasurementDocumentText` | IMRG-MDTXT | IMRG-MDTXT | copy |  |

## Not delivered

| View | Element | Source | Reason |
|---|---|---|---|
| `ZEMX_I_MeasPointLastReading` | `MeasurementDocument` | IMRG-MDOCM | information only |

## Maps

- value map `CODE`
- value map `UNIT_OF_MEASURE`
- key map `MEASURING_POINT`

## Reconciliation

- Counts: `ZEMX_C_MeasReadingMigCount` (ECC, translated values) vs `-` (S/4HANA) per `MsmtEntryUnit`

```bash
python3 tools/mig_reconcile.py counts --module measurement_document --source ecc_counts.csv --target s4_counts.csv
```

## Open gaps

- TODO-VERIFY[L] XMD-G01: full reading history is not migrated (stays in the old system / archive); ZEMX_I_MeasurementDocument can feed a history load if required
