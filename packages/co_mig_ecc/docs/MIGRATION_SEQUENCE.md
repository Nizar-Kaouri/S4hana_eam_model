# Migration sequence

> Version **1.0.0**

Load order derived from `sequence_after`. Objects on the same level can be loaded in parallel; objects that refer to other objects load after them.

| Level | Modules | Consumption views read by the load program |
|---|---|---|
| 1 | [`cost_element`](mapping/cost_element.md), [`profit_center`](mapping/profit_center.md) | `ZCOX_C_CostElementMig`, `ZCOX_C_CostElementAreMig`, `ZCOX_C_CostElementTextMig`, `ZCOX_C_CostElementLongTextMig`, `ZCOX_C_ProfitCenterMig`, `ZCOX_C_ProfitCenterTeMig`, `ZCOX_C_ProfitCtrLongTextMig` |
| 2 | [`cost_center`](mapping/cost_center.md) | `ZCOX_C_CostCenterMig`, `ZCOX_C_CostCenterTextMig`, `ZCOX_C_CostCenterLongTextMig` |
| 3 | [`allocation_cycle`](mapping/allocation_cycle.md), [`internal_order`](mapping/internal_order.md) | `ZCOX_C_AllocCycleMig`, `ZCOX_C_AllocSegmentMig`, `ZCOX_C_InternalOrderMig`, `ZCOX_C_OrderSettlemenMig`, `ZCOX_C_OrderStatusMig`, `ZCOX_C_OrderPartnerMig`, `ZCOX_C_OrderUserStatusMig`, `ZCOX_C_OrderLongTextMig` |
| 4 | [`cost_actuals`](mapping/cost_actuals.md), [`planning`](mapping/planning.md) | `ZCOX_C_CostActualMig`, `ZCOX_C_PrimaryPlanMig`, `ZCOX_C_SecondaryPlanMig` |
