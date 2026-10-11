# ModuPorter SAP migration templates

Naming: **B_ = Basic, I_ = Interface (Composite), C_ = Consumption**. See [naming guidance](docs/NAMING.md).

Commercial migration templates for EAM/PM, FI-AA, MM, QM, PS, PP, CO, FI and SD. **Release 1.0.0** contains 170 source extraction structures and 644 source/target CDS objects.

Each domain has `<domain>_mig_ecc` for SAP ECC extraction and mappings, and `<domain>_mig_s4` for S/4HANA comparison. Source architecture: SAP table → B_ Basic → I_ Interface (Composite) → C_ Consumption. Posting uses the customer-selected SAP interface.

See [customer downloads and bilingual manuals](docs/customer/commercial/README.md) and [product scope](PRODUCT_CHECKLIST.md). Individual module selection automatically includes required dependencies. Functional SAP annotations remain part of the templates.

## Commercial packs

| Pack | Source structures | Source CDS | Target CDS | Download |
|---|---:|---:|---:|---|
| EAM | 41 | 158 | 16 | [ModuPorter-EAM-Customer-Pack-1.0.0.zip](docs/customer/commercial/ModuPorter-EAM-Customer-Pack-1.0.0.zip) |
| FI-AA | 5 | 18 | 2 | [ModuPorter-FI-AA-Customer-Pack-1.0.0.zip](docs/customer/commercial/ModuPorter-FI-AA-Customer-Pack-1.0.0.zip) |
| MM | 26 | 85 | 6 | [ModuPorter-MM-Customer-Pack-1.0.0.zip](docs/customer/commercial/ModuPorter-MM-Customer-Pack-1.0.0.zip) |
| QM | 18 | 60 | 4 | [ModuPorter-QM-Customer-Pack-1.0.0.zip](docs/customer/commercial/ModuPorter-QM-Customer-Pack-1.0.0.zip) |
| PS | 14 | 49 | 4 | [ModuPorter-PS-Customer-Pack-1.0.0.zip](docs/customer/commercial/ModuPorter-PS-Customer-Pack-1.0.0.zip) |
| PP | 17 | 57 | 2 | [ModuPorter-PP-Customer-Pack-1.0.0.zip](docs/customer/commercial/ModuPorter-PP-Customer-Pack-1.0.0.zip) |
| CO | 13 | 46 | 6 | [ModuPorter-CO-Customer-Pack-1.0.0.zip](docs/customer/commercial/ModuPorter-CO-Customer-Pack-1.0.0.zip) |
| FI | 20 | 67 | 6 | [ModuPorter-FI-Customer-Pack-1.0.0.zip](docs/customer/commercial/ModuPorter-FI-Customer-Pack-1.0.0.zip) |
| SD | 16 | 52 | 6 | [ModuPorter-SD-Customer-Pack-1.0.0.zip](docs/customer/commercial/ModuPorter-SD-Customer-Pack-1.0.0.zip) |


## Separate analytics add-ons

The analytics products remain separately tracked drafts.

| Product | Folder | Prefix | State |
|---|---|---|---|
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
naming: `B_` Basic and `I_` Interface (Composite), `C_` consumption (`layer_prefixes` in `library.json`). On ECC (`system: ecc`) the views are
classic CDS views on tables without DCL (validator rule M12); hard rule 1 reads *released `I_` views on
S/4HANA, direct table reads on the ECC side*. Details: [`packages/eam_mig_ecc/README.md`](packages/eam_mig_ecc/README.md).

Inside an analytics product, the architecture is the same everywhere (see `packages/eam/README.md`): basic
`<P>B_*`, Interface (Composite) `<P>I_*` (cubes) and consumption `<P>C_*Q` (analytical queries). Every business
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


## EWM TM FSCM EHS native drafts

Version 0.3.0 extends the native drafts and replaces the staging drafts. EWM, TM, FSCM and EHS use native SAP table → B_ Basic → I_ Interface (Composite) → C_ Consumption for 27 documented structure drafts, with native target comparison views. The 32-module coverage plan contains 72 structures: 45 unresolved structures are explicitly pending and have no executable fallback. Native drafts also list incomplete payload separately. No custom staging tables or staging write loaders remain in these eight products. Exact native DDIC keys, application releases, SAP activation and business acceptance remain unverified. No business posting adapter is supplied.

See [bilingual customer guides and VDM maps](docs/customer/new-domains/README.md). Industry solutions remain out of scope.
