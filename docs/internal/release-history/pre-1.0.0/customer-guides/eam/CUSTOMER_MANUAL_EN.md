# ModuPorter EAM Customer Documentation

ECC and S4HANA migration and customer validation

Version 1.0.0-rc.1 • 10 October 2026 • 

This manual guides SAP consultants and ABAP developers through installation, extraction, cutover preparation and reconciliation of the ModuPorter EAM pack. Start with the included local example, then validate the templates in a SAP development environment. Successful SAP activation or loading has not yet been established for this release candidate.

| Delivery | Coverage |
| --- | --- |
| ECC CDS | 158 views across 15 modules |
| Extraction | 41 structures, 14 count views, 440 mapped fields |
| S4HANA | 16 compare and count views across 8 modules |
| Preparation | 15 snapshot contracts, parent cohorts, joins and service packages |
| ABAP | 2 optional reports for full table rows and long texts |
| Specialized data | 31 tables in the supplemental DDIC export inventory |

## Responsibilities and release status

The customer supplies the selected object population, verified DDIC definitions, SAP native ECM eligibility decisions, old to new identifier maps and target loading with transaction and error handling. Field mappings name provisional table references; they do not define a supported posting interface.

64 offline regression tests and the package checks passed. They do not establish SAP runtime compatibility. The baseline records 97 open ECC verification markers and 9 S4 markers; the reports require additional DDIC and runtime checks.

Technical baseline: cc08609d92e6a623412c395f0fac4d6205cf376f

## VDM architecture and modules

The architecture follows the module manifests: SAP source → Basic → Composite → Consumption. Basic wraps direct sources, Composite joins or selects data and Consumption provides extraction contracts or counts. Both lower source layers can use ZEMX_I_; the name alone does not determine the layer. ZEMT_ belongs to the target companion.

| Module | Business object | Views |
| --- | --- | --- |
| classification | Classification | 8 |
| core | Shared technical references | 6 |
| equipment | Equipment | 10 |
| equipment_bom | Equipment BOMs | 13 |
| functional_location | Functional locations | 9 |
| long_text | Long text index | 3 |
| maintenance_notification | Maintenance notifications | 17 |
| maintenance_order | Maintenance orders | 19 |
| maintenance_plan | Maintenance plans | 11 |
| measurement_document | Measurement documents | 7 |
| measuring_point | Measuring points | 4 |
| object_partner | Object partners | 3 |
| object_status | Object status | 6 |
| task_list | Maintenance task lists | 27 |
| work_center | Work centers | 15 |

## Diagram and object catalog

The separate VDM diagram contains all 174 delivered CDS views, their direct data sources, associations, keys and verification markers. Select an object to highlight its dependencies. Supplemental tables, reports and Python tools are identified separately. The relationships show data lineage, not an approved loading sequence.

The S4 companion covers main objects. For additional child structures, the customer exports target CSVs with canonical aliases. Per view details are available in docs/views; the complete machine readable catalog is moduporter-eam-object-catalog.csv.

## Installation and authorizations

1. Extract the outer customer pack. Do not import that archive directly into SAP. Read START_HERE.md, docs/SUPPORTED_SCOPE.md and the license.

1. Inspect BUILD_MANIFEST.json, OPEN_CHECKS.md and DDIC_REQUIREMENTS.csv in the ECC archive. ECC 6.0 with NetWeaver 7.40 SP08 or higher is an assumption that needs confirmation on your system.

1. Create a development package and transport in ECC. Import src through abapGit and activate using ACTIVATION_ORDER.txt. Association cycles may require group activation. The default prefix and package are ZEMX_ and ZEMX_MIG.

1. Install the separate S4 companion in the target under ZEMT_ and ZEMT_MIG. S4HANA 2025 on premise or private edition is the assumed baseline. Verify availability and release status of referenced SAP views.

1. Create the two optional files in helpers as executable SE38 reports. They deliberately sit outside src and are not imported with the CDS views.

1. Resolve every TODO against DDIC, function module signatures and the real posting interface. Record the finding and change instead of guessing a replacement field.

## Verify access

Migration views intentionally have no DCL. Test the actual SQL, RFC or export channel with permitted and restricted users. S_TABU_NAM does not automatically protect every custom reader. The table report explicitly checks S_TABU_NAM with ACTVT 03; the text report also needs READ_TEXT authorization testing. The reports use the current client and interactive SAP GUI file export.

## First local test


```text
python tools/eam_run.py --project customer/examples/workflow.json --out trial-example
```

Python 3.10 or higher is sufficient; no third party Python packages are required. Expect one equipment segment for plant 2000, one task list header and two nested service rows. PREPARATION_AUDIT.json records hashes and row counts. Use a new output directory for each run.

## Cutover date and object scope

CDS views selecting the highest stored counter or open equipment segment provide a prefiltered preview. A historical cutover needs complete raw histories. Removing future rows afterwards cannot restore older states that the preview already discarded.

1. Agree the date, client, selected root objects and existing target references. Preserve internal IDs and leading zeros.

1. Export all relevant table states. Verify the 15 snapshot contracts under customer/contracts against actual identity columns and validity rules.

1. For change number tables, supply Eligible=Y/N for every state from native SAP ECM evaluation. Date, change status and effectivity parameters must match the project. Unevaluated states are rejected.

1. Select the eligible state before applying deletion filtering. Date boundaries are inclusive. Overlapping intervals and ambiguous ranks fail; a deleted latest state does not resurrect its predecessor. Cancelled measurement documents are excluded before ranking.

1. Join selected EQUZ segments to EQUI, ILOA and CRHD and selected PLAS assignments to PLPO details on all identity columns. Joins must be many to one. Orphans and output alias collisions fail.

1. Scope every child structure to the selected parents. structure-cohorts.json covers all 41 structures. Classification, status, partners and texts need explicit typed or complete identity keys.

## BOMs and technical IDs

Snapshot STKO and STAS/STPO separately. EQST identifies equipment, plant, usage and alternative; surviving STAS rows determine the STPO nodes. STLNR alone does not isolate alternatives. reference_keys creates reference sets without deduplicating payloads. Retain maps for operation nodes, BOMs, capacities, classification, settlements and service packages.


```text
python tools/eam_prepare.py snapshot --input equz.csv
  --contract customer/contracts/equz-snapshot.json
  --cutover 20261010 --out equz_at_cutover.csv
```

Commands wrapped across lines for readability must be executed as one line.

## Specialized data and long texts

Specialized data is delivered through full DDIC exports and preparation recipes. The inventory defines intended coverage; actual availability and keys need confirmation on the customer system.

| Group | Tables |
| --- | --- |
| capacity | KAKO, KAKT, KAZY, KAPA, KAPE |
| shift calendars | T550A, T550P |
| formulas and defaults | TC20, TC20T, TC21, TC21T, TC25, TC25T, CRHD |
| task list relationships | PLAB, PLFL |
| service packages | ESLH, ESLL, ESUH, ESUC, ESUP, ESUS |
| object dependencies | CUOB, CUKB, CUKT, CUKN, CUXREF, CABN, CABNT, CAWN, CAWNT |

## Full table export

ZEMX_EAM_TABLE_EXPORT exports every DDIC field and an adjacent .fields.csv with keys, types, lengths and decimals. P_TABLE must be allowlisted. Supply P_FIELD and P_KEYS together; the filter accepts CHAR or NUMC and a UTF8 file with one internal key per line and no header. Composite identities need additional cohort filtering.

P_FILE names a new local CSV. P_MAX defaults to 10000 and permits at most 1000000. Exceeding the limit stops publication of a truncated export. Validate decimal, floating point and binary representations against DDIC. The report does not decode dependency source or write target tables.

## Long text content and service packages


```text
python tools/eam_prepare.py text-keys --input selected_text_index.csv
  --out selected_text_keys.tsv
```

The text index contains keys only. Pass the selected TSV to ZEMX_EAM_TEXT_EXPORT. READ_TEXT preserves order, language and SAPscript format; empty texts have LineNumber 0. A missing or failed text prevents publication of the whole payload. Target creation belongs to the customer loader. Compare Format and Text including significant whitespace.

Seed service packages from selected operations and follow ESLL.SUB_PACKNO recursively. Missing nested packages or cycles fail. Check calendars, formulas, dependencies and both ends of operation relationships as referenced data; avoid indiscriminate copying of customizing.

## Preparation and reconciliation

eam_run.py executes a JSON project containing snapshot, cohort, join, aliases, closure and reference_keys. It validates all steps before publishing to a new directory. eam_prepare.py runs individual steps and comparisons. mig_reconcile.py compares main objects and counts using module mappings.

## Compare a canonical structure


```text
python tools/eam_prepare.py compare --input ecc_items.csv
  --target s4_items.csv
  --mapping mapping/maintenance_notification/mapping.json
  --view ZEMX_C_MaintNotifItemMig --out item_report.md
```

All 41 canonical structures support comparison. Target CSVs need the documented aliases. Use --fields only for an explicitly justified subset and record excluded fields. --maps <folder> --translate applies verified conversions. Example map files are not production mappings.

## Compare raw rows and long texts


```text
python tools/eam_prepare.py compare-raw --input ecc_kapa.csv
  --target s4_kapa.csv --schema ecc_kapa.csv.fields.csv
  --out capacity_report.md
python tools/eam_prepare.py compare-raw --input ecc_texts.csv
  --target s4_texts.csv --schema customer/contracts/long-text.fields.csv
  --contract customer/contracts/long-text-compare.json --out text_report.md
```

Raw comparison uses exported DDIC keys excluding MANDT and requires every source field on the target. When technical IDs change, define a verified business key contract and the required maps. The tool does not silently reduce comparison to intersecting fields. Long texts use ordered text keys and whitespace preserving comparison.

## CSV and result interpretation

CSV files require a header, unique columns and matching row widths. Empty exports still need a header. Duplicate keys and collisions after translation are input errors. Preserve leading zeros; --strip-zeros is not a general solution. Counts must be finite, nonnegative integers. Comparison exit code 0 means no differences, 1 means differences and 2 means an input or usage error. Two empty populations do not prove extraction succeeded.

## Customer acceptance and troubleshooting

1. Record ECC and S4 releases, support packages, client, transport, prefix, revision and cutover date.

1. Log activation and DDIC deviations for every relevant object. Verify keys, deletion, validity, parent scope, decimals and units.

1. Test permitted and restricted identities, Unicode, CSV quoting, leading zeros, empty populations, cancellation and export limit failures.

1. Run a trial load through the customer interface. Verify error handling, commits, restart behavior and old to new IDs before extracting again.

1. Complete TEST_RESULTS.csv with PASS, FAIL, BLOCKED, NOT_TESTED or NOT_APPLICABLE and evidence or a reason. Include reports, hashes and anonymized differences.

| Finding | Next action |
| --- | --- |
| DDIC / activation | Keep the exact message; inspect DDIC or the SAP view; record the correction. |
| Duplicate key | Inspect identity, joins, selected version and maps; do not deduplicate payloads. |
| Missing Eligible | Supply native SAP ECM evaluation; record effectivity limitations. |
| Empty export | Check selection, authorization, client and deletion filters; establish legitimate emptiness. |
| Target difference | Check scope, loading logs, field conversions and technical ID maps. |

## License and acceptance

The included LICENSE.md allows unlimited use and modification, including client implementations, and prohibits standalone resale of the library. Refer to that file for the actual terms. SAP entitlements, customer interfaces and project approvals remain separate. No SAP certification, maintenance commitment or successful target loading is promised.

Change draft-unverified status only after evidenced system validation. Keep unresolved findings visible in the test record. Final customer acceptance requires documented checks of the objects and loading processes actually needed.

## Canonical extraction structures 1

These 41 structures come from the module mappings. Field counts include keys and payload fields. Complete keys and rules are in mapping/<module>/mapping.json and FIELD_CATALOG.csv; a view is not a posting API.

| Extraction view | Module | Fields |
| --- | --- | --- |
| ZEMX_C_CharcValueMig | classification | 8 |
| ZEMX_C_ClassAssignmentMig | classification | 4 |
| ZEMX_C_EquipSerialStockMig | equipment | 5 |
| ZEMX_C_EquipmentMig | equipment | 44 |
| ZEMX_C_EquipmentTextMig | equipment | 3 |
| ZEMX_C_BOMHeaderMig | equipment_bom | 8 |
| ZEMX_C_BOMItemMig | equipment_bom | 11 |
| ZEMX_C_BOMSelectionMig | equipment_bom | 7 |
| ZEMX_C_EquipBOMAssignMig | equipment_bom | 5 |
| ZEMX_C_FuncLocLabelMig | functional_location | 4 |
| ZEMX_C_FuncLocMig | functional_location | 29 |
| ZEMX_C_FuncLocTextMig | functional_location | 3 |
| ZEMX_C_LongTextIndexMig | long_text | 4 |
| ZEMX_C_MaintNotifItemMig | maintenance_notification | 7 |
| ZEMX_C_MaintNotificationMig | maintenance_notification | 27 |
| ZEMX_C_NotifActivityMig | maintenance_notification | 8 |
| ZEMX_C_NotifCauseMig | maintenance_notification | 6 |
| ZEMX_C_NotifTaskMig | maintenance_notification | 11 |
| ZEMX_C_MaintOrderComponentMig | maintenance_order | 12 |
| ZEMX_C_MaintOrderMig | maintenance_order | 28 |
| ZEMX_C_MaintOrderOperationMig | maintenance_order | 13 |

## Canonical extraction structures 2

These 41 structures come from the module mappings. Field counts include keys and payload fields. Complete keys and rules are in mapping/<module>/mapping.json and FIELD_CATALOG.csv; a view is not a posting API.

| Extraction view | Module | Fields |
| --- | --- | --- |
| ZEMX_C_OrderPermitMig | maintenance_order | 3 |
| ZEMX_C_OrderSettlementMig | maintenance_order | 19 |
| ZEMX_C_MaintPlanCycleMig | maintenance_plan | 6 |
| ZEMX_C_MaintenanceItemMig | maintenance_plan | 18 |
| ZEMX_C_MaintenancePlanMig | maintenance_plan | 17 |
| ZEMX_C_MeasReadingMig | measurement_document | 10 |
| ZEMX_C_MeasuringPointMig | measuring_point | 17 |
| ZEMX_C_ObjectPartnerMig | object_partner | 5 |
| ZEMX_C_UserStatusMig | object_status | 4 |
| ZEMX_C_TaskListAllocationMig | task_list | 8 |
| ZEMX_C_TaskListCompMig | task_list | 10 |
| ZEMX_C_TaskListMig | task_list | 14 |
| ZEMX_C_TaskListOperationMig | task_list | 17 |
| ZEMX_C_TaskListPRTMig | task_list | 9 |
| ZEMX_C_TaskListPackageMig | task_list | 6 |
| ZEMX_C_CapacityHeaderMig | work_center | 3 |
| ZEMX_C_WorkCenterCapacityMig | work_center | 8 |
| ZEMX_C_WorkCenterCostCtrMig | work_center | 8 |
| ZEMX_C_WorkCenterMig | work_center | 7 |
| ZEMX_C_WorkCenterTextMig | work_center | 4 |

## Further package references

docs/CUSTOMER_WORKFLOW.md • docs/CUSTOMER_TEST.md • docs/KNOWN_LIMITATIONS.md • docs/COMPATIBILITY.md • helpers/README.md • customer/contracts/structure-cohorts.json • customer/contracts/extension-inventory.json • docs/views • FIELD_CATALOG.csv • DDIC_REQUIREMENTS.csv • OPEN_CHECKS.md

