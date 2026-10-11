# Migration interface: master_inspection_characteristic

> Version **1.0.0**

- **Read by:** Customer-verified business interface; master restrictions apply
- **Load after:** - (first level)
- **Business key:** `Plant`, `MasterInspectionCharacteristic`, `CharacteristicVersion` · numbering **keep**
- **Key rule:** Preserve source identifiers in an audit ledger; map regenerated internal IDs and target numbering. Never assume internal IDs survive migration.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZQMX_C_MasterCharMig`

- Source: `ZQMX_I_MasterChar`
- Keys: `Plant`, `MasterInspectionCharacteristic`, `CharacteristicVersion`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Lots, results and usage decisions have process and status prerequisites. Results are reference data until a supported transfer interface is selected. Inspection plans require task-list effectivity, selected operations, characteristics, sampling and material assignments; plain PLKO rows are not an effective plan. Notifications require catalogs, partners and status decisions. Retain plant, characteristic, version and language. Verify released status, quantitative/qualitative control indicators, limits, units, inspection methods and catalog/selected-set dependencies in full-row export. Short texts are included; long texts need the native text API. Do not infer active version solely from greatest version number.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Plant` | QPMK-WERKS | customer interface field: Plant (unconfirmed) | copy | yes |
| `MasterInspectionCharacteristic` | QPMK-MKMNR | customer interface field: MasterInspectionCharacteristic (unconfirmed) | copy | yes |
| `CharacteristicVersion` | QPMK-VERSION | customer interface field: CharacteristicVersion (unconfirmed) | copy | yes |
| `ValidityStartDate` | QPMK-GUELTIGAB | customer interface field: ValidityStartDate (unconfirmed) | copy | yes |
| `DeletionFlag` | QPMK-LOEKZ | customer interface field: DeletionFlag (unconfirmed) | copy | yes |
| `ControlIndicators` | QPMK-STEUERKZ | customer interface field: ControlIndicators (unconfirmed) | copy | yes |

## `ZQMX_C_MasterCharTextMig`

- Source: `ZQMX_I_MasterCharText`
- Keys: `Plant`, `MasterInspectionCharacteristic`, `CharacteristicVersion`, `Language`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Lots, results and usage decisions have process and status prerequisites. Results are reference data until a supported transfer interface is selected. Inspection plans require task-list effectivity, selected operations, characteristics, sampling and material assignments; plain PLKO rows are not an effective plan. Notifications require catalogs, partners and status decisions. Retain plant, characteristic, version and language. Verify released status, quantitative/qualitative control indicators, limits, units, inspection methods and catalog/selected-set dependencies in full-row export. Short texts are included; long texts need the native text API. Do not infer active version solely from greatest version number.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Plant` | QPMT-WERKS | customer interface field: Plant (unconfirmed) | copy | yes |
| `MasterInspectionCharacteristic` | QPMT-MKMNR | customer interface field: MasterInspectionCharacteristic (unconfirmed) | copy | yes |
| `CharacteristicVersion` | QPMT-VERSION | customer interface field: CharacteristicVersion (unconfirmed) | copy | yes |
| `Language` | QPMT-SPRACHE | customer interface field: Language (unconfirmed) | copy | yes |
| `CharacteristicDescription` | QPMT-KURZTEXT | customer interface field: CharacteristicDescription (unconfirmed) | copy | yes |

## `ZQMX_C_MasterCharLongTextMig`

- Source: `ZQMX_I_MasterCharLongText`
- Keys: `TextObject`, `TextName`, `TextID`, `Language`
- Scope: `all rows`
- Delivery mode: **reference**
- Before posting: SAPscript index only. Populate the explicit full text-key to business-owner link file from the source text editor/application metadata, run the text_scope preparation step against selected masters, then READ_TEXT to retrieve ordered formatted lines. Never infer the business owner from a TDNAME substring or post compressed STXL data. Retain plant, characteristic, version and language. Verify released status, quantitative/qualitative control indicators, limits, units, inspection methods and catalog/selected-set dependencies in full-row export. Short texts are included; long texts need the native text API. Do not infer active version solely from greatest version number.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `TextObject` | STXH-TDOBJECT | - | copy |  |
| `TextName` | STXH-TDNAME | - | copy |  |
| `TextID` | STXH-TDID | - | copy |  |
| `Language` | STXH-TDSPRAS | - | copy |  |

## Reconciliation

- Counts: `ZQMX_C_MasterCharMigCount` (ECC) vs `-` (S/4HANA) per `Plant`

```bash
python3 tools/mig_reconcile.py counts --product qm_mig_ecc --module master_inspection_characteristic --source ecc_counts.csv --target s4_counts.csv
```

## Open gaps

- Lots, results and usage decisions have process and status prerequisites. Results are reference data until a supported transfer interface is selected. Inspection plans require task-list effectivity, selected operations, characteristics, sampling and material assignments; plain PLKO rows are not an effective plan. Notifications require catalogs, partners and status decisions.
- Retain plant, characteristic, version and language. Verify released status, quantitative/qualitative control indicators, limits, units, inspection methods and catalog/selected-set dependencies in full-row export. Short texts are included; long texts need the native text API. Do not infer active version solely from greatest version number.
