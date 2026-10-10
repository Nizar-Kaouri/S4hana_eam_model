# S/4HANA CDS VDM packages

Modular CDS virtual data models for SAP S/4HANA 2025 (on-premise / Private Cloud Edition), built only on
SAP **released `I_` views** and sold as configurable packages: the buyer picks business objects and gets
only those, plus what they depend on, under their own prefix and ABAP package.

> **Status: draft-unverified.** No SAP system has been available. Nothing has been activated or tested.
> Every uncertain element is marked `TODO-VERIFY` and ranked in the product's `BATCH_REPORT.md`.

## Products

Each product is a self-contained folder under `packages/`. Which areas qualify and where each one
stands is tracked in **[`PRODUCT_CHECKLIST.md`](PRODUCT_CHECKLIST.md)**.

| Product | Folder | Prefix | State |
|---|---|---|---|
| Enterprise Asset Management (PM) | [`packages/eam`](packages/eam/README.md) | `ZEAM_` | drafted: 16 modules, 86 views, 5 batches |
| Asset Accounting (FI-AA) | [`packages/fi_aa`](packages/fi_aa/README.md) | `ZFAA_` | skeleton |
| Materials Management (MM) | [`packages/mm`](packages/mm/README.md) | `ZMMV_` | skeleton |
| Quality Management (QM) | [`packages/qm`](packages/qm/README.md) | `ZQMV_` | skeleton |
| Project System (PS) | [`packages/ps`](packages/ps/README.md) | `ZPSV_` | skeleton |
| Production Planning (PP) | [`packages/pp`](packages/pp/README.md) | `ZPPV_` | skeleton |
| Controlling (CO) | [`packages/co`](packages/co/README.md) | `ZCOV_` | skeleton |
| Financial Accounting (FI) | [`packages/fi`](packages/fi/README.md) | `ZFIV_` | skeleton |
| Sales and Distribution (SD) | [`packages/sd`](packages/sd/README.md) | `ZSDV_` | skeleton |

## Repository layout

```
PRODUCT_CHECKLIST.md         which areas get a package, fit, status per product
ADT_SETUP.md                 push / activate / fix loop against a real system (abap-adt-api)
build_package.py             customer build: --product <name> <modules> → abapGit ZIP in dist/<product>/
tools/                       shared tooling (every tool takes --product <name>)
  check_all.py               all quality gates for all products (or --only <name>; --fix regenerates)
  new_product.py             scaffold a new product folder
  sync_xml.py, gen_docs.py, gen_checklist.py, gen_model_map.py, todo_verify_report.py, validate_repo.py
  tests/                     unit tests of the build script
packages/<product>/          one product
  src/                       abapGit objects (DDLS, DCLS, DDLX + XML), flat, one ABAP package
  modules/<module>/module.json
  docs/views/, docs/model_map.html
  tests/abap/                ABAP Unit test classes
  library.json               prefix, ABAP package, phase
  .abapgit.xml, abaplint.json
  README.md, BATCH_REPORT.md, ACTIVATION_CHECKLIST.md
```

Inside a product, the architecture is the same everywhere (see `packages/eam/README.md`): basic
`<P>I_*`, composite `<P>R_*` (cubes) and consumption `<P>C_*Q` (analytical queries). Every business
object is a self-contained module. Cross-object associations live in link views that ship only when
all their modules are selected. Hard dependencies are added automatically by the build.

## Commands

```bash
npm install                                         # once: installs abaplint 2.120.71
python3 tools/check_all.py                          # all gates, all products
python3 tools/check_all.py --only eam --fix         # regenerate generated files of one product
python3 build_package.py --product eam --list
python3 build_package.py --product eam equipment maintenance_order --prefix ZACME_ --package ZACME_EAM
python3 tools/new_product.py ehs --prefix ZEHS_ --package ZEHS_VDM --title "Environment, Health and Safety" --area EHS
```

## abapGit note

Every product has its own `.abapgit.xml` (starting folder `/src/` *inside the product*). Products are
delivered as ZIPs from `build_package.py` (abapGit *offline* import), which puts that `.abapgit.xml` at
the ZIP root. Linking this repository directly as an abapGit *online* repo is not supported, because
abapGit expects one `.abapgit.xml` at the repository root.
