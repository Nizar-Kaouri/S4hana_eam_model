# Project history

Everything built in this repository so far, in order, with the decisions taken along the way.

> **Status of all content: draft-unverified.** No SAP system has been available. Nothing has been activated,
> tested, extracted or loaded. Every uncertain table field, view element, annotation or rule is marked
> `TODO-VERIFY` in the sources and ranked in each product's `BATCH_REPORT.md`.

Branch: `claude/sap-eam-pm-cds-vdm-a2vxuv`

---

## 1. Goal and how it changed

| Phase | Goal | Result |
|---|---|---|
| Start | Commercial CDS view library (VDM) for SAP S/4HANA 2025 **EAM / Plant Maintenance**, sold as modular packages | `packages/eam` |
| Expansion | Same pattern for more S/4HANA areas | 8 more analytics products + cross-product bridge |
| **Pivot** | The packages are **migration models**, not reporting: moving data from an old **SAP ERP (ECC 6.0)** to **S/4HANA** | `packages/eam_mig_ecc` + `packages/eam_mig_s4` (EAM pilot) |
| Current | Sell a **template of views only**: basic → composite → consumption on ECC; the customer's own load program reads the consumption views and posts on S/4HANA | EAM migration pilot, restructured accordingly |

The analytics products stay in the repository as an optional add-on for after the migration.

---

## 2. Original rules (from the start of the project)

1. Build on SAP released `I_` views; never copy SAP source.
2. Never invent field names; anything uncertain gets `// TODO-VERIFY` and goes into `BATCH_REPORT.md`.
3. Layers: basic `ZEAM_I_*`, composite `ZEAM_R_*`, consumption `ZEAM_C_*Q`.
4. Every module is self-contained; cross-object associations only in link views that ship when all their
   modules are selected; hard dependencies declared in `module.json`.
5. Every view gets DDL, DCL, annotations (`@Analytics`, `@VDM.viewType`, `@ObjectModel`) and a doc page.
6. `module.json`: name, objects per layer, tags, hard dependencies, link views, tested release, status.
7. Never claim anything is tested or activated.

Later changes to these rules are listed in section 8.

---

## 3. Phase 1 - EAM analytics library (`packages/eam`, prefix `ZEAM_`)

Built in 5 batches on SAP released views (`I_Equipment`, `I_FunctionalLocation`, `I_MaintenanceOrder`, ...):

| Batch | Content |
|---|---|
| 1 | Equipment, functional location (+ hierarchy), first link views; repository tooling (build script, validator, TODO-VERIFY collector, docs generator) |
| 2 | Maintenance notification and maintenance order (header, operations, components) |
| 3 | Measuring point, measurement document, maintenance plan, task list |
| 4 | Reporting modules: downtime, MTBF / MTTR, order cost, backlog |
| 5 | Remaining objects, cross-module link views and link cubes |

Result: **16 modules, 86 views** (incl. 19 link views), DCLs, metadata extensions, ABAP Unit test classes,
transient analytical queries, an interactive **model map** (`docs/model_map.html`) and a published visualisation.

Tooling built in this phase (shared by all products later):

- `build_package.py` - customer build: module selection, automatic hard dependencies, link views only when all
  their modules are selected, prefix / package rewrite, length checks, activation order, abapGit ZIP.
- `tools/validate_repo.py` - module rules M1-M11 (later M12).
- `tools/sync_xml.py`, `gen_docs.py`, `gen_checklist.py`, `gen_model_map.py`, `todo_verify_report.py`.
- abaplint 2.120.71 configuration, unit tests of the build script.

---

## 4. Phase 2 - more products and a multi-product repository

- Repository reorganised into `packages/<product>`; every tool takes `--product`; `PRODUCT_CHECKLIST.md`
  lists which SAP areas qualify and their status; `tools/new_product.py` scaffolds a product.
- Products drafted (each in one pass, "refine after"):

| Product | Folder | Prefix | Size |
|---|---|---|---|
| Asset Accounting (FI-AA) | `packages/fi_aa` | `ZFAA_` | 3 modules, 14 views |
| Materials Management | `packages/mm` | `ZMMV_` | 7 modules, 24 views + 9 link objects |
| Quality Management | `packages/qm` | `ZQMV_` | 4 modules, 13 views + 2 link objects |
| Project System | `packages/ps` | `ZPSV_` | 4 modules, 13 views + 3 link objects |
| Production Planning | `packages/pp` | `ZPPV_` | 4 modules, 13 views + 1 link object |
| Controlling | `packages/co` | `ZCOV_` | 5 modules, 17 views + 5 link objects |
| Financial Accounting | `packages/fi` | `ZFIV_` | 5 modules, 13 views + 6 link objects |
| Sales and Distribution | `packages/sd` | `ZSDV_` | 4 modules, 15 views + 2 link objects |

- **Link views**: 28 intra-product link objects, then a **cross-product bridge** (`packages/bridge`, `ZBRG_`,
  18 link objects, e.g. equipment ↔ fixed asset, order component ↔ product, maintenance cost ↔ cost center).
- `build_bundle.py` - builds several products into one ZIP with one prefix / package and adds bridge links only
  when all their modules are selected; `tools/catalog.py`, `tools/validate_bridge.py` (rules B1-B7).
- Full bundle of all products: 463 objects, abaplint 0 issues.

---

## 5. Phase 3 - "Are the packages ready to sell?" (first assessment)

Answer: not yet. Gaps named: unverified content (~300 TODO-VERIFY items), no clear differentiation from SAP
standard analytics, no dashboards, abapGit-only delivery, customer prefix vs. vendor namespace, upgrades,
authorizations, buyer documentation, legal / commercial basics.

---

## 6. Phase 4 - pivot to migration (ECC → S/4HANA)

Agreed assumptions: source **ECC 6.0 on NetWeaver 7.40 SP08+** (classic CDS views), EAM first, then other areas.

### 6.1 Pilot v1 - extraction, mapping, reconciliation

- `packages/eam_mig_ecc` (`ZEMX_`, system ECC): classic CDS views reading the PM tables directly (ECC has no
  released `I_` views), scope flags instead of silent filters, extraction / delta annotations.
- 13 migration objects: work center, functional location, equipment, measuring point, measurement document,
  task list, maintenance plan, maintenance notification (open), maintenance order (open), object status,
  classification, object partner, long text index.
- One `mapping.json` per object: every element with ECC source, S/4HANA target field and rule; business key and
  numbering; scope; load order (`sequence_after`); reconciliation.
- `packages/eam_mig_s4` (`ZEMT_`, system S/4HANA): compare and count views on SAP released views.
- Tools: `tools/validate_mapping.py`, `tools/gen_mapping.py` (mapping pages, `MIGRATION_SEQUENCE.md`),
  `tools/mig_reconcile.py` (counts and record / field comparison of CSV exports), validator rule **M12**
  (classic views, SQL view names ≤ 16 characters, no DCL on ECC), SQL view name rewrite in the build,
  "one target system per bundle" rule in `build_bundle.py`.

### 6.2 SAP standard discussion

- SAP's standard load tool is the **Migration Cockpit** (direct transfer or staging tables); CDS extraction with
  ODP / delta is an **S/4HANA** standard, not an ECC one.
- SAP VDM naming: `I_` for basic **and** composite views, `C_` for consumption views (`R_` = restricted reuse).
- Decision: not every project uses the Cockpit. The package follows the pattern used in real projects:
  **3 layers of views on ECC, and the project's own load program reads the consumption views.**

### 6.3 Pilot v2 - basic → composite → consumption

- **Basic** `ZEMX_I_*`: exactly one table per view.
- **Composite** `ZEMX_I_*`: the business object (e.g. equipment = EQUI + current EQUZ segment + ILOA + work
  center + deletion flag), internal IDs → business keys, current versions, scope flags.
- **Consumption** `ZEMX_C_*Mig`: one view per migration structure, scope applied, migrated fields only; the only
  layer with extraction annotations. `ZEMX_C_*MigCount` for reconciliation.
- Naming changed to the SAP convention (`I_` / `I_` / `C_`) in both migration products; S/4HANA count views
  renamed `ZEMT_I_*Count`.
- A value / key mapping table on ECC was added at this point - **and removed again in v3**.

### 6.4 Pilot v3 - template only, values unchanged

Decision: *"The consumption just delivers the same data as in the system. We only provide the template."*
Removed the mapping table `ZEMX_MAP`, its view, all lookups, the `Legacy*` key fields and the value / key map
rules. Consumption views are plain projections with the migration scope.

### 6.5 Pilot v4 - associations instead of joins

Following SAP VDM practice:

- Basic views declare **37 associations** to other basic views and expose them.
- Composite views read related data through **path expressions**
  (`seg._MainWorkCenter.WorkCenter`, `eq._DeletionFlag.StatusCode`).
- **Inner joins** remain only where they decide which rows exist: current time segment, latest task list
  version, operation assignment ↔ operation, last reading, PM data of notifications / orders.
- Consumption views of child structures filter on their parent through an association
  (e.g. operations: `where _MaintOrder.IsClosed = ''`).
- Unit tests check: basic views read one table and never join; no left outer joins in composite views; upper
  layers read only the same or lower layers.

### 6.6 Current state of the EAM migration pilot

| | |
|---|---|
| ECC views | 100 classic CDS views: 41 basic, 21 composite, 38 consumption (25 structures + 13 count views) |
| Modules | `core` + 13 migration objects; `work_center` and `core` are added automatically as dependencies |
| Load order | 8 levels (`docs/MIGRATION_SEQUENCE.md`) |
| Documentation | one page per object in `packages/eam_mig_ecc/docs/mapping/` (fields, ECC source, S/4HANA target, scope, not delivered fields) |
| S/4HANA side | 16 compare / count views (`packages/eam_mig_s4`) + `tools/mig_reconcile.py` |
| Checks | `tools/check_all.py`: all 12 products pass; abaplint 0 issues; 36 unit tests OK |
| Open items | ECC product: 79 TODO-VERIFY items (28 high); top risk XGEN-005 (associations / path expressions on 7.40 SP08) |

---

## 7. Phase 5 - "Is the first package ready to sell?" (assuming the views work)

Answer: close, not yet. To reach version 1:

1. **Content gaps:** equipment BOM (EQST/STPO), task list components / PRTs / maintenance packages
   (PLMZ, PLFH, PLWP), notification causes / tasks / activities (QMUR, QMSM, QMMA), order settlement rules
   (COBRA/COBRB). Documented limits: work center capacities, long text content (READ_TEXT).
2. **Buyer deliverables:** field labels on every element, Excel field catalog per consumption view, installation
   guide, compatibility statement (ECC releases, databases), version number and change log.
3. **Delivery:** transport files in addition to abapGit; customer prefix (generated per customer) or a registered
   vendor namespace.
4. **Scope:** sell version 1 as the ECC views; the S/4HANA reconciliation (Python tool) later as an add-on.
5. **Business:** licence / warranty disclaimer, correct SAP trademark use, pricing, support policy.

---

## 8. Rule changes over time

| Original rule | Now |
|---|---|
| 1 - build on released `I_` views | On S/4HANA yes; on ECC the basic views read tables directly (ECC has no released views). Still no SAP source copied. |
| 3 - composite = `R_` | Migration products use the SAP convention: `I_` basic and composite, `C_` consumption (`layer_prefixes` in `library.json`). Analytics products still use `R_` (rename open). |
| 4 - associations only in link views | Migration products: associations between objects of a module and its hard dependencies (`core`, `work_center`). |
| 5 - DCL for every view | Migration views have no DCL by design: they must return every record (ECC 7.40 baseline; access via the load user's authorizations). |

---

## 9. Repository map

```
README.md, PRODUCT_CHECKLIST.md, ADT_SETUP.md, PROJECT_HISTORY.md
build_package.py            one product → abapGit ZIP (prefix / package rewrite, dependencies, link views)
build_bundle.py             several S/4HANA products → one ZIP (bridge links)
tools/                      validators (M1-M12, B1-B7, X1-X6), generators, reconcile tool, unit tests
packages/eam                EAM analytics (S/4HANA)
packages/fi_aa, mm, qm, ps, pp, co, fi, sd   analytics add-on products (S/4HANA)
packages/bridge             cross-product link views
packages/eam_mig_ecc        EAM migration template - ECC views (basic → composite → consumption)
packages/eam_mig_s4         EAM migration - S/4HANA reconciliation views
```

## 10. Commits

| Commit | Content |
|---|---|
| `1ec4a47` | Batch 1: equipment, functional location, tooling |
| `83816bf` | Batch 2: notification, order |
| `6b2ce49` | Batch 3: measuring point, measurement document, plan, task list |
| `ebf8067` | Batch 4: reporting modules |
| `867a09c` | Batch 5: remaining objects, link views |
| `a6f43d4` | Model map |
| `c236df8` | Multi-product repository, product checklist |
| `e2af068` … `ae5b655` | FI-AA, MM, QM, PS, PP, CO, FI, SD products |
| `3fb5a2a` | Checklist / README: nine products drafted |
| `e5d5a68` | Intra-product link views |
| `5c222ce` | Cross-product bridge, bundle build |
| `08c8893` | EAM migration pilot v1 |
| `f30826e` | Restructure into basic → composite → consumption |
| `fd81623` | Consumption delivers ECC data unchanged (template only) |
| `46a90b0` | Associations instead of joins |
