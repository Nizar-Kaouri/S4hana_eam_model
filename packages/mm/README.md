# Materials Management (MM) - CDS virtual data model

Naming: **B_ = Basic, I_ = Interface (Composite), C_ = Consumption**. See [naming guidance](../../docs/NAMING.md).

> **Status: draft-unverified.** Written without an SAP system; nothing has been activated or tested.
> Every uncertain element carries a `TODO-VERIFY` marker, ranked in [`BATCH_REPORT.md`](BATCH_REPORT.md).

| | |
|---|---|
| Product folder | `packages/mm` |
| Object prefix | `ZMMV_` (replaced per customer by the build) |
| ABAP package | `ZMMV_VDM` |
| Target release | SAP S/4HANA 2025 (on-premise / Private Cloud Edition) |
| Entity map | [`docs/model_map.html`](docs/model_map.html) |

Same architecture and rules as the EAM product (see `packages/eam/README.md`): basic `ZMMV_B_*`,
composite `ZMMV_I_*` (cubes), consumption `ZMMV_C_*Q` (analytical queries); one self-contained module
per business object; hard dependencies added by the build. **9 intra-product link object(s)** ship
only when all their modules are selected; links to other products live in `packages/bridge`.

## Link views (ship only when all listed modules are selected)

| Link object | Requires modules |
|---|---|
| `ZMMV_C_ConsumptionProductQ` | product, rpt_material_consumption |
| `ZMMV_C_GoodsMvtProductQ` | goods_movement, product |
| `ZMMV_C_POItemProductQ` | product, purchase_order |
| `ZMMV_C_StockProductQ` | material_stock, product |
| `ZMMV_B_ProductWithStock` | material_stock, product |
| `ZMMV_I_ConsumptionWithProduct` | product, rpt_material_consumption |
| `ZMMV_I_GoodsMvtWithProduct` | goods_movement, product |
| `ZMMV_I_POItemWithProduct` | product, purchase_order |
| `ZMMV_I_StockWithProduct` | material_stock, product |

## Data model in one paragraph

Material master data comes from `I_Product` (with descriptions and plant data). Stock comes from `I_MaterialStock_2`, goods movements from the material document items `I_MaterialDocumentItem_2`, purchasing from the requisition and purchase order API views. Two reports are built on top: open purchase orders with age buckets, and material consumption (spare parts) by order and cost center. Stock valuation and goods-receipt-based open quantities are not modeled yet.

## Modules (7 modules, 24 views)

| Module | Batch | Hard dependencies | Views |
|---|---|---|---|
| `product` | 1 | - | `ZMMV_B_ProductText`, `ZMMV_B_Product`, `ZMMV_B_ProductPlant`, `ZMMV_B_ProductVH`, `ZMMV_I_Product`, `ZMMV_C_ProductQ` |
| `material_stock` | 2 | - | `ZMMV_B_MaterialStock`, `ZMMV_I_MaterialStock`, `ZMMV_C_MaterialStockQ` |
| `goods_movement` | 2 | - | `ZMMV_B_GoodsMovement`, `ZMMV_I_GoodsMovement`, `ZMMV_C_GoodsMovementQ` |
| `purchase_requisition` | 3 | - | `ZMMV_B_PurchaseReqnItem`, `ZMMV_I_PurchaseReqnItem`, `ZMMV_C_PurchaseReqnQ` |
| `purchase_order` | 3 | - | `ZMMV_B_PurchaseOrder`, `ZMMV_B_PurchaseOrderItem`, `ZMMV_B_PurchaseOrderVH`, `ZMMV_I_PurchaseOrderItem`, `ZMMV_C_PurchaseOrderQ` |
| `rpt_open_purchase_order` | 4 | `purchase_order` | `ZMMV_I_OpenPurchaseOrder`, `ZMMV_C_OpenPurchaseOrderQ` |
| `rpt_material_consumption` | 4 | `goods_movement` | `ZMMV_I_MaterialConsumption`, `ZMMV_C_MaterialConsumptionQ` |

## Commands

```bash
python3 tools/check_all.py --only mm
python3 build_package.py --product mm --list
python3 build_package.py --product mm --all --prefix ZACME_ --package ZACME_MM
```
