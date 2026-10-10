# EAM Migration - ECC source extraction (`ZEMX_`)

> **Status: draft-unverified (pilot).** No SAP system has been available, so nothing has been activated,
> extracted or loaded. Tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Every uncertain
> table field, annotation and rule is marked `TODO-VERIFY` and ranked in [`BATCH_REPORT.md`](BATCH_REPORT.md).

Part of the **EAM migration model**: moving Plant Maintenance data from an old SAP ERP (ECC 6.0) system to
SAP S/4HANA (new implementation or selective data transition; a system conversion converts the data in
place and does not need it).

| Piece | Where | Runs on | What it does |
|---|---|---|---|
| Source extraction | this product, `packages/eam_mig_ecc` (`ZEMX_`) | ECC | 44 classic CDS views reading the PM tables directly: full field lists, scope flags, extraction annotations, delta element |
| Mapping model | `modules/<module>/mapping.json`, docs in [`docs/mapping/`](docs/mapping/) | repository | Every element → S/4HANA target field with a rule (copy, value map, key map, conversion, ...), business key and numbering, scope filter, load order |
| Reconciliation | count views here + [`packages/eam_mig_s4`](../eam_mig_s4/README.md) (`ZEMT_`) on S/4HANA + `tools/mig_reconcile.py` | ECC, S/4HANA, laptop | Counts per plant / type and record-by-record field comparison after the load |
| Load | SAP S/4HANA Migration Cockpit | S/4HANA | Not part of this product: the mapping points at its migration objects |

| | |
|---|---|
| Product folder | `packages/eam_mig_ecc` |
| Object prefix | `ZEMX_` (replaceable; SQL view names `ZEMX_xx` are rewritten too) |
| ABAP package | `ZEMX_MIG` |
| Source release | SAP ECC 6.0 on SAP NetWeaver 7.40 SP08 or higher (classic CDS views) |
| Target | SAP S/4HANA 2025 (on-premise / Private Cloud Edition) via the Migration Cockpit |

## Rules for this product (differences from the S/4HANA products)

1. **Tables, not released views.** ECC has no released `I_` views, so the views read the PM tables
   (`EQUI`, `EQUZ`, `ILOA`, `IFLOT`, `CRHD`, `AUFK`, `AFIH`, `QMEL`, `MPLA`, `PLKO`, ...) directly. Hard rule 1
   now reads: *released `I_` views on S/4HANA; direct table reads on the ECC side.* No SAP source is copied.
2. **Classic views only** (`define view` + `@AbapCatalog.sqlViewName`, max. 16 characters incl. prefix), no
   view entities, no DCL - checked by `validate_repo` rule M12.
3. **No CDS access control by design** (decision XGEN-D01): an extraction view must return every record.
   Access is controlled by the extraction channel (ODP / RFC user, `S_TABU_NAM`). Every view is listed in
   `no_dcl_by_design`.
4. **Element names follow the S/4HANA released views** (`Equipment`, `MaintenancePlanningPlant`, ...), so the
   ECC extract and the S/4HANA compare view can be compared by name.
5. **Nothing is silently filtered.** The extraction views return all records with scope flags
   (`IsMarkedForDeletion`, `IsCompleted`, `IsTechnicallyCompleted`, ...); the scope filter is part of the mapping
   and the count views count the scope only.
6. Internal IDs (object numbers, CRHD object IDs, ATINN, CLINT) are resolved to business keys in the views
   (work center name + plant, characteristic name, class name), because they differ on S/4HANA.

## Modules

| Module | Views | Load level | Key numbering |
|---|---|---|---|
| `work_center` | WorkCenter, WorkCenterText, WorkCenterCostCtr, count | 1 | keep |
| `functional_location` | FuncLoc, FuncLocText, count | 2 | keep |
| `equipment` | Equipment, EquipmentText, count | 3 | keep (or key map) |
| `measuring_point` | MeasuringPoint, count | 4 | new |
| `task_list` | TaskList (all versions), TaskListLatestVersion, TaskListCurrent, TaskListOperation, TaskListAllocation, count | 4 | new |
| `classification` | ClassAssignment, CharcValue, count | 4 | derived |
| `maintenance_notification` | MaintNotification, MaintNotifItem, count (open only) | 4 | new |
| `measurement_document` | MeasurementDocument, MeasPointLastDoc, MeasPointLastReading, count | 5 | new |
| `maintenance_plan` | MaintenancePlan, MaintenanceItem, MaintPlanCycle, MaintPlanCallHistory, count | 6 | new |
| `maintenance_order` | MaintOrder, MaintOrderOperation, MaintOrderComponent, count (open only) | 7 | new |
| `object_status`, `object_partner`, `long_text` | ObjectStatus, UserStatusText / ObjectPartner / LongTextHeader, counts | 8 | derived |

The full load order with the value maps and key maps to prepare is in
[`docs/MIGRATION_SEQUENCE.md`](docs/MIGRATION_SEQUENCE.md); one page per object in [`docs/mapping/`](docs/mapping/).
`tools/validate_mapping.py` checks that every element is mapped, that every key map is produced by an object
that loads earlier (or comes from another migration, e.g. fixed assets), and that the reconciliation views
on both systems have the same dimensions and elements.

## Migration run (per object)

1. **Install** the extraction ZIP on ECC and the reconciliation ZIP on S/4HANA (same customer prefix):
   ```bash
   python3 build_package.py --product eam_mig_ecc equipment functional_location --prefix ZACME_ --package ZACME_MIG
   python3 build_package.py --product eam_mig_s4  equipment functional_location --prefix ZACME_ --package ZACME_MIG
   ```
   The ECC ZIP also contains `mapping/<module>/mapping.json`, the mapping pages and `MIGRATION_SEQUENCE.md`.
2. **Prepare the maps** from `docs/mapping/templates/` (`value_map_plant.csv`, `key_map_equipment.csv`, ...:
   columns `source,target,comment`; an empty map means "same value").
3. **Extract** the `ZEMX_I_*` views with the scope filter of the mapping (ODP / Datasphere / SLT / any tool
   that reads CDS views; delta via `LastChangeDate` where annotated), transform with the mapping, load with
   the Migration Cockpit, and keep the old→new key map from the load log.
4. **Reconcile** after the load:
   ```bash
   python3 tools/mig_reconcile.py counts  --module equipment --source ecc_counts.csv  --target s4_counts.csv  --maps maps/
   python3 tools/mig_reconcile.py records --module equipment --source ecc_extract.csv --target s4_compare.csv --maps maps/ --apply-scope
   ```
   Exit code 0 = complete and equal, 1 = differences (Markdown report), 2 = input error.

## Known gaps of the pilot

Long text content (STXL is compressed - needs an ABAP extractor with `READ_TEXT`), work center capacities,
task list components / PRTs, notification causes / tasks / activities, order settlement rules, serial
number stock data and alternative functional location labels are not extracted yet. The Migration Cockpit
object names and structure fields are not confirmed (one `M01` item per module). See `BATCH_REPORT.md`.

## Checks

```bash
python3 tools/check_all.py --only eam_mig_ecc      # abaplint (7.40 SP08 syntax), M1-M12, mapping X1-X6, docs
python3 -m unittest discover -s tools/tests          # incl. reconcile and migration build tests
```
