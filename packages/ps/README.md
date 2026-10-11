# Project System (PS) - CDS virtual data model

Naming: **B_ = Basic, I_ = Interface (Composite), C_ = Consumption**. See [naming guidance](../../docs/NAMING.md).

> **Status: draft-unverified.** Written without an SAP system; nothing has been activated or tested.
> Every uncertain element carries a `TODO-VERIFY` marker, ranked in [`BATCH_REPORT.md`](BATCH_REPORT.md).

| | |
|---|---|
| Product folder | `packages/ps` |
| Object prefix | `ZPSV_` (replaced per customer by the build) |
| ABAP package | `ZPSV_VDM` |
| Target release | SAP S/4HANA 2025 (on-premise / Private Cloud Edition) |
| Entity map | [`docs/model_map.html`](docs/model_map.html) |

Same architecture and rules as the EAM product (see `packages/eam/README.md`): basic `ZPSV_B_*`,
composite `ZPSV_I_*` (cubes), consumption `ZPSV_C_*Q` (analytical queries); one self-contained module
per business object; hard dependencies added by the build. **3 intra-product link object(s)** ship
only when all their modules are selected; links to other products live in `packages/bridge`.

## Link views (ship only when all listed modules are selected)

| Link object | Requires modules |
|---|---|
| `ZPSV_C_ProjectCostMasterQ` | project, project_cost, wbs_element |
| `ZPSV_B_ProjectWithWBSElement` | project, wbs_element |
| `ZPSV_I_ProjectCostWithMaster` | project, project_cost, wbs_element |

## Data model in one paragraph

Projects come from `I_EnterpriseProject`, WBS elements from `I_WBSElement`, costs from the Universal Journal lines that carry a WBS element. Settlement postings are flagged so that the cube shows cost before settlement, settlement and the remaining balance. The cost-to-date report sums everything up to a key date per WBS element. Plan and budget values are not included yet.

## Modules (4 modules, 13 views)

| Module | Batch | Hard dependencies | Views |
|---|---|---|---|
| `project` | 1 | - | `ZPSV_B_Project`, `ZPSV_B_ProjectVH`, `ZPSV_I_Project`, `ZPSV_C_ProjectQ` |
| `wbs_element` | 1 | - | `ZPSV_B_WBSElement`, `ZPSV_B_WBSElementVH`, `ZPSV_I_WBSElement`, `ZPSV_C_WBSElementQ` |
| `project_cost` | 2 | - | `ZPSV_B_ProjectJournalItem`, `ZPSV_I_ProjectCost`, `ZPSV_C_ProjectCostQ` |
| `rpt_project_cost_to_date` | 3 | `project_cost` | `ZPSV_I_ProjectCostToDate`, `ZPSV_C_ProjectCostToDateQ` |

## Commands

```bash
python3 tools/check_all.py --only ps
python3 build_package.py --product ps --list
python3 build_package.py --product ps --all --prefix ZACME_ --package ZACME_PS
```
