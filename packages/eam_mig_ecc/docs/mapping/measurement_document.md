# Mapping: measurement_document

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been run on a system.

- **Target:** SAP S/4HANA Migration Cockpit - migration object *Measurement document*
- **Load after:** `measuring_point`
- **Business key:** `MeasuringPoint`, `MsmtRdngDate`, `MsmtRdngTime` · numbering **new**
- **Key rule:** New document numbers on S/4HANA; compare by measuring point and reading date / time.
- **Scope filter:** `extract ZEMX_R_MeasPointLastReading (default) or ZEMX_I_MeasurementDocument with MsmtDocumentIsCancelled = '' and a date limit (history option)` - Most projects migrate only the last counter reading; full history is optional and large.

> TODO-VERIFY[H] XMD-M01: Migration Cockpit object for 'Measurement document' (name, approach staging tables / direct transfer) and its structure field names; targets below are the S/4HANA table fields, assumed unchanged from ECC for Plant Maintenance

## Fields

| View | Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|---|
| `ZEMX_I_MeasurementDocument` | `MeasurementDocument` | IMRG-MDOCM | - | not migrated: new document numbers on S/4HANA |  |
| `ZEMX_I_MeasurementDocument` | `MeasuringPoint` | IMRG-POINT | IMRG-POINT | key map: `measuring_point` |  |
| `ZEMX_I_MeasurementDocument` | `MsmtRdngDate` | IMRG-IDATE | IMRG-IDATE | copy |  |
| `ZEMX_I_MeasurementDocument` | `MsmtRdngTime` | IMRG-ITIME | IMRG-ITIME | copy |  |
| `ZEMX_I_MeasurementDocument` | `MsmtRdngByUser` | IMRG-READR | IMRG-READR | copy |  |
| `ZEMX_I_MeasurementDocument` | `MeasurementReading` | IMRG-READG | IMRG-READG | convert: `float_si_to_unit` |  |
| `ZEMX_I_MeasurementDocument` | `MeasurementCounterReading` | IMRG-CNTRR | IMRG-CNTRR | convert: `float_si_to_unit` |  |
| `ZEMX_I_MeasurementDocument` | `MeasurementCounterDifference` | IMRG-CDIFF | - | information only |  |
| `ZEMX_I_MeasurementDocument` | `MsmtReadingInEntryUnit` | IMRG-RECDV | IMRG-RECDV | copy |  |
| `ZEMX_I_MeasurementDocument` | `MsmtEntryUnit` | IMRG-RECDU | IMRG-RECDU | value map: `unit_of_measure` |  |
| `ZEMX_I_MeasurementDocument` | `MsmtValuationCode` | IMRG-VLCOD | IMRG-VLCOD | value map: `code` |  |
| `ZEMX_I_MeasurementDocument` | `MeasurementDocumentText` | IMRG-MDTXT | IMRG-MDTXT | copy |  |
| `ZEMX_I_MeasurementDocument` | `MsmtDocumentIsCancelled` | IMRG-CANCL | - | scope filter |  |
| `ZEMX_I_MeasurementDocument` | `CreationDate` | IMRG-ERDAT | - | information only |  |
| `ZEMX_I_MeasurementDocument` | `CreatedByUser` | IMRG-ERNAM | - | information only |  |

## Value maps and key maps

Templates: `docs/mapping/templates/` (columns `source,target,comment`). An empty map means "same value on S/4HANA".

- value map `code`
- value map `unit_of_measure`
- key map `measuring_point`

## Reconciliation

- Counts: `ZEMX_R_MeasDocCount` (ECC) vs `-` (S/4HANA) per `MsmtDocumentIsCancelled`

```bash
python3 tools/mig_reconcile.py counts --module measurement_document --source ecc_counts.csv --target s4_counts.csv --maps <folder>
```

## Open gaps

None known.
