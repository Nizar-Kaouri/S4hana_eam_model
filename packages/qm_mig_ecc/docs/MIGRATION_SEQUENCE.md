# Migration sequence

> Version **1.0.0**

Load order derived from `sequence_after`. Objects on the same level can be loaded in parallel; objects that refer to other objects load after them.

| Level | Modules | Consumption views read by the load program |
|---|---|---|
| 1 | [`inspection_lot`](mapping/inspection_lot.md), [`inspection_plan`](mapping/inspection_plan.md), [`master_inspection_characteristic`](mapping/master_inspection_characteristic.md), [`quality_notification`](mapping/quality_notification.md), [`sampling_procedure`](mapping/sampling_procedure.md) | `ZQMX_C_InspectionLotMig`, `ZQMX_C_UsageDecisionMig`, `ZQMX_C_InspectPlanHeaMig`, `ZQMX_C_InspectPlanMatMig`, `ZQMX_C_InspectPlanSelMig`, `ZQMX_C_InspectPlanOpeMig`, `ZQMX_C_PlanCharacteriMig`, `ZQMX_C_MasterCharMig`, `ZQMX_C_MasterCharTextMig`, `ZQMX_C_QualityNotificMig`, `ZQMX_C_QualityItemMig`, `ZQMX_C_QualityCauseMig`, `ZQMX_C_QualityTaskMig`, `ZQMX_C_QualityActivitMig`, `ZQMX_C_SamplingProcMig` |
| 2 | [`inspection_result`](mapping/inspection_result.md) | `ZQMX_C_InspectCharactMig`, `ZQMX_C_CharacteristicMig`, `ZQMX_C_SingleResultMig` |
