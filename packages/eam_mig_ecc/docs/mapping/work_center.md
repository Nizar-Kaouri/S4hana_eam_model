# Migration interface: work_center

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been run on a system.

- **Read by:** customer load program (reads the consumption views, posts on S/4HANA)
- **Load after:** - (first level)
- **Business key:** `WorkCenter`, `Plant` · numbering **keep**
- **Key rule:** Work center names are external keys; keep them unless plants are renamed (value map 'plant').

> TODO-VERIFY[M] XWC-M01: target fields are the S/4HANA table fields, assumed unchanged from ECC for Plant Maintenance; confirm them against the posting interface (BAPI / API) the load program uses

Values are delivered **translated**: every field marked *value map* / *key map* is looked up in the mapping table `ZEMX_MAP` (map name in capitals); without an entry the old value is delivered. `Legacy*` key fields carry the old key of the record.

## `ZEMX_C_WorkCenterMig`

- Source: `ZEMX_I_WorkCenterHeader`
- Keys: `LegacyWorkCenter`, `LegacyPlant`
- Scope: `src.IsMarkedForDeletion = ''`

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `WorkCenter` | CRHD-ARBPL | CRHD-ARBPL | key map: `WORK_CENTER` | yes |
| `Plant` | CRHD-WERKS | CRHD-WERKS | value map: `PLANT` | yes |
| `WorkCenterCategoryCode` | CRHD-VERWE | CRHD-VERWE | value map: `WORK_CENTER_CATEGORY` | yes |
| `WorkCenterResponsible` | CRHD-VERAN | CRHD-VERAN | value map: `WORK_CENTER_RESPONSIBLE` | yes |
| `TaskListUsage` | CRHD-PLANV | CRHD-PLANV | value map: `TASK_LIST_USAGE` |  |
| `ValidityStartDate` | CRHD-BEGDA | CRHD-BEGDA | copy | yes |
| `ValidityEndDate` | CRHD-ENDDA | CRHD-ENDDA | copy |  |

## `ZEMX_C_WorkCenterTextMig`

- Source: `ZEMX_I_WorkCenterText`
- Keys: `LegacyWorkCenter`, `LegacyPlant`, `Language`
- Scope: `src.IsMarkedForDeletion = ''`

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Language` | CRTX-SPRAS | CRTX-SPRAS | copy |  |
| `WorkCenter` | CRHD-ARBPL | CRHD-ARBPL | key map: `WORK_CENTER` |  |
| `Plant` | CRHD-WERKS | CRHD-WERKS | value map: `PLANT` |  |
| `WorkCenterText` | CRTX-KTEXT | CRTX-KTEXT | copy |  |

## `ZEMX_C_WorkCenterCostCtrMig`

- Source: `ZEMX_I_WorkCenterCostCenter`
- Keys: `LegacyWorkCenter`, `LegacyPlant`, `ValidityEndDate`
- Scope: `src.IsMarkedForDeletion = ''`

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `ValidityEndDate` | CRCO-ENDDA | CRCO-ENDDA | copy |  |
| `WorkCenter` | CRHD-ARBPL | CRHD-ARBPL | key map: `WORK_CENTER` |  |
| `Plant` | CRHD-WERKS | CRHD-WERKS | value map: `PLANT` |  |
| `ValidityStartDate` | CRCO-BEGDA | CRCO-BEGDA | copy |  |
| `ControllingArea` | CRCO-KOKRS | CRCO-KOKRS | value map: `CONTROLLING_AREA` |  |
| `CostCenter` | CRCO-KOSTL | CRCO-KOSTL | value map: `COST_CENTER` |  |

## Not delivered

| View | Element | Source | Reason |
|---|---|---|---|
| `ZEMX_I_WorkCenterHeader` | `WorkCenterInternalID` | CRHD-OBJID | not migrated: internal object ID - regenerated on S/4HANA; the business key is WorkCenter + Plant |
| `ZEMX_I_WorkCenterHeader` | `IsMarkedForDeletion` | CRHD-LVORM | scope flag |
| `ZEMX_I_WorkCenterHeader` | `LastChangeDate` | CRHD-AEDAT_GRND | information only |
| `ZEMX_I_WorkCenterText` | `WorkCenterInternalID` | CRTX-OBJID | not migrated: internal object ID |
| `ZEMX_I_WorkCenterText` | `IsMarkedForDeletion` | CRHD-LVORM | scope flag |
| `ZEMX_I_WorkCenterCostCenter` | `WorkCenterInternalID` | CRCO-OBJID | not migrated: internal object ID |
| `ZEMX_I_WorkCenterCostCenter` | `ActivityTypeSet` | CRCO-LASET | information only |
| `ZEMX_I_WorkCenterCostCenter` | `CostCenterAssgmtCounter` | CRCO-LANUM | information only |
| `ZEMX_I_WorkCenterCostCenter` | `IsMarkedForDeletion` | CRHD-LVORM | scope flag |

## Maps

- value map `CONTROLLING_AREA`
- value map `COST_CENTER`
- value map `PLANT`
- value map `TASK_LIST_USAGE`
- value map `WORK_CENTER_CATEGORY`
- value map `WORK_CENTER_RESPONSIBLE`
- key map `WORK_CENTER`

After loading this object, the key map(s) `WORK_CENTER` (old key, new key from the load log) must be written into `ZEMX_MAP` on the ECC system (by the load program via RFC or by uploading the load log) before the objects that use them are extracted.

## Reconciliation

- Counts: `ZEMX_C_WorkCenterMigCount` (ECC, translated values) vs `ZEMT_I_WorkCenterCount` (S/4HANA) per `Plant`, `WorkCenterCategoryCode`
- Records and fields: `ZEMX_C_WorkCenterMig` vs `ZEMT_I_WorkCenterCompare` on `WorkCenter`, `Plant`; compared: `WorkCenterCategoryCode`, `WorkCenterResponsible`, `ValidityStartDate`

```bash
python3 tools/mig_reconcile.py counts --module work_center --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --module work_center --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- TODO-VERIFY[M] XWC-G01: capacities (KAKO/CRCA), scheduling formulas and default values are not extracted in the pilot
