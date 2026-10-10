# Migration sequence

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been run on a system.

Load order derived from `sequence_after`. Objects on the same level can be loaded in parallel; objects that refer to other objects load after them.

| Level | Modules | Consumption views read by the load program |
|---|---|---|
| 1 | [`project`](mapping/project.md) | `ZPSX_C_ProjectMig` |
| 2 | [`wbs_element`](mapping/wbs_element.md) | `ZPSX_C_WBSMig`, `ZPSX_C_WBSHierarchyMig` |
| 3 | [`project_cost`](mapping/project_cost.md) | `ZPSX_C_ProjectCostMig` |
