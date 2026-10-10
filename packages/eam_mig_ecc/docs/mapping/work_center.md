# Mapping: work_center

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been run on a system.

- **Target:** SAP S/4HANA Migration Cockpit - migration object *Work center*
- **Load after:** - (first level)
- **Business key:** `WorkCenter`, `Plant` · numbering **keep**
- **Key rule:** Work center names are external keys; keep them unless plants are renamed (value map 'plant').
- **Scope filter:** `IsMarkedForDeletion = ''` - Work centers flagged for deletion are not migrated.

> TODO-VERIFY[H] XWC-M01: Migration Cockpit object for 'Work center' (name, approach staging tables / direct transfer) and its structure field names; targets below are the S/4HANA table fields, assumed unchanged from ECC for Plant Maintenance

## Fields

| View | Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|---|
| `ZEMX_I_WorkCenter` | `WorkCenterInternalID` | CRHD-OBJID | - | not migrated: internal object ID - regenerated on S/4HANA; the business key is WorkCenter + Plant |  |
| `ZEMX_I_WorkCenter` | `WorkCenterTypeCode` | CRHD-OBJTY | CRHD-OBJTY | constant: `A` |  |
| `ZEMX_I_WorkCenter` | `WorkCenter` | CRHD-ARBPL | CRHD-ARBPL | key map: `work_center` | yes |
| `ZEMX_I_WorkCenter` | `Plant` | CRHD-WERKS | CRHD-WERKS | value map: `plant` | yes |
| `ZEMX_I_WorkCenter` | `WorkCenterCategoryCode` | CRHD-VERWE | CRHD-VERWE | value map: `work_center_category` | yes |
| `ZEMX_I_WorkCenter` | `WorkCenterResponsible` | CRHD-VERAN | CRHD-VERAN | value map: `work_center_responsible` | yes |
| `ZEMX_I_WorkCenter` | `TaskListUsage` | CRHD-PLANV | CRHD-PLANV | copy |  |
| `ZEMX_I_WorkCenter` | `ValidityStartDate` | CRHD-BEGDA | CRHD-BEGDA | copy | yes |
| `ZEMX_I_WorkCenter` | `ValidityEndDate` | CRHD-ENDDA | CRHD-ENDDA | copy |  |
| `ZEMX_I_WorkCenter` | `IsMarkedForDeletion` | CRHD-LVORM | - | scope filter |  |
| `ZEMX_I_WorkCenter` | `LastChangeDate` | CRHD-AEDAT_GRND | - | information only |  |
| `ZEMX_I_WorkCenterText` | `WorkCenterInternalID` | CRTX-OBJID | - | not migrated: internal object ID |  |
| `ZEMX_I_WorkCenterText` | `Language` | CRTX-SPRAS | CRTX-SPRAS | copy |  |
| `ZEMX_I_WorkCenterText` | `WorkCenter` | CRHD-ARBPL | CRHD-ARBPL | key map: `work_center` |  |
| `ZEMX_I_WorkCenterText` | `Plant` | CRHD-WERKS | CRHD-WERKS | value map: `plant` |  |
| `ZEMX_I_WorkCenterText` | `WorkCenterText` | CRTX-KTEXT | CRTX-KTEXT | copy |  |
| `ZEMX_I_WorkCenterCostCtr` | `WorkCenterInternalID` | CRCO-OBJID | - | not migrated: internal object ID |  |
| `ZEMX_I_WorkCenterCostCtr` | `ActivityTypeSet` | CRCO-LASET | - | information only |  |
| `ZEMX_I_WorkCenterCostCtr` | `ValidityEndDate` | CRCO-ENDDA | CRCO-ENDDA | copy |  |
| `ZEMX_I_WorkCenterCostCtr` | `CostCenterAssgmtCounter` | CRCO-LANUM | - | information only |  |
| `ZEMX_I_WorkCenterCostCtr` | `WorkCenter` | CRHD-ARBPL | CRHD-ARBPL | key map: `work_center` |  |
| `ZEMX_I_WorkCenterCostCtr` | `Plant` | CRHD-WERKS | CRHD-WERKS | value map: `plant` |  |
| `ZEMX_I_WorkCenterCostCtr` | `ValidityStartDate` | CRCO-BEGDA | CRCO-BEGDA | copy |  |
| `ZEMX_I_WorkCenterCostCtr` | `ControllingArea` | CRCO-KOKRS | CRCO-KOKRS | value map: `controlling_area` |  |
| `ZEMX_I_WorkCenterCostCtr` | `CostCenter` | CRCO-KOSTL | CRCO-KOSTL | value map: `cost_center` |  |

## Value maps and key maps

Templates: `docs/mapping/templates/` (columns `source,target,comment`). An empty map means "same value on S/4HANA".

- value map `controlling_area`
- value map `cost_center`
- value map `plant`
- value map `work_center_category`
- value map `work_center_responsible`
- key map `work_center`

This object's load provides the key map(s) `work_center` (old key, new key from the load log).

## Reconciliation

- Counts: `ZEMX_R_WorkCenterCount` (ECC) vs `ZEMT_R_WorkCenterCount` (S/4HANA) per `Plant` (value map `plant`), `WorkCenterCategoryCode` (value map `work_center_category`)
- Records and fields: `ZEMX_I_WorkCenter` vs `ZEMT_I_WorkCenterCompare` on `WorkCenter`, `Plant` (key map `work_center`); compared fields: `WorkCenterCategoryCode`, `WorkCenterResponsible`, `ValidityStartDate`

```bash
python3 tools/mig_reconcile.py counts --module work_center --source ecc_counts.csv --target s4_counts.csv --maps <folder>
python3 tools/mig_reconcile.py records --module work_center --source ecc_extract.csv --target s4_compare.csv --maps <folder>
```

## Open gaps

- TODO-VERIFY[M] XWC-G01: capacities (KAKO/CRCA), scheduling formulas and default values are not extracted in the pilot
