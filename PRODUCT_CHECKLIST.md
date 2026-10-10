# Product checklist

Which SAP S/4HANA areas can get a CDS VDM package built like the EAM package, and where each one stands.
One product = one folder under `packages/` with its own prefix, ABAP package, modules and reports.

> **No product has been activated or tested.** All nine products are drafted (`draft-unverified`).
> Link views inside the new products and across products are not built yet (planned for the end). SAP view names in the "candidate SAP views" column are **unverified candidates**
> from memory. Confirming them on an S/4HANA 2025 system is the first task for every product.

## How feasibility was rated

A package needs enough **released `I_` CDS views (C1)** for its area, because customer views may only
build on released views. "Strong" means broad released coverage is expected, "Good" means
coverage for the main objects, "Medium" means it has to be checked object by object first.

## Products with a folder

Recommended build order: **FI-AA → MM → QM → PS**, because those link to EAM, then PP, CO, FI, SD.

| # | Product | Folder | Prefix / package | Fit | Modules | SAP released views used (unverified) | Links to EAM |
|---|---|---|---|---|---|---|---|
| - | **Enterprise Asset Management** (PM) | `packages/eam` | `ZEAM_` / `ZEAM_VDM` | Strong | 16 modules, 86 views (see `packages/eam/README.md`) | confirmed list in `packages/eam/ACTIVATION_CHECKLIST.md` | - |
| 1 | **Asset Accounting** (FI-AA) | `packages/fi_aa` | `ZFAA_` / `ZFAA_VDM` | Strong | **drafted:** fixed_asset, asset_transaction, rpt_asset_balance (14 views) | `I_JournalEntryItem`, `I_GLAccountInChartOfAccounts`, `I_FixedAsset`, `I_CompanyCode`, `I_AssetClass`, `I_Plant` (all to confirm) | equipment ↔ fixed asset (bridge: `ZBRG_I_EquipmentWithAsset`, `ZBRG_R_EquipmentAssetValue`) |
| 2 | **Materials Management** (MM) | `packages/mm` | `ZMMV_` / `ZMMV_VDM` | Strong | **drafted:** product, material_stock, goods_movement, purchase_requisition, purchase_order, rpt_open_purchase_order, rpt_material_consumption (24 views) | `I_MaterialDocumentItem_2`, `I_Plant`, `I_MaterialStock_2`, `I_Product`, `I_ProductDescription`, `I_ProductPlantBasic`, `I_PurchaseOrderAPI01`, `I_PurchaseOrderItemAPI01`, `I_Supplier`, `I_CompanyCode`, `I_PurchaseRequisitionItemAPI01` (all to confirm) | order component ↔ material, stock, purchase order |
| 3 | **Quality Management** (QM) | `packages/qm` | `ZQMV_` / `ZQMV_VDM` | Good | **drafted:** inspection_lot, inspection_result, quality_notification, rpt_supplier_quality (13 views) | `I_InspectionLot`, `I_Plant`, `I_InspectionCharacteristic`, `I_QualityNotification` (all to confirm) | notification / equipment ↔ quality notification |
| 4 | **Project System** (PS) | `packages/ps` | `ZPSV_` / `ZPSV_VDM` | Good | **drafted:** project, wbs_element, project_cost, rpt_project_cost_to_date (13 views) | `I_EnterpriseProject`, `I_CompanyCode`, `I_JournalEntryItem`, `I_WBSElement` (all to confirm) | maintenance order ↔ WBS element (shutdowns, investments) |
| 5 | **Production Planning** (PP) | `packages/pp` | `ZPPV_` / `ZPPV_VDM` | Good | **drafted:** production_order, production_order_operation, bill_of_material, rpt_order_schedule (13 views) | `I_MaterialBOMLink`, `I_BillOfMaterialItemBasic`, `I_ManufacturingOrder`, `I_Plant`, `I_ManufacturingOrderOperation` (all to confirm) | work center (shared), equipment ↔ production line |
| 6 | **Controlling** (CO) | `packages/co` | `ZCOV_` / `ZCOV_VDM` | Strong | **drafted:** cost_center, internal_order, profit_center, cost_actuals, rpt_cost_center_ytd (17 views) | `I_JournalEntryItem`, `I_GLAccountInChartOfAccounts`, `I_CostCenter`, `I_CostCenterText`, `I_CompanyCode`, `I_InternalOrder`, `I_ProfitCenter`, `I_ProfitCenterText` (all to confirm) | maintenance cost per cost center |
| 7 | **Financial Accounting** (FI) | `packages/fi` | `ZFIV_` / `ZFIV_VDM` | Strong | **drafted:** gl_account, supplier, customer, gl_line_item, open_items (13 views) | `I_Customer`, `I_GLAccountInChartOfAccounts`, `I_GLAccountText`, `I_JournalEntryItem`, `I_OperationalAcctgDocItem`, `I_Supplier` (all to confirm) | - (via CO / FI-AA) |
| 8 | **Sales and Distribution** (SD) | `packages/sd` | `ZSDV_` / `ZSDV_VDM` | Strong | **drafted:** sales_order, outbound_delivery, billing_document, rpt_open_sales_orders (15 views) | `I_BillingDocument`, `I_BillingDocumentItem`, `I_CompanyCode`, `I_DeliveryDocument`, `I_DeliveryDocumentItem`, `I_Plant`, `I_SalesDocument`, `I_SalesDocumentItem`, `I_Customer` (all to confirm) | - (service / equipment sales later) |

Commercial note: SAP ships a lot of standard analytics for FI, CO, SD and MM. Packages there must
target gaps (cross-area views, ready-made KPIs) to be worth buying. FI-AA, QM, PS and the links to EAM
are better niches.

### Status per product

Tick a box only when it is really done; "activated" and "tested" need a real SAP system.

| Step | EAM | FI-AA | MM | QM | PS | PP | CO | FI | SD |
|---|---|---|---|---|---|---|---|---|---|
| Product folder created | [x] | [x] | [x] | [x] | [x] | [x] | [x] | [x] | [x] |
| Module scope agreed (first draft, open for refinement) | [x] | [x] | [x] | [x] | [x] | [x] | [x] | [x] | [x] |
| Released SAP views confirmed on a system | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] |
| Batch 1 drafted | [x] | [x] | [x] | [x] | [x] | [x] | [x] | [x] | [x] |
| All batches drafted (without link views) | [x] | [x] | [x] | [x] | [x] | [x] | [x] | [x] | [x] |
| Link views drafted (intra-product + bridge) | [x] | [x] | [x] | [x] | [x] | [x] | [x] | [x] | [x] |
| Offline checks clean (`tools/check_all.py`) | [x] | [x] | [x] | [x] | [x] | [x] | [x] | [x] | [x] |
| Activated on S/4HANA 2025 | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] |
| ABAP Unit + smoke checks passed | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] |
| Customer build tested (prefix rewrite, abapGit import) | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] |
| Ready to sell | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] |

Module scopes of all products except EAM were set in the first drafts and are open for refinement.
EAM is the only product with link views so far.

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

## Links across products (implemented, draft)

Cross-product link views live in the bridge product `packages/bridge` (prefix `ZBRG_`). Each entry in
`packages/bridge/bridges.json` declares qualified `requires_modules` (e.g. `eam:equipment` + `fi_aa:fixed_asset`).
`build_bundle.py` builds several products into ONE ZIP with one target prefix and package and adds a bridge
link only when all its modules (after hard dependencies) are selected. `build_package.py` refuses the bridge.
`tools/validate_bridge.py` (B1-B7) checks that a bridge only references module objects of its required modules.

| Link status | EAM | FI-AA | MM | QM | PS | PP | CO | FI | SD |
|---|---|---|---|---|---|---|---|---|---|
| Intra-product link objects | 19 | 5 | 9 | 2 | 3 | 1 | 5 | 6 | 2 |
| Used by bridge links | [x] | [x] | [x] | [x] | [ ] | [x] | [x] | [x] | [x] |

Bridge links (18 objects): equipment ↔ fixed asset (+ asset value cube/query), maintenance order component ↔
product (I/R/Q), maintenance order ↔ goods movements, maintenance cost ↔ cost center (R/Q), production
operation ↔ work center, PO item ↔ supplier (R/Q), revenue ↔ customer (R/Q), inspection lot ↔ product (R/Q),
production order ↔ product (R/Q). Not yet bridged: PS (maintenance order ↔ WBS element), QM ↔ EAM notifications.
