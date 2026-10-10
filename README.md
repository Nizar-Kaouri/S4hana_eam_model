# ZEAM VDM - modular CDS library for SAP S/4HANA EAM / Plant Maintenance

A modular CDS virtual data model (VDM) for Enterprise Asset Management / Plant
Maintenance. It is built **only on SAP-released `I_` views** and is meant to be sold as a
configurable package: the buyer picks business objects and gets only those, plus what they
depend on.

> **Status: draft-unverified.** No SAP system was available while this was written. No
> object has been activated or tested. Every `module.json` says
> `"status": "draft-unverified"` and `"tested_release": "none (draft, 2025 assumed)"`.
> Every element, association or annotation we are not fully sure of carries a
> `TODO-VERIFY` marker, and all of them are ranked in [`BATCH_REPORT.md`](BATCH_REPORT.md).

| | |
|---|---|
| Target release | SAP S/4HANA 2025 (on-premise / Private Cloud Edition), SAP_BASIS 816 |
| Library prefix | `ZEAM_` (single variable in `library.json`, replaced per customer by the build) |
| Package | `ZEAM_VDM` (also replaceable) |
| Format | abapGit (`/src`, prefix folder logic) |

## Architecture

### Layers

```
                ┌───────────────────────────────┐
consumption     │ ZEAM_C_<Object>Q              │ transient analytical query
(#CONSUMPTION)  │   provider contract           │ (no DCL; provider's DCL applies)
                │   analytical_query            │
                └──────────────┬────────────────┘
                               │ projection on
                ┌──────────────▼────────────────┐
composite       │ ZEAM_R_<Object>               │ #CUBE: measures + foreign keys
(#COMPOSITE)    │   + DDLX (UI, layer #PARTNER) │ to dimensions
                └──────────────┬────────────────┘
                               │ select from
                ┌──────────────▼────────────────┐   ┌──────────────────────────┐
basic           │ ZEAM_I_<Object>  (#DIMENSION) │──▶│ ZEAM_I_<Object>Text      │
(#BASIC)        │ ZEAM_I_<Object>VH (value help)│   │ (#TEXT)                  │
                └──────────────┬────────────────┘   └──────────────────────────┘
                               │ select from
                ┌──────────────▼────────────────┐
SAP released    │ I_Equipment, I_FunctionalLoc… │  (never copied, only consumed)
                └───────────────────────────────┘
```

| Layer | Name pattern | `@VDM.viewType` | Typical `@Analytics` / `@ObjectModel` |
|---|---|---|---|
| basic | `ZEAM_I_*` | `#BASIC` | `#DIMENSION`, `#TEXT`, `#VALUE_HELP` |
| composite | `ZEAM_R_*` | `#COMPOSITE` | `#CUBE` |
| consumption | `ZEAM_C_*Q` | `#CONSUMPTION` | transient `analytical_query` |
| link | `ZEAM_I_<A>With<B>`, `ZEAM_R_<A>With<B>`, `ZEAM_C_<A><B>Q` | per layer | bridge between modules: association view, enriched cube or query |

Every view has a DDL source, an access control (DCL), `@Analytics*`, `@VDM.viewType` and
`@ObjectModel` annotations, and a doc page in [`docs/views`](docs/views/README.md).
The one exception: transient queries cannot have a DCL, so authorization is enforced by
the cube underneath (see GEN-Q01).

### Authorization model

Base views **inherit SAP's own access control**
(`inheriting conditions from entity I_Equipment`), so the library never re-implements PFCG
mappings. Higher layers inherit from the base view of their module. Text views grant
unrestricted read access explicitly. This keeps every role in the package, so a customer
can tighten it in one place.

### Modules, dependencies and link views

- One folder per business object (and per report) under [`modules/`](modules), each with a `module.json`:
  name, objects per layer, DCLs, DDLX, tests, tags, `hard_dependencies`, `link_views`,
  `status`, `tested_release`.
- A **module is self-contained.** A base view may only reference objects of its own module
  or of a declared hard dependency (checked by `tools/validate_repo.py`, rule M6).
- **Cross-object associations live in link views** (for example
  `ZEAM_I_EquipmentWithFuncLoc`). A link view ships only if every module it lists in
  `requires_modules` is selected.
- **Hard dependencies** (a module cannot work without another) are declared in
  `hard_dependencies` and pulled in automatically, transitively, by the build. Examples:
  `measurement_document` → `measuring_point`, `rpt_reliability` → `rpt_downtime` →
  `maintenance_notification`.
- **Reports are modules too** (`rpt_*`, Batch 4). A buyer can take the MTBF/MTTR report
  without the order modules. Link cubes (e.g. `ZEAM_R_DowntimeWithTechObj`) add
  equipment / functional location attributes only when those modules are also selected.

### Naming

- Max 30 characters per object name, including the prefix. Library names are kept at 29 characters
  or fewer (validator rule M9), so a customer prefix of up to 6 characters (`ZACME_`, `/ACME/`) always
  fits. Long names are abbreviated: `FuncLoc` = Functional Location, `MaintNotif` = Maintenance
  Notification, `MaintOrder` = Maintenance Order, `MeasPoint` = Measuring Point, `MeasDocument` =
  Measurement Document, `MaintItem` = Maintenance Item. The build refuses longer prefixes.
- Element names keep the SAP released-view names unchanged (`MaintenancePlant`,
  `FunctionalLocation`, ...). That is what makes DCL inheritance work.

## Repository layout

```
/src/                     abapGit objects (.ddls.asddls/.xml, .dcls.asdcls/.xml, .ddlx.asddlx/.xml)
/modules/<name>/module.json
/docs/views/<View>.md     one page per view (purpose, keys, associations, example use)
/docs/model_map.html      interactive map of all entities, modules and SAP views (generated)
/tests/abap/              ABAP Unit / CDS test double classes (shipped with --with-tests)
/tests/build/             Python unit tests for the build script
/tools/                   sync_xml.py, gen_docs.py, gen_checklist.py, todo_verify_report.py, validate_repo.py
build_package.py          customer build → abapGit ZIP
library.json              prefix, package, phase
.abapgit.xml, abaplint.json
BATCH_REPORT.md           running log + ranked TODO-VERIFY list
ACTIVATION_CHECKLIST.md   import / activation order
ADT_SETUP.md              push / activate / fix loop with abap-adt-api
```

## Modules

| Module | Batch | Hard dependencies | Objects (DDLS) | Status |
|---|---|---|---|---|
| `equipment` | 1 | - | `ZEAM_I_EquipmentText`, `ZEAM_I_Equipment`, `ZEAM_I_EquipmentVH`, `ZEAM_R_Equipment`, `ZEAM_C_EquipmentQ` | draft-unverified |
| `functional_location` | 1 | - | `ZEAM_I_FuncLocText`, `ZEAM_I_FuncLoc`, `ZEAM_I_FuncLocVH`, `ZEAM_R_FuncLoc`, `ZEAM_C_FuncLocQ` | draft-unverified |
| `maintenance_notification` | 2 | - | `ZEAM_I_MaintNotif`, `ZEAM_I_MaintNotifVH`, `ZEAM_R_MaintNotif`, `ZEAM_C_MaintNotifQ` | draft-unverified |
| `maintenance_order` | 2 | - | `ZEAM_I_MaintOrder`, `ZEAM_I_MaintOrderVH`, `ZEAM_I_MaintOrderOperation`, `ZEAM_I_MaintOrderComponent`, `ZEAM_R_MaintOrder`, `ZEAM_R_MaintOrderOperation`, `ZEAM_R_MaintOrderComponent`, `ZEAM_C_MaintOrderQ`, `ZEAM_C_MaintOrderOperationQ`, `ZEAM_C_MaintOrderComponentQ` | draft-unverified |
| `maintenance_plan` | 3 | - | `ZEAM_I_MaintPlan`, `ZEAM_I_MaintItem`, `ZEAM_I_MaintPlanVH`, `ZEAM_R_MaintItem`, `ZEAM_C_MaintItemQ` | draft-unverified |
| `measurement_document` | 3 | `measuring_point` | `ZEAM_I_MeasDocument`, `ZEAM_R_MeasDocument`, `ZEAM_C_MeasDocumentQ` | draft-unverified |
| `measuring_point` | 3 | - | `ZEAM_I_MeasPoint`, `ZEAM_I_MeasPointVH`, `ZEAM_R_MeasPoint`, `ZEAM_C_MeasPointQ` | draft-unverified |
| `task_list` | 3 | - | `ZEAM_I_TaskList`, `ZEAM_I_TaskListVH`, `ZEAM_I_TaskListOperation`, `ZEAM_R_TaskListOperation`, `ZEAM_C_TaskListOperationQ` | draft-unverified |
| `rpt_backlog` | 4 | `maintenance_order` | `ZEAM_R_MaintBacklog`, `ZEAM_C_MaintBacklogQ` | draft-unverified |
| `rpt_downtime` | 4 | `maintenance_notification` | `ZEAM_I_NotifDowntime`, `ZEAM_R_NotifDowntime`, `ZEAM_C_DowntimeQ` | draft-unverified |
| `rpt_order_cost` | 4 | `maintenance_order` | `ZEAM_I_MaintOrderActualCost`, `ZEAM_R_MaintOrderCost`, `ZEAM_C_MaintOrderCostQ` | draft-unverified |
| `rpt_reliability` | 4 | `rpt_downtime` | `ZEAM_R_ReliabilityKPI`, `ZEAM_C_ReliabilityQ` | draft-unverified |
| `equipment_history` | 5 | `equipment` | `ZEAM_I_EquipmentTimeSegment`, `ZEAM_R_EquipTimeSegment`, `ZEAM_C_EquipTimeSegmentQ` | draft-unverified |
| `functional_location_hierarchy` | 5 | `functional_location` | `ZEAM_I_FuncLocHierNode`, `ZEAM_I_FuncLocHier` | draft-unverified |
| `notification_item` | 5 | `maintenance_notification` | `ZEAM_I_MaintNotifItem`, `ZEAM_I_MaintNotifCause`, `ZEAM_R_MaintNotifItem`, `ZEAM_R_MaintNotifCause`, `ZEAM_C_MaintNotifItemQ`, `ZEAM_C_MaintNotifCauseQ` | draft-unverified |
| `work_center` | 5 | - | `ZEAM_I_WorkCenterText`, `ZEAM_I_WorkCenter`, `ZEAM_I_WorkCenterVH`, `ZEAM_R_WorkCenter`, `ZEAM_C_WorkCenterQ` | draft-unverified |

### Link views (ship only when all listed modules are selected)

| Link view | Requires |
|---|---|
| `ZEAM_C_EquipReliabilityQ` | `equipment` + `rpt_reliability` |
| `ZEAM_I_EquipmentWithFuncLoc` | `equipment` + `functional_location` |
| `ZEAM_I_EquipmentWithMaintItem` | `equipment` + `maintenance_plan` |
| `ZEAM_I_EquipmentWithMeasPoint` | `equipment` + `measuring_point` |
| `ZEAM_I_EquipmentWithNotif` | `equipment` + `maintenance_notification` |
| `ZEAM_I_EquipmentWithOrder` | `equipment` + `maintenance_order` |
| `ZEAM_I_FuncLocWithEquipment` | `equipment` + `functional_location` |
| `ZEAM_I_FuncLocWithMeasPoint` | `functional_location` + `measuring_point` |
| `ZEAM_I_FuncLocWithNotif` | `functional_location` + `maintenance_notification` |
| `ZEAM_I_FuncLocWithOrder` | `functional_location` + `maintenance_order` |
| `ZEAM_I_MaintItemWithTaskList` | `maintenance_plan` + `task_list` |
| `ZEAM_I_MaintOpWithWorkCenter` | `maintenance_order` + `work_center` |
| `ZEAM_I_MaintPlanWithOrder` | `maintenance_order` + `maintenance_plan` |
| `ZEAM_I_NotifWithOrder` | `maintenance_notification` + `maintenance_order` |
| `ZEAM_R_EquipmentReliability` | `equipment` + `rpt_reliability` |
| `ZEAM_C_DowntimeTechObjQ` | `equipment` + `functional_location` + `rpt_downtime` |
| `ZEAM_C_MaintOrderTechObjQ` | `equipment` + `functional_location` + `maintenance_order` |
| `ZEAM_R_DowntimeWithTechObj` | `equipment` + `functional_location` + `rpt_downtime` |
| `ZEAM_R_MaintOrderWithTechObj` | `equipment` + `functional_location` + `maintenance_order` |

## Building a customer package

```bash
python3 build_package.py --list
python3 build_package.py equipment                                   # equipment only, no link views
python3 build_package.py equipment functional_location \
        --prefix ZACME_ --package ZACME_EAM --with-tests             # + link views, renamed
python3 build_package.py --all --prefix /ACME/ --package /ACME/EAM   # registered namespace
python3 build_package.py --all --activation-order                    # print order only
```

The build:

1. resolves hard dependencies;
2. adds link views only when all their modules are selected;
3. fails if a shipped object references an object that is not shipped;
4. rewrites prefix and package in names, sources and file names (`/ACME/` → `#acme#`);
5. checks the 30-character limits;
6. writes `dist/<package>_<modules>.zip` with `.abapgit.xml`, `src/`,
   `BUILD_MANIFEST.json` and `ACTIVATION_ORDER.txt`.

Import the ZIP with abapGit (*New Offline* → *Import ZIP*) or push it with the ADT loop in
[`ADT_SETUP.md`](ADT_SETUP.md).

## Quality gates (run before every commit)

```bash
npm install && npm run check            # runs everything below
npx @abaplint/cli@2.120.71                 # DDLS parser + naming + ABAP rules (abaplint.json)
python3 tools/sync_xml.py                  # abapGit XML derived from sources
python3 tools/gen_docs.py                  # docs/views/*.md from the // Purpose: / // Example: headers
python3 tools/gen_checklist.py             # activation tables in ACTIVATION_CHECKLIST.md
python3 tools/gen_model_map.py             # interactive entity map docs/model_map.html
python3 tools/todo_verify_report.py        # ranked TODO-VERIFY table in BATCH_REPORT.md
python3 tools/validate_repo.py             # module rules M1-M11 (layering, DCL, docs, isolation …)
python3 -m unittest discover -s tests/build
```

abaplint parses DDLS sources, including transient analytical queries. It does **not**
parse DCLS or DDLX content, and it cannot check names against SAP's views: it has no SAP
dependency metadata. `validate_repo.py` adds structural checks for DCLS and DDLX. Element
names can only be confirmed on a real system (see `ACTIVATION_CHECKLIST.md`).

## Adding a module (next batches)

1. Write the views in `src/` following the layer pattern. Put the status comment on line 1,
   then `// Purpose:` and `// Example:` lines (the doc page is generated from them), and use a
   `TODO-VERIFY[H|M|L] <ID>: ...` marker for anything you are not sure of.
2. Add a DCL per view (or a `no_dcl_by_design` / `no_dcl_reason` entry with a reason) and,
   where a list report makes sense, a DDLX for the cube.
3. Add `modules/<name>/module.json`. Put cross-module associations into link views and
   declare them in **every** participating module's `link_views`.
4. Run the generators and quality gates (`npm run check`), then add a batch section to `BATCH_REPORT.md`.
