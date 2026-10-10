# Migration interface: work_center

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been run on a system.

- **Read by:** customer load program (reads the consumption views, posts on S/4HANA)
- **Load after:** - (first level)
- **Business key:** `WorkCenter`, `Plant` · numbering **keep**
- **Key rule:** Work center names are external keys; keep them.

> TODO-VERIFY[M] XWC-M01: target fields are the S/4HANA table fields, assumed unchanged from ECC for Plant Maintenance; confirm them against the posting interface (BAPI / API) the load program uses

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZEMX_C_WorkCenterMig`

- Source: `ZEMX_I_WorkCenterHeader`
- Keys: `WorkCenter`, `Plant`
- Scope: `src.IsMarkedForDeletion = ''`

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `WorkCenter` | CRHD-ARBPL | CRHD-ARBPL | copy | yes |
| `Plant` | CRHD-WERKS | CRHD-WERKS | copy | yes |
| `WorkCenterCategoryCode` | CRHD-VERWE | CRHD-VERWE | copy | yes |
| `WorkCenterResponsible` | CRHD-VERAN | CRHD-VERAN | copy | yes |
| `TaskListUsage` | CRHD-PLANV | CRHD-PLANV | copy |  |
| `ValidityStartDate` | CRHD-BEGDA | CRHD-BEGDA | copy | yes |
| `ValidityEndDate` | CRHD-ENDDA | CRHD-ENDDA | copy |  |

## `ZEMX_C_WorkCenterTextMig`

- Source: `ZEMX_I_WorkCenterText`
- Keys: `WorkCenter`, `Plant`, `Language`
- Scope: `src.IsMarkedForDeletion = ''`

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `WorkCenter` | CRHD-ARBPL | CRHD-ARBPL | copy |  |
| `Plant` | CRHD-WERKS | CRHD-WERKS | copy |  |
| `Language` | CRTX-SPRAS | CRTX-SPRAS | copy |  |
| `WorkCenterText` | CRTX-KTEXT | CRTX-KTEXT | copy |  |

## `ZEMX_C_WorkCenterCostCtrMig`

- Source: `ZEMX_I_WorkCenterCostCenter`
- Keys: `WorkCenter`, `Plant`, `ValidityEndDate`
- Scope: `src.IsMarkedForDeletion = ''`

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `WorkCenter` | CRHD-ARBPL | CRHD-ARBPL | copy |  |
| `Plant` | CRHD-WERKS | CRHD-WERKS | copy |  |
| `ValidityEndDate` | CRCO-ENDDA | CRCO-ENDDA | copy |  |
| `ValidityStartDate` | CRCO-BEGDA | CRCO-BEGDA | copy |  |
| `ControllingArea` | CRCO-KOKRS | CRCO-KOKRS | copy |  |
| `CostCenter` | CRCO-KOSTL | CRCO-KOSTL | copy |  |

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

## Reconciliation

- Counts: `ZEMX_C_WorkCenterMigCount` (ECC) vs `ZEMT_I_WorkCenterCount` (S/4HANA) per `Plant`, `WorkCenterCategoryCode`
- Records and fields: `ZEMX_C_WorkCenterMig` vs `ZEMT_I_WorkCenterCompare` on `WorkCenter`, `Plant`; compared: `WorkCenterCategoryCode`, `WorkCenterResponsible`, `ValidityStartDate`

```bash
python3 tools/mig_reconcile.py counts --module work_center --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --module work_center --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- TODO-VERIFY[M] XWC-G01: capacities (KAKO/CRCA), scheduling formulas and default values are not extracted in the pilot
