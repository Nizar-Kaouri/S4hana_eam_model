# Production Planning (PP) - CDS virtual data model

Naming: **B_ = Basic, I_ = Interface (Composite), C_ = Consumption**. See [naming guidance](../../docs/NAMING.md).

> **Status: draft-unverified.** Written without an SAP system; nothing has been activated or tested.
> Every uncertain element carries a `TODO-VERIFY` marker, ranked in [`BATCH_REPORT.md`](BATCH_REPORT.md).

| | |
|---|---|
| Product folder | `packages/pp` |
| Object prefix | `ZPPV_` (replaced per customer by the build) |
| ABAP package | `ZPPV_VDM` |
| Target release | SAP S/4HANA 2025 (on-premise / Private Cloud Edition) |
| Entity map | [`docs/model_map.html`](docs/model_map.html) |

Same architecture and rules as the EAM product (see `packages/eam/README.md`): basic `ZPPV_B_*`,
composite `ZPPV_I_*` (cubes), consumption `ZPPV_C_*Q` (analytical queries); one self-contained module
per business object; hard dependencies added by the build. **1 intra-product link object(s)** ship
only when all their modules are selected; links to other products live in `packages/bridge`.

## Link views (ship only when all listed modules are selected)

| Link object | Requires modules |
|---|---|
| `ZPPV_B_ProdOrderWithBOM` | bill_of_material, production_order |

## Data model in one paragraph

Production orders come from `I_ManufacturingOrder` (header with quantities and dates), their operations from `I_ManufacturingOrderOperation` (hard dependency on the order module). Bills of material are covered by the material-BOM assignment and the BOM items. The schedule adherence report lists open orders that are past their planned end date. Work centers are a plain field here; the work center module of the EAM product can be linked later.

## Modules (4 modules, 13 views)

| Module | Batch | Hard dependencies | Views |
|---|---|---|---|
| `production_order` | 1 | - | `ZPPV_B_ProductionOrder`, `ZPPV_B_ProductionOrderVH`, `ZPPV_I_ProductionOrder`, `ZPPV_C_ProductionOrderQ` |
| `production_order_operation` | 2 | `production_order` | `ZPPV_B_ProductionOrderOp`, `ZPPV_I_ProductionOrderOp`, `ZPPV_C_ProductionOrderOpQ` |
| `bill_of_material` | 2 | - | `ZPPV_B_MaterialBOMLink`, `ZPPV_B_BOMItem`, `ZPPV_I_BOMItem`, `ZPPV_C_BOMItemQ` |
| `rpt_order_schedule` | 3 | `production_order` | `ZPPV_I_OrderSchedule`, `ZPPV_C_OrderScheduleQ` |

## Commands

```bash
python3 tools/check_all.py --only pp
python3 build_package.py --product pp --list
python3 build_package.py --product pp --all --prefix ZACME_ --package ZACME_PP
```
