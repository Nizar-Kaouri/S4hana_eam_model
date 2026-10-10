# Product checklist

Which SAP S/4HANA areas can get a CDS VDM package built like the EAM package, and where each one stands.
One product = one folder under `packages/` with its own prefix, ABAP package, modules and reports.

> **No product has been activated or tested.** EAM is drafted (`draft-unverified`); all others are
> empty skeletons. SAP view names in the "candidate SAP views" column are **unverified candidates**
> from memory. Confirming them on an S/4HANA 2025 system is the first task for every product.

## How feasibility was rated

A package needs enough **released `I_` CDS views (C1)** for its area, because customer views may only
build on released views. "Strong" means broad released coverage is expected, "Good" means
coverage for the main objects, "Medium" means it has to be checked object by object first.

## Products with a folder

Recommended build order: **FI-AA → MM → QM → PS**, because those link to EAM, then PP, CO, FI, SD.

| # | Product | Folder | Prefix / package | Fit | Candidate modules | Candidate SAP views (to confirm) | Links to EAM |
|---|---|---|---|---|---|---|---|
| - | **Enterprise Asset Management** (PM) | `packages/eam` | `ZEAM_` / `ZEAM_VDM` | Strong | 16 modules, 86 views (see `packages/eam/README.md`) | confirmed list in `packages/eam/ACTIVATION_CHECKLIST.md` | - |
| 1 | **Asset Accounting** (FI-AA) | `packages/fi_aa` | `ZFAA_` / `ZFAA_VDM` | Strong | fixed asset, asset values / depreciation, asset transactions, asset reports | e.g. `I_FixedAsset`, asset valuation and Universal Journal views | equipment ↔ fixed asset |
| 2 | **Materials Management** (MM) | `packages/mm` | `ZMMV_` / `ZMMV_VDM` | Strong | material, stock, goods movements, purchase requisition, purchase order, spare-parts reports | e.g. `I_Product`, `I_MaterialStock_2`, `I_MaterialDocumentItem_2`, `I_PurchaseOrderItemAPI01` | order component ↔ material, stock, purchase order |
| 3 | **Quality Management** (QM) | `packages/qm` | `ZQMV_` / `ZQMV_VDM` | Good | inspection lot, inspection results, quality notification, defect reports | e.g. `I_InspectionLot`, quality notification views | notification / equipment ↔ quality notification |
| 4 | **Project System** (PS) | `packages/ps` | `ZPSV_` / `ZPSV_VDM` | Good | project, WBS element, project costs, project reports | e.g. `I_EnterpriseProject`, WBS element views, Universal Journal | maintenance order ↔ WBS element (shutdowns, investments) |
| 5 | **Production Planning** (PP) | `packages/pp` | `ZPPV_` / `ZPPV_VDM` | Good | production order, operation, BOM, routing, work center | e.g. `I_ManufacturingOrder`, BOM views, `I_WorkCenter` | work center (shared), equipment ↔ production line |
| 6 | **Controlling** (CO) | `packages/co` | `ZCOV_` / `ZCOV_VDM` | Strong | cost center, internal order, profit center, cost reports | e.g. `I_CostCenter`, `I_ProfitCenter`, `I_JournalEntryItem` | maintenance cost per cost center |
| 7 | **Financial Accounting** (FI) | `packages/fi` | `ZFIV_` / `ZFIV_VDM` | Strong | G/L line items, payables, receivables, supplier, customer | e.g. `I_JournalEntryItem`, `I_GLAccount`, `I_Supplier`, `I_Customer` | - (via CO / FI-AA) |
| 8 | **Sales and Distribution** (SD) | `packages/sd` | `ZSDV_` / `ZSDV_VDM` | Strong | sales order, delivery, billing, customer, sales reports | e.g. `I_SalesDocument`, `I_DeliveryDocument`, `I_BillingDocument` | - (service / equipment sales later) |

Commercial note: SAP ships a lot of standard analytics for FI, CO, SD and MM. Packages there must
target gaps (cross-area views, ready-made KPIs) to be worth buying. FI-AA, QM, PS and the links to EAM
are better niches.

### Status per product

Tick a box only when it is really done; "activated" and "tested" need a real SAP system.

| Step | EAM | FI-AA | MM | QM | PS | PP | CO | FI | SD |
|---|---|---|---|---|---|---|---|---|---|
| Product folder created | [x] | [x] | [x] | [x] | [x] | [x] | [x] | [x] | [x] |
| Module scope agreed | [x] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] |
| Released SAP views confirmed on a system | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] |
| Batch 1 drafted | [x] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] |
| All batches drafted | [x] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] |
| Offline checks clean (`tools/check_all.py`) | [x] | [x] | [x] | [x] | [x] | [x] | [x] | [x] | [x] |
| Activated on S/4HANA 2025 | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] |
| ABAP Unit + smoke checks passed | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] |
| Customer build tested (prefix rewrite, abapGit import) | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] |
| Ready to sell | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] |

For the skeletons, "offline checks clean" only means the empty folder passes the tools.

## Candidates that need a feasibility check first (no folder yet)

| Area | Fit | What to check |
|---|---|---|
| **EWM** Extended Warehouse Management | Medium | Embedded EWM has fewer released views; check warehouse task / stock views object by object |
| **TM** Transportation Management | Medium | Released coverage for freight orders / units |
| **FSCM** Credit, Collections, Dispute | Medium | Released views per component |
| **EHS** Environment, Health and Safety | Medium | Incident and risk views; strong link to EAM (safety measures on equipment) |
| **Industry solutions** (IS-U and others) | Weak / varies | Often older data models with few released views; case by case |

Create a folder only after the check: `python3 tools/new_product.py <name> --prefix Z..._ --package Z..._VDM --title "..." --area ...`.

## Not possible with this approach

| Area | Why |
|---|---|
| **HCM** Human Capital Management | In S/4 mostly a compatibility pack with hardly any released VDM views |
| **Ariba, SuccessFactors, Concur, Fieldglass** | Separate cloud products, not ABAP CDS in S/4; they would need API-based integration instead |
| **SAP Analytics Cloud** | A front end, not a data model; it can *consume* these packages' queries |

## Open design item: links across products

Link views between products (e.g. EAM equipment ↔ FI-AA fixed asset) need modules from two
products at once. Today `build_package.py` builds one product at a time, so cross-product links are
**not supported yet**. Planned approach: a bridge product (e.g. `packages/bridge_eam_fi_aa`) whose
link views declare `requires_modules` as `eam:equipment` + `fi_aa:fixed_asset`, plus a build option that
takes several products in one ZIP. This is to be designed before the first cross-product link is written.
