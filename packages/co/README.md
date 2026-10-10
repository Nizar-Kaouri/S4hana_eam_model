# Controlling (CO) - CDS virtual data model

> **Status: draft-unverified.** Written without an SAP system; nothing has been activated or tested.
> Every uncertain element carries a `TODO-VERIFY` marker, ranked in [`BATCH_REPORT.md`](BATCH_REPORT.md).

| | |
|---|---|
| Product folder | `packages/co` |
| Object prefix | `ZCOV_` (replaced per customer by the build) |
| ABAP package | `ZCOV_VDM` |
| Target release | SAP S/4HANA 2025 (on-premise / Private Cloud Edition) |
| Entity map | [`docs/model_map.html`](docs/model_map.html) |

Same architecture and rules as the EAM product (see `packages/eam/README.md`): basic `ZCOV_I_*`,
composite `ZCOV_R_*` (cubes), consumption `ZCOV_C_*Q` (analytical queries); one self-contained module
per business object; hard dependencies added by the build. **5 intra-product link object(s)** ship
only when all their modules are selected; links to other products live in `packages/bridge`.

## Link views (ship only when all listed modules are selected)

| Link object | Requires modules |
|---|---|
| `ZCOV_C_COCostCostCenterQ` | cost_actuals, cost_center |
| `ZCOV_C_COCostProfitCtrQ` | cost_actuals, profit_center |
| `ZCOV_I_CostCenterWithOrders` | cost_center, internal_order |
| `ZCOV_R_COCostWithCostCenter` | cost_actuals, cost_center |
| `ZCOV_R_COCostWithProfitCtr` | cost_actuals, profit_center |

## Data model in one paragraph

Cost centers, internal orders and profit centers are master data modules (cost and profit centers filtered to the interval valid today). Actual costs come from the Universal Journal lines with a controlling area; the G/L account type separates primary ('P') from secondary ('S') costs. The cost center report compares year-to-date costs with the same periods of the prior year. Plan values are not included yet.

## Modules (5 modules, 17 views)

| Module | Batch | Hard dependencies | Views |
|---|---|---|---|
| `cost_center` | 1 | - | `ZCOV_I_CostCenterText`, `ZCOV_I_CostCenter`, `ZCOV_I_CostCenterVH`, `ZCOV_R_CostCenter`, `ZCOV_C_CostCenterQ` |
| `internal_order` | 1 | - | `ZCOV_I_InternalOrder`, `ZCOV_I_InternalOrderVH`, `ZCOV_R_InternalOrder`, `ZCOV_C_InternalOrderQ` |
| `profit_center` | 1 | - | `ZCOV_I_ProfitCenterText`, `ZCOV_I_ProfitCenter`, `ZCOV_I_ProfitCenterVH` |
| `cost_actuals` | 2 | - | `ZCOV_I_COJournalItem`, `ZCOV_R_COActualCost`, `ZCOV_C_COActualCostQ` |
| `rpt_cost_center_ytd` | 3 | `cost_actuals` | `ZCOV_R_CostCenterYTD`, `ZCOV_C_CostCenterYTDQ` |

## Commands

```bash
python3 tools/check_all.py --only co
python3 build_package.py --product co --list
python3 build_package.py --product co --all --prefix ZACME_ --package ZACME_CO
```
