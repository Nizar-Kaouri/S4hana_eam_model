# Cross-Product Bridge - CDS link views between products

> **Status: draft-unverified.** 18 link objects, never activated on an SAP system.
> Tested release: none (draft, 2025 assumed).

Link views between modules of **different** products (e.g. EAM equipment ↔ FI-AA fixed asset). The bridge
has no modules of its own. Every link in [`bridges.json`](bridges.json) declares qualified
`requires_modules` (`product:module`). It ships **only through `build_bundle.py`**, and only when all those
modules (after hard dependencies) are in the selection. `build_package.py --product bridge` is refused.

| | |
|---|---|
| Product folder | `packages/bridge` |
| Object prefix | `ZBRG_` (rewritten to the bundle's target prefix) |
| ABAP package | `ZBRG_VDM` (rewritten to the bundle's target package) |
| Target release | SAP S/4HANA 2025 (on-premise / Private Cloud Edition) |

## Bridge links

| Object | Requires modules | Access control |
|---|---|---|
| `ZBRG_I_EquipmentWithAsset` | `eam:equipment`, `fi_aa:fixed_asset` | `ZBRG_I_EquipmentWithAsset` |
| `ZBRG_R_EquipmentAssetValue` | `eam:equipment`, `fi_aa:rpt_asset_balance` | `ZBRG_R_EquipmentAssetValue` |
| `ZBRG_C_EquipAssetValueQ` | `eam:equipment`, `fi_aa:rpt_asset_balance` | none (transient query, GEN-Q01) |
| `ZBRG_I_OrderCompWithProduct` | `eam:maintenance_order`, `mm:product` | `ZBRG_I_OrderCompWithProduct` |
| `ZBRG_R_OrderCompWithProduct` | `eam:maintenance_order`, `mm:product` | `ZBRG_R_OrderCompWithProduct` |
| `ZBRG_C_OrderCompProductQ` | `eam:maintenance_order`, `mm:product` | none (transient query, GEN-Q01) |
| `ZBRG_I_MaintOrderWithGoodsMvt` | `eam:maintenance_order`, `mm:goods_movement` | `ZBRG_I_MaintOrderWithGoodsMvt` |
| `ZBRG_R_MaintCostWithCostCtr` | `co:cost_center`, `eam:rpt_order_cost` | `ZBRG_R_MaintCostWithCostCtr` |
| `ZBRG_C_MaintCostCostCtrQ` | `co:cost_center`, `eam:rpt_order_cost` | none (transient query, GEN-Q01) |
| `ZBRG_I_ProdOpWithWorkCenter` | `eam:work_center`, `pp:production_order_operation` | `ZBRG_I_ProdOpWithWorkCenter` |
| `ZBRG_R_POItemWithSupplier` | `fi:supplier`, `mm:purchase_order` | `ZBRG_R_POItemWithSupplier` |
| `ZBRG_C_POItemSupplierQ` | `fi:supplier`, `mm:purchase_order` | none (transient query, GEN-Q01) |
| `ZBRG_R_RevenueWithCustomer` | `fi:customer`, `sd:billing_document` | `ZBRG_R_RevenueWithCustomer` |
| `ZBRG_C_RevenueCustomerQ` | `fi:customer`, `sd:billing_document` | none (transient query, GEN-Q01) |
| `ZBRG_R_InspLotWithProduct` | `mm:product`, `qm:inspection_lot` | `ZBRG_R_InspLotWithProduct` |
| `ZBRG_C_InspLotProductQ` | `mm:product`, `qm:inspection_lot` | none (transient query, GEN-Q01) |
| `ZBRG_R_ProdOrderWithProduct` | `mm:product`, `pp:production_order` | `ZBRG_R_ProdOrderWithProduct` |
| `ZBRG_C_ProdOrderProductQ` | `mm:product`, `pp:production_order` | none (transient query, GEN-Q01) |

Layer rules are the same as for intra-product links: `ZBRG_I_*` basic views with associations,
`ZBRG_R_*` composite cubes, and `ZBRG_C_*Q` transient analytical queries. A bridge may only reference
**module** objects of its required modules (incl. their hard dependencies), never another product's
link views (`tools/validate_bridge.py`, rule B4).

## Build

```bash
python3 build_bundle.py eam:equipment fi_aa:rpt_asset_balance --prefix ZACME_ --package ZACME_VDM
python3 build_bundle.py --product-all eam --product-all mm --prefix ZACME_ --package ZACME_VDM
python3 build_bundle.py --all --with-tests --prefix ZACME_ --package ZACME_VDM
```

The bundle rewrites **all** product prefixes to one target prefix and all packages to one target
package, checks name collisions and lengths, and writes `BUILD_MANIFEST.json` (incl.
`bridge_links_included` / `bridge_links_skipped`) and a cross-product `ACTIVATION_ORDER.txt`.

## Checks

```bash
python3 tools/check_all.py --only bridge
```

Docs per view are in `docs/views/`, the graph in `docs/model_map.html`, open items in `BATCH_REPORT.md`.
