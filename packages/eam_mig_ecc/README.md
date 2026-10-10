# EAM Migration - ECC source views (`ZEMX_`)

> **Status: draft-unverified (pilot).** No SAP system has been available, so nothing has been activated,
> extracted or loaded. Tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Every uncertain
> table field, annotation and rule is marked `TODO-VERIFY` and ranked in [`BATCH_REPORT.md`](BATCH_REPORT.md).

Part of the **EAM migration model**: moving Plant Maintenance data from an old SAP ERP (ECC 6.0) system to
SAP S/4HANA (new implementation or selective data transition; a system conversion converts the data in place
and does not need it). The package is a **template of views only**: the consumption views deliver the data
exactly as it is stored in ECC. The customer's load program reads them and changes values and posts the data on
S/4HANA as the project needs.

## Architecture: basic → composite → consumption

```
 ECC tables ──► basic ZEMX_I_*  ──► composite ZEMX_I_*  ──► consumption ZEMX_C_*Mig  ──► load program ──► S/4HANA
               one table each       business object         migration template           (customer)
               (EQUI, EQUZ, ...)    (joins, status flags,   scope applied, migrated
                                    current versions)       fields only, values as in ECC
```

| Layer | Naming | Rule (checked by the validators) |
|---|---|---|
| Basic | `ZEMX_I_<Entity>` (e.g. `ZEMX_I_EquipmentHeader` on EQUI) | Exactly one table per view; filters on that table only (e.g. `OBJTY = 'A'`, status `I0076`). Technical field names → semantic names. |
| Composite | `ZEMX_I_<Object>` (e.g. `ZEMX_I_Equipment`) | Reads only basic / composite views. Assembles the business object: joins (equipment = EQUI + current EQUZ segment + ILOA + work center + deletion flag), internal IDs → business keys (work center name + plant, class / characteristic names), current versions, scope flags. |
| Consumption | `ZEMX_C_<Object>Mig`, `ZEMX_C_<Object>MigCount` | Reads composite (or basic) views. One view per migration structure: only records in scope, only the fields that are migrated, values unchanged. The only layer with `@Analytics.dataExtraction.enabled: true`. Count views for reconciliation. |

Layer naming follows the SAP VDM convention (`I_` for basic and composite views, `C_` for consumption views,
layer set by `@VDM.viewType`). The order of the layers (upper layers read only the same or lower layers,
only basic views read tables) is checked by `tools/tests/test_build_migration.py`.

## Modules and load order

| Module | Consumption views (interface) | Load level | Numbering |
|---|---|---|---|
| `core` | - (shared basic views: ILOA, status flags, characteristics) | - | - |
| `work_center` | `ZEMX_C_WorkCenterMig`, `…TextMig`, `…CostCtrMig` | 1 | keep |
| `functional_location` | `ZEMX_C_FuncLocMig`, `ZEMX_C_FuncLocTextMig` | 2 | keep |
| `equipment` | `ZEMX_C_EquipmentMig`, `ZEMX_C_EquipmentTextMig` | 3 | keep |
| `measuring_point` | `ZEMX_C_MeasuringPointMig` | 4 | new |
| `task_list` | `ZEMX_C_TaskListMig`, `…OperationMig`, `…AllocationMig` | 4 | new |
| `classification` | `ZEMX_C_ClassAssignmentMig`, `ZEMX_C_CharcValueMig` | 4 | derived |
| `maintenance_notification` | `ZEMX_C_MaintNotificationMig`, `ZEMX_C_MaintNotifItemMig` (open only) | 4 | new |
| `measurement_document` | `ZEMX_C_MeasReadingMig` (last reading per point) | 5 | new |
| `maintenance_plan` | `ZEMX_C_MaintenancePlanMig` (incl. restart date), `…ItemMig`, `…CycleMig` | 6 | new |
| `maintenance_order` | `ZEMX_C_MaintOrderMig`, `…OperationMig`, `…ComponentMig` (open only) | 7 | new |
| `object_status`, `object_partner`, `long_text` | `ZEMX_C_UserStatusMig`, `ZEMX_C_ObjectPartnerMig`, `ZEMX_C_LongTextIndexMig` | 8 | derived |

Every module depends on `core`; modules with a work center reference also depend on `work_center` (the build
adds them automatically). Per module, [`docs/mapping/<module>.md`](docs/mapping/) describes the interface:
structures, keys, scope, every delivered field with its ECC source, S/4HANA target and rule, the fields that are
not delivered and why, and reconciliation. [`docs/MIGRATION_SEQUENCE.md`](docs/MIGRATION_SEQUENCE.md) has the
load order.

## Rules for this product (differences from the S/4HANA products)

1. **Tables, not released views.** ECC has no released `I_` views, so the basic views read the PM tables directly.
   Hard rule 1 reads: *released `I_` views on S/4HANA; direct table reads on the ECC side.* No SAP source is copied.
2. **Classic views** (`define view` + `@AbapCatalog.sqlViewName`, max. 16 characters incl. prefix), no view
   entities, no DCL (validator rule M12).
3. **No CDS access control by design** (XGEN-D01): the views must return every record; access is controlled by
   the load program's (RFC) user and table authorizations (`S_TABU_NAM`).
4. **Nothing is filtered silently:** basic and composite views return everything with scope flags; the
   consumption views apply the documented scope filter (checked against `mapping.json`, rule X6).

## Build, checks, reconciliation

```bash
python3 build_package.py --product eam_mig_ecc equipment --prefix ZACME_ --package ZACME_MIG   # + core, work_center
python3 build_package.py --product eam_mig_s4  equipment --prefix ZACME_ --package ZACME_MIG
python3 tools/check_all.py --only eam_mig_ecc     # abaplint (7.40 SP08), M1-M12, mapping X1-X6, docs
python3 tools/mig_reconcile.py counts  --module equipment --source ecc_counts.csv  --target s4_counts.csv
python3 tools/mig_reconcile.py records --module equipment --source ecc_extract.csv --target s4_compare.csv
```

The ECC ZIP contains the views, `mapping/<module>/mapping.json`, the description pages and `MIGRATION_SEQUENCE.md`.
Reconciliation compares the consumption views with the S/4HANA views of
[`packages/eam_mig_s4`](../eam_mig_s4/README.md) after the load. If the load program changed values (new plant
codes, new numbers), pass those old -> new lists to `tools/mig_reconcile.py` with `--maps <folder> --translate`.

## Known gaps of the pilot

Long text content (STXL is compressed - the load program reads it with `READ_TEXT` using the long text index),
work center capacities, task list components / PRTs, notification causes / tasks / activities, order settlement
rules, serial number stock data and alternative functional location labels. See `BATCH_REPORT.md`.
