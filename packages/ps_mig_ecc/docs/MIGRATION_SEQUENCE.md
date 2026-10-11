# Migration sequence

> Version **1.0.0**

Load order derived from `sequence_after`. Objects on the same level can be loaded in parallel; objects that refer to other objects load after them.

| Level | Modules | Consumption views read by the load program |
|---|---|---|
| 1 | [`project`](mapping/project.md) | `ZPSX_C_ProjectMig` |
| 2 | [`wbs_element`](mapping/wbs_element.md) | `ZPSX_C_WBSMig`, `ZPSX_C_WBSHierarchyMig` |
| 3 | [`budget`](mapping/budget.md), [`commitment`](mapping/commitment.md), [`investment_measure`](mapping/investment_measure.md), [`network`](mapping/network.md), [`project_cost`](mapping/project_cost.md) | `ZPSX_C_OverallBudgetMig`, `ZPSX_C_AnnualBudgetMig`, `ZPSX_C_CommitmentMig`, `ZPSX_C_InvestProgramMig`, `ZPSX_C_InvestPositionMig`, `ZPSX_C_InvestAssignMig`, `ZPSX_C_NetworkHeaderMig`, `ZPSX_C_NetworkPlanMig`, `ZPSX_C_NetworkActivitMig`, `ZPSX_C_NetworkQuantitMig`, `ZPSX_C_ProjectCostMig` |
