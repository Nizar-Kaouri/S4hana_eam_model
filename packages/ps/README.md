# Project System (PS) - CDS virtual data model

> **Status: draft-unverified.** Written without an SAP system; nothing has been activated or tested.
> Every uncertain element carries a `TODO-VERIFY` marker, ranked in [`BATCH_REPORT.md`](BATCH_REPORT.md).

| | |
|---|---|
| Product folder | `packages/ps` |
| Object prefix | `ZPSV_` (replaced per customer by the build) |
| ABAP package | `ZPSV_VDM` |
| Target release | SAP S/4HANA 2025 (on-premise / Private Cloud Edition) |
| Entity map | [`docs/model_map.html`](docs/model_map.html) |

Same architecture and rules as the EAM product (see `packages/eam/README.md`): basic `ZPSV_I_*`,
composite `ZPSV_R_*` (cubes), consumption `ZPSV_C_*Q` (analytical queries); one self-contained module
per business object; hard dependencies added by the build. **Link views are not built yet** (planned for
the end, together with the cross-product links).

## Data model in one paragraph

Projects come from `I_EnterpriseProject`, WBS elements from `I_WBSElement`, costs from the Universal Journal lines that carry a WBS element. Settlement postings are flagged so that the cube shows cost before settlement, settlement and the remaining balance. The cost-to-date report sums everything up to a key date per WBS element. Plan and budget values are not included yet.

## Modules (4 modules, 13 views)

| Module | Batch | Hard dependencies | Views |
|---|---|---|---|
| `project` | 1 | - | `ZPSV_I_Project`, `ZPSV_I_ProjectVH`, `ZPSV_R_Project`, `ZPSV_C_ProjectQ` |
| `wbs_element` | 1 | - | `ZPSV_I_WBSElement`, `ZPSV_I_WBSElementVH`, `ZPSV_R_WBSElement`, `ZPSV_C_WBSElementQ` |
| `project_cost` | 2 | - | `ZPSV_I_ProjectJournalItem`, `ZPSV_R_ProjectCost`, `ZPSV_C_ProjectCostQ` |
| `rpt_project_cost_to_date` | 3 | `project_cost` | `ZPSV_R_ProjectCostToDate`, `ZPSV_C_ProjectCostToDateQ` |

## Commands

```bash
python3 tools/check_all.py --only ps
python3 build_package.py --product ps --list
python3 build_package.py --product ps --all --prefix ZACME_ --package ZACME_PS
```
