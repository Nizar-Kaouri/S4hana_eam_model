# SAP ERP â†’ S/4HANA migration models (CDS)

Packages that help move data from an old SAP ERP (ECC 6.0) system to SAP S/4HANA (new implementation or
selective data transition). Per business area there is:

- a **source** product that runs on ECC: classic CDS views in three layers - basic (one table each) â†’ composite
  (business object) â†’ consumption (`C_*Mig`: migration template, scope applied, values exactly as in ECC).
  The customer's load program reads the consumption views with any technology and adapts the values,
- a **mapping model** (every source element â†’ S/4HANA target field with a rule, business keys and numbering,
  scope filters, load order),
- a **reconciliation** product on S/4HANA plus `tools/mig_reconcile.py` (counts and record-by-record field
  comparison after the load).

The buyer picks the migration objects and gets only those, plus what they depend on, under their own prefix
and ABAP package. **EAM / Plant Maintenance is the pilot** (`packages/eam_mig_ecc` + `packages/eam_mig_s4`).

English and German EAM customer manuals and the complete VDM object map are in
[`docs/customer/eam`](docs/customer/eam/README.md).

The S/4HANA analytics packages built first (`eam`, `fi_aa`, `mm`, ...; analytical cubes and queries on SAP
released `I_` views) stay in the repository as an optional **analytics add-on** for after the migration.

> **Status: draft-unverified.** No SAP system has been available. Nothing has been activated or tested.
> Every uncertain element is marked `TODO-VERIFY` and ranked in the product's `BATCH_REPORT.md`.

## Products

Each product is a self-contained folder under `packages/`. Which areas qualify and where each one
stands is tracked in **[`PRODUCT_CHECKLIST.md`](PRODUCT_CHECKLIST.md)**. The first two rows are the
migration pilot; all other rows are the S/4HANA analytics add-on.

| Product | Folder | Prefix | State |
|---|---|---|---|
| **EAM migration - ECC source views + mapping (pilot)** | [`packages/eam_mig_ecc`](packages/eam_mig_ecc/README.md) | `ZEMX_` | release candidate 1.0.0-rc.1: 14 migration modules plus core, 158 classic views, 41 extraction structures |
| **EAM migration - S/4HANA reconciliation (pilot)** | [`packages/eam_mig_s4`](packages/eam_mig_s4/README.md) | `ZEMT_` | drafted: 8 objects, 16 views |
| Analytics add-on: Enterprise Asset Management (PM) | [`packages/eam`](packages/eam/README.md) | `ZEAM_` | drafted: 16 modules, 86 views, 5 batches |
| Asset Accounting (FI-AA) | [`packages/fi_aa`](packages/fi_aa/README.md) | `ZFAA_` | drafted: 3 modules, 14 views |
| Materials Management (MM) | [`packages/mm`](packages/mm/README.md) | `ZMMV_` | drafted: 7 modules, 24 views + 9 link objects |
| Quality Management (QM) | [`packages/qm`](packages/qm/README.md) | `ZQMV_` | drafted: 4 modules, 13 views + 2 link objects |
| Project System (PS) | [`packages/ps`](packages/ps/README.md) | `ZPSV_` | drafted: 4 modules, 13 views + 3 link objects |
| Production Planning (PP) | [`packages/pp`](packages/pp/README.md) | `ZPPV_` | drafted: 4 modules, 13 views + 1 link object |
| Controlling (CO) | [`packages/co`](packages/co/README.md) | `ZCOV_` | drafted: 5 modules, 17 views + 5 link objects |
| Financial Accounting (FI) | [`packages/fi`](packages/fi/README.md) | `ZFIV_` | drafted: 5 modules, 13 views + 6 link objects |
| Sales and Distribution (SD) | [`packages/sd`](packages/sd/README.md) | `ZSDV_` | drafted: 4 modules, 15 views + 2 link objects |
| Cross-product bridge links | [`packages/bridge`](packages/bridge/README.md) | `ZBRG_` | drafted: 18 link objects across 7 products (bundle build only) |

## Repository layout

```
PRODUCT_CHECKLIST.md         which areas get a package, fit, status per product
ADT_SETUP.md                 push / activate / fix loop against a real system (abap-adt-api)
build_package.py             customer build: --product <name> <modules> â†’ abapGit ZIP in dist/<product>/
                             (migration-source products also ship mapping/ with mapping files and docs)
build_bundle.py              multi-product build: product:module ... â†’ ONE prefix/package ZIP incl. bridge links
tools/                       shared tooling (every tool takes --product <name>)
  check_all.py               all quality gates for all products (or --only <name>; --fix regenerates)
  new_product.py             scaffold a new product folder
  sync_xml.py, gen_docs.py, gen_checklist.py, gen_model_map.py, todo_verify_report.py, validate_repo.py
  catalog.py, validate_bridge.py   cross-product name index and bridge rules (B1-B7)
  validate_mapping.py, gen_mapping.py   migration mapping rules (X1-X6) and mapping docs / map templates
  mig_reconcile.py           reconcile ECC and S/4HANA exports (counts, records, fields)
  tests/                     unit tests of the builds and the reconcile tool
packages/<product>/          one product
  src/                       abapGit objects (DDLS, DCLS, DDLX + XML), flat, one ABAP package
  modules/<module>/module.json
  docs/views/, docs/model_map.html
  tests/abap/                ABAP Unit test classes
  library.json               prefix, ABAP package, phase
  .abapgit.xml, abaplint.json
  README.md, BATCH_REPORT.md, ACTIVATION_CHECKLIST.md
```

**Migration products** (`kind` `migration-source` / `migration-target` in `library.json`) follow the SAP VDM
naming: `I_` basic and composite, `C_` consumption (`layer_prefixes` in `library.json`). On ECC (`system: ecc`) the views are
classic CDS views on tables without DCL (validator rule M12); hard rule 1 reads *released `I_` views on
S/4HANA, direct table reads on the ECC side*. Details: [`packages/eam_mig_ecc/README.md`](packages/eam_mig_ecc/README.md).

Inside an analytics product, the architecture is the same everywhere (see `packages/eam/README.md`): basic
`<P>I_*`, composite `<P>R_*` (cubes) and consumption `<P>C_*Q` (analytical queries). Every business
object is a self-contained module. Cross-object associations live in link views that ship only when
all their modules are selected. Hard dependencies are added automatically by the build.

Links between products (e.g. EAM equipment â†” FI-AA fixed asset) live in `packages/bridge`. Each bridge
link declares qualified modules (`eam:equipment` + `fi_aa:fixed_asset`) and ships only through
`build_bundle.py`, only when all of them are selected. A bundle rewrites every product prefix and package
to one target prefix and one target package.

## Commands

```bash
npm install                                         # once: installs abaplint 2.120.71
python3 tools/check_all.py                          # all gates, all products
python3 tools/check_all.py --only eam --fix         # regenerate generated files of one product
python3 build_package.py --product eam --list
python3 build_package.py --product eam equipment maintenance_order --prefix ZACME_ --package ZACME_EAM
python3 build_bundle.py eam:equipment fi_aa:rpt_asset_balance --prefix ZACME_ --package ZACME_VDM
python3 build_bundle.py --all --with-tests --prefix ZACME_ --package ZACME_VDM   # all S/4HANA products
python3 build_package.py --product eam_mig_ecc equipment --prefix ZACME_ --package ZACME_MIG   # ECC extraction
python3 build_package.py --product eam_mig_s4  equipment --prefix ZACME_ --package ZACME_MIG   # S/4 reconciliation
python3 tools/mig_reconcile.py counts --module equipment --source ecc.csv --target s4.csv --maps maps/
python3 tools/new_product.py ehs --prefix ZEHS_ --package ZEHS_VDM --title "Environment, Health and Safety" --area EHS
```

## abapGit note

Every product has its own `.abapgit.xml` (starting folder `/src/` *inside the product*). Products are
delivered as ZIPs from `build_package.py` (abapGit *offline* import), which puts that `.abapgit.xml` at
the ZIP root. Linking this repository directly as an abapGit *online* repo is not supported, because
abapGit expects one `.abapgit.xml` at the repository root.

## Additional domain migration drafts

FI-AA, MM, QM, PS, PP, CO, FI and SD now have separate `<domain>_mig_ecc` and `<domain>_mig_s4` packages. They contain 32 business modules, 98 source structures, 326 source views and 36 target comparison/count candidates. Existing analytics remain separate. Every source structure has a mapping and an explicit target CSV adapter contract. Histories and balances are not assumed to be directly postable.

See [customer guides and all-object VDM map](docs/customer/domains/README.md) and [cross-domain prerequisites](docs/customer/domains/CROSS_DOMAIN_PREREQUISITES.md). All drafts require actual SAP DDIC, activation and business acceptance tests.
